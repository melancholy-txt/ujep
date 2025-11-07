import time
from flask import Flask, render_template, request, redirect
import redis
import uuid
import pymongo
import json

app = Flask(__name__)

mongo_client = pymongo.MongoClient("mongodb://admin:admin@mongodb:27017/")  
db = mongo_client["kocky_db"]
kocky_collection = db["kocky_collection"]

# Enable automatic decoding of responses
r = redis.Redis(host='redis', port=6379, decode_responses=True)


# Modified Redis storage
# for kocka in kocky:
#     r.hset(f"kocka:{kocka['id']}", mapping=kocka)

def get_cached_page(cache_key, expire_time, render_func):
    """Get cached page or render and cache it"""
    cached_page = r.get(cache_key)
    
    if cached_page:
        app.logger.info(f"Page {cache_key} loaded from cache")
        return cached_page
    
    # Render the page
    response = render_func()
    
    # Cache the rendered HTML
    r.setex(cache_key, expire_time, response)
    app.logger.info(f"Page {cache_key} rendered and cached")
    
    return response

@app.route("/")
@app.route("/home")
def zobraz_home():
    return get_cached_page(
        "page:home",
        600,
        lambda: render_template("home.html")
    )

@app.route("/seznamkocek")
def zobraz_kocky():
    start_time = time.time()
    
    def render_page():
        all_kocky = list(kocky_collection.find())
        for kocka in all_kocky:
            kocka['kocka'] = str(kocka['_id'])
            kocka['_id'] = str(kocka['_id'])
        return render_template("kocky.html", data=all_kocky)
    
    response = get_cached_page("page:seznam", 300, render_page)
    
    load_time = time.time() - start_time
    app.logger.info(f"Seznam page loaded in {load_time*1000:.2f}ms")
    
    return response

@app.route("/kontakt", methods=["GET", "POST"])
def zobraz_kontaktni_formular():
    if request.method == "GET":
        return get_cached_page(
            "page:kontakt",
            600,
            lambda: render_template("kontakt.html")
        )
    elif request.method == "POST":
        nova_kocka = {
            "id": str(uuid.uuid4()),
            "jmeno": request.form["jmeno"],
            "barva srsti": request.form["barva srsti"],
            "vek": request.form["vek"]
        }
        kocky_collection.insert_one(nova_kocka)
        
        # Invalidate caches
        r.delete("page:seznam")
        r.delete("kocky_cache")
        
        return redirect("/seznamkocek")

# @app.route("/test")
# def test_route():
#     kocka_keys = r.keys("kocka:*")
#     data = {}
#     for key in kocka_keys:
#         data[key] = r.hgetall(key)
#     return str(data)

@app.route("/wipe")
def wipe_kocky():
    kocky_collection.delete_many({})
    # Invalidate cache
    r.delete("kocky_cache")
    return "kocky byli vymazani :("

@app.route("/testcache")
def test_with_cache():
    times = []
    for i in range(10):
        start = time.time()
        cached_data = r.get("kocky_cache")
        if cached_data:
            json.loads(cached_data)
        elapsed = time.time() - start
        times.append(elapsed * 1000)
    
    avg_time = sum(times) / len(times)
    return f"Average time WITH Redis cache: {avg_time:.2f}ms"

@app.route("/test")
def test_without_cache():
    times = []
    for i in range(10):
        start = time.time()
        all_kocky = list(kocky_collection.find())
        elapsed = time.time() - start
        times.append(elapsed * 1000)
    
    avg_time = sum(times) / len(times)
    return f"Average time WITHOUT Redis cache: {avg_time:.2f}ms"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)