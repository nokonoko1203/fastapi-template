FROM python:3.12-slim-bullseye as base

FROM base as builder
WORKDIR /app/
RUN apt update -y && pip3 install poetry
COPY pyproject.toml poetry.lock /app/

ARG POETRY_EXPORT_OPTIONS="--without dev"
RUN poetry export $POETRY_EXPORT_OPTIONS --without-hashes --no-interaction --no-ansi -f requirements.txt -o requirements.txt
RUN pip install --prefix=/runtime --force-reinstall -r requirements.txt

FROM base as runtime
COPY --from=public.ecr.aws/awsguru/aws-lambda-adapter:0.7.0 /lambda-adapter /opt/extensions/lambda-adapter
WORKDIR /app/
COPY --from=builder /runtime /usr/local
COPY . /app
ENV PYTHONPATH=/app/src
ENV PORT=8080

CMD ["uvicorn", "sample:app", "--host", "0.0.0.0", "--port", "8080", "--workers", "1"]
