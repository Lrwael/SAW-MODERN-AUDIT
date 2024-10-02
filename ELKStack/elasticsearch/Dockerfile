# Elasticsearch Dockerfile
FROM docker.elastic.co/elasticsearch/elasticsearch:7.10.0

# Expose the default ports for Elasticsearch
EXPOSE 9200 9300

# Optional: Set environment variables for Elasticsearch configuration
ENV discovery.type=single-node

CMD ["elasticsearch"]
