import uuid
import pymongo

mongo_client = pymongo.MongoClient("mongodb://admin:admin@mongodb:27017/")  
db = mongo_client["kocky_db"]
kocky_collection = db["kocky_collection"]

kocky = [
    {
        "id": str(uuid.uuid4()),
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

kocky_collection.insert_many(kocky)
print("Initial data loaded!")