from flask import Flask, render_template, request, redirect
import redis
import uuid  # Add this import at the top

app = Flask(__name__)

r = redis.Redis(host='redis', port=6379)
kocky = [
    {
        "id": str(uuid.uuid4()),  # Add unique ID
        "jmeno": "minda",
        "barva srsti": "rezava",
        "vek": 2
    },
    {
        "id": str(uuid.uuid4()),
        "jmeno": "linda",
        "barva srsti": "cerna",
        "vek": 5
    },
    {
        "id": str(uuid.uuid4()),
        "jmeno": "pinda",
        "barva srsti": "strakata",
        "vek": 17
    },
    {
        "id": str(uuid.uuid4()),
        "jmeno": "zbynda",
        "barva srsti": "bílá",
        "vek": 10
    }
]

# Modified Redis storage
for kocka in kocky:
    r.hset(f"kocka:{kocka['id']}", mapping=kocka)



@app.route("/")
@app.route("/home")
def zobraz_home():
    return render_template("home.html")

@app.route("/seznamkocek")
def zobraz_kocky():
    r.hset(f"kocka:test", mapping={"jmeno": "test", "barva srsti": "modra", "vek": "3"})
    kocka_keys = r.keys("kocka:*")
    data = {}
    for key in kocka_keys:
        # Get the raw data
        raw_data = r.hgetall(key)
        # Decode both keys and values from bytes to strings
        decoded_data = {
            k.decode('utf-8'): v.decode('utf-8')
            for k, v in raw_data.items()
        }
        data[key.decode('utf-8')] = decoded_data
    print(data)
    return render_template("kocky.html", data=data)

@app.route("/kontakt", methods=["GET", "POST"])
def zobraz_kontaktni_formular():
    if request.method == "GET":
        return render_template("kontakt.html")
    elif request.method == "POST":
        nova_kocka = {
            "id": str(uuid.uuid4()),
            "jmeno": request.form["jmeno"],
            "barva srsti": request.form["barva srsti"],
            "vek": request.form["vek"]
        }
        kocky.append(nova_kocka)
        r.hset(f"kocka:{nova_kocka['id']}", mapping=nova_kocka)
        return redirect("/seznamkocek")
    
@app.route("/test")
def test_route():
    kocka_keys = r.keys("kocka:*")
    data = {}
    for key in kocka_keys:
        # Get the raw data
        raw_data = r.hgetall(key)
        # Decode both keys and values from bytes to strings
        decoded_data = {
            k.decode('utf-8'): v.decode('utf-8')
            for k, v in raw_data.items()
        }
        data[key.decode('utf-8')] = decoded_data
    return str(data)

@app.route("/wipe")
def wipe_kocky():
    kocka_keys = r.keys("kocka:*")
    if kocka_keys:
        r.delete(*kocka_keys)
    return "kocky byli vymazani :("

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)