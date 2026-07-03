# Use a slim Python base image
FROM python:3.12-slim

# Install curl for the Streamlit healthcheck
RUN apt-get update && apt-get install -y curl && rm -rf /var/lib/apt/lists/*

# Copy the uv binary directly from Astral's official image
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

# Speed up installations and optimize container size
ENV UV_COMPILE_BYTECODE=1
ENV UV_LINK_MODE=copy

# 1. Copy only the dependency files first (for optimal Docker layer caching)
COPY pyproject.toml uv.lock ./

# 2. Install dependencies without installing the project itself yet
RUN uv sync --frozen --no-install-project

# 3. Copy the rest of your application code
COPY . .

# 4. Sync again to install the project
RUN uv sync --frozen

EXPOSE 8501

HEALTHCHECK CMD curl --fail http://localhost:8501/_stcore/health

# Run the app inside uv's managed virtual environment
# Note: Change "app.py" to the actual name of your main Streamlit file
ENTRYPOINT ["uv", "run", "streamlit", "run", "app.py", "--server.port=8501", "--server.address=0.0.0.0"]