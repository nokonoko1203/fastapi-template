FROM opensearchproject/opensearch:2.11.1
EXPOSE 9200 9300

ENV cluster.name opensearch-cluster
ENV node.name opensearch-node
ENV discovery.type single-node
ENV OPENSEARCH_JAVA_OPTS "-Xms512m -Xmx512m"

RUN /usr/share/opensearch/bin/opensearch-plugin install analysis-kuromoji && /usr/share/opensearch/bin/opensearch-plugin install analysis-icu
