# syntax = docker/dockerfile:experimental
FROM python:3.11.0-bullseye

ENV PYTHONFAULTHANDLER=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    #PYTHONPYCACHEPREFIX=/.pycache \
    # poetry:
    POETRY_VERSION=1.2.2 \
    POETRY_NO_INTERACTION=1 \
    PATH="$PATH:/root/.local/bin"

RUN --mount=type=cache,target=/root/cache/.pip \
  pip install --upgrade pip && \
  pip install pipx && \
  pipx install "poetry==$POETRY_VERSION"
