FROM python:3.11-slim

ENV PYTHONUNBUFFERED=1
ENV POETRY_VERSION=1.6.1

RUN apt-get update && apt-get install -y curl build-essential \
  && curl -sSL https://install.python-poetry.org | python3 - \
  && ln -s /root/.local/bin/poetry /usr/local/bin/poetry

WORKDIR /app

COPY pyproject.toml poetry.lock README.md ./
COPY definitions.jsonl ./
COPY src ./src

# Install dependencies
RUN poetry config virtualenvs.create false && poetry install --no-interaction --no-ansi

EXPOSE 8000
CMD ["uvicorn", "src.api:app", "--host", "0.0.0.0", "--port", "8000"]
