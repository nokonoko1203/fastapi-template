.PHONY: help init run stop test

help: ## このヘルプを表示
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

old ?= "sample"
new ?= "sample"

init: ## 初期化
	rm -rf ./api/venv ./api/poetry.lock .git
	which poetry || pip3 install poetry
	./rename.sh $(old) $(new)
	cd api && poetry install

run: ## 開発環境を起動
	docker compose up -d --build

stop: ## 開発環境を停止
	docker compose down

test: ## テスト
	docker compose up -d --build
	docker compose exec api pytest -v

format: ## フォーマット
	cd api; poetry run ruff check --fix --extend-select F401,F841 src/*
