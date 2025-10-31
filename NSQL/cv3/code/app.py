from flask import Flask, render_template, request, redirect
import redis
import uuid

app = Flask(__name__)

# Enable automatic decoding of responses
r = redis.Redis(host='redis', port=6379, decode_responses=True)


# Modified Redis storage
# for kocka in kocky:
#     r.hset(f"kocka:{kocka['id']}", mapping=kocka)



@app.route("/")
@app.route("/home")
def zobraz_home():
    return render_template("home.html")

@app.route("/seznamkocek")
def zobraz_kocky():
    kocka_keys = r.keys("kocka:*")
    all_kocky = []
    
    for key in kocka_keys:
        kocka = r.hgetall(key)
        kocka['kocka'] = key.split(':')[1]  # Add ID directly
        all_kocky.append(kocka)
    
    return render_template("kocky.html", data=all_kocky)

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
        data[key] = r.hgetall(key)
    return str(data)

@app.route("/wipe")
def wipe_kocky():
    kocka_keys = r.keys("kocka:*")
    if kocka_keys:
        r.delete(*kocka_keys)
    return "kocky byli vymazani :("

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)