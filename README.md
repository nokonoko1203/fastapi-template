# sample

- FastAPI・OpenSearch・PostGISのDocker環境を構築するためのテンプレートです
- アプリケーションを構築しない場合でも、即座に立ち上がるOpenSearch・Kibana・PostGISの利用環境が即座に構築できます

## usage

- プロジェクト名の初期化
  - `< your_new_package_name >`には任意のパッケージ名を入力してください
    - 例: sample_api
  - `api/src/sample/`のフォルダ名が`< your_new_package_name >`に変更されます
  - そのほか、`api/pyproject.toml`や`api/Dockerfile`など、Pythonのパッケージ名・フォルダ名を指定している箇所をまとめて変更します
  - Pythonパッケージのインストールも行います

```bash
% make init new=< your_new_package_name >
```

- docker composeの起動

```bash
make run
```

- 起動の確認
  - `http://localhost:8080/docs`にアクセスして、FastAPIのドキュメントが表示されればOKです
  - `http://localhost:5601`にアクセスして、OpenSearch Dashboardsの画面が表示されればOKです
  - `https://localhost:9200`にアクセスして、OpenSearchからのレスポンスが確認できればOKです
