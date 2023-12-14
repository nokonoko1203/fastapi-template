from pydantic_settings import BaseSettings


class _Settings(BaseSettings):
    opensearch_url: str = "https://opensearch:9200"
    """OpenSearch の接続URL"""

    opensearch_master_user: str | None = "admin"
    """OpenSearch のマスターユーザー名"""

    opensearch_master_password: str | None = "admin"
    """OpenSearch のマスターパスワード"""


settings = _Settings()
