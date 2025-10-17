from flask import Flask, render_template

app = Flask(__name__)

@app.route("/")
@app.route("/home")
def zobraz_home():
    return render_template("home.html")

@app.route("/seznamkocek")
def zobraz_kocky():
    return render_template("kocky.html")

@app.route("/kontakt")
def zobraz_kontaktni_formular():
    return render_template("kontakt.html")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)