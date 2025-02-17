# Seznam klientů
clients = [
    {
        "name": "Jan Novak",
        "email": "jan.novak@example.com",
        "stocks": {
            "AAPL": 50,
            "TSLA": 10,
            "MSFT": 20
        }
    },
    {
        "name": "Petra Kralova",
        "email": "petra.kralova@example.com",
        "stocks": {
            "GOOGL": 15,
            "AMZN": 5,
            "AAPL": 30
        }
    },
    {
        "name": "Marek Svoboda",
        "email": "marek.svoboda@example.com",
        "stocks": {
            "NFLX": 7,
            "TSLA": 12,
            "NVDA": 8
        }
    },
    {
        "name": "Simona Hrubá",
        "email": "simona.hruba@example.com",
        "stocks": {
            "META": 18,
            "AMZN": 25,
            "MSFT": 30
        }
    },
    {
        "name": "Pavel Maly",
        "email": "pavel.maly@example.com",
        "stocks": {
            "TSLA": 40,
            "AAPL": 20,
            "GOOGL": 5
        }
    },
    {
        "name": "Anna Veselá",
        "email": "anna.vesela@example.com",
        "stocks": {
            "NVDA": 12,
            "NFLX": 15,
            "AMZN": 10
        }
    },
    {
        "name": "Lukas Dvorak",
        "email": "lukas.dvorak@example.com",
        "stocks": {
            "AAPL": 60,
            "GOOGL": 30,
            "META": 25
        }
    },
    {
        "name": "Alena Zemanova",
        "email": "alena.zemanova@example.com",
        "stocks": {
            "TSLA": 22,
            "NFLX": 9,
            "AMZN": 40
        }
    },
    {
        "name": "Tomas Novak",
        "email": "tomas.novak@example.com",
        "stocks": {
            "MSFT": 35,
            "META": 12,
            "NVDA": 6
        }
    },
    {
        "name": "Iva Kovarikova",
        "email": "iva.kovarikova@example.com",
        "stocks": {
            "AAPL": 45,
            "GOOGL": 28,
            "TSLA": 15
        }
    }
]

apple_clients = []

for client in clients:
    if "AAPL" in client["stocks"].keys() and client["stocks"]["AAPL"] > 10:
        apple_clients.append(client)

print(apple_clients)