# URDB - DB Containers + SQLAlchemy

## Services
- MySQL (port 3306)
- MariaDB (port 3307)
- phpMyAdmin (http://localhost:8080)

## Quick start
```bash
docker compose up -d
```

phpMyAdmin login:
- Server: `mysql` or `mariadb`
- User: `root`
- Password: `password`

## SQLAlchemy example
```bash
pip install -r requirements.txt
python orm_example.py
```

Connection defaults (from `orm_example.py`):
- Host: `localhost`
- Port: `3306`
- User: `root`
- Password: `password`
- Database: `f1_database`

To target MariaDB instead:
```bash
DB_PORT=3307 python orm_example.py
```

To target a service name from another container on the same network:
```bash
DB_HOST=mysql python orm_example.py
```
