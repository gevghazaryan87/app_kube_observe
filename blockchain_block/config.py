import os

# Database and API Configuration

DB_CONFIG = {
    "dbname": os.getenv("DB_NAME", "appdb"),
    "user": os.getenv("DB_USER", "appuser"),
    "password": os.getenv("DB_PASSWORD", "apppassword"),
    "host": os.getenv("DB_HOST", "db"),
    "port": os.getenv("DB_PORT", "5432")
}

HEADERS = {
    "User-Agent": "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36"
}

# Data source provider: "blockstream" (default) or "mempool"
PROVIDER = os.getenv("PROVIDER", "blockstream")

# Fetch mode: "single" (default) or "multi" (round-robin)
FETCH_MODE = os.getenv("FETCH_MODE", "single")
