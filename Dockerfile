FROM python:3.14-slim

COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR /app

COPY pyproject.toml uv.lock ./

RUN uv sync --frozen --no-dev --no-install-project

COPY src/ src/

ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 5001

CMD ["python", "src/app.py"]