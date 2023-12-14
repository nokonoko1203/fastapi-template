from typing import Annotated

from fastapi import Depends, Request
from opensearchpy import AsyncOpenSearch
from sample.config import settings


def get_opensearch(request: Request) -> AsyncOpenSearch:
    auth = (settings.opensearch_master_user, settings.opensearch_master_password)
    return AsyncOpenSearch(
        settings.opensearch_url,
        http_auth=auth,
        use_ssl=True,
        verify_certs=False,
        ssl_assert_hostname=False,
        ssl_show_warn=False,
    )


Opensearch = Annotated[AsyncOpenSearch, Depends(get_opensearch)]
