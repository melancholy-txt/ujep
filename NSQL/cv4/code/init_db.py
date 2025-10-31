import redis
import uuid

r = redis.Redis(host='redis', port=6379)

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

for kocka in kocky:
    r.hset(f"kocka:{kocka['id']}", mapping=kocka)
print("Initial data loaded!")