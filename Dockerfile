FROM python:3.12-slim

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl&& \
    rm -rf /var/lib/apt/lists/*

ENV RYE_HOME="/opt/rye"
ENV PATH="$RYE_HOME/shims:$PATH"

RUN curl -sSLf https://rye.astral.sh/get | RYE_INSTALL_OPTION="--yes" bash
COPY pyproject.toml README.md /app/

RUN rye sync
COPY . /app
EXPOSE 8000

CMD ["rye", "run", "uvicorn", "src.main:app","--host", "0.0.0.0", "--reload"]