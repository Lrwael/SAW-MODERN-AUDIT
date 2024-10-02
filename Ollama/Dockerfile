FROM ubuntu:20.04
RUN apt-get update && apt-get install -y curl
RUN curl -sSL https://ollama.com/install.sh | sh
ENTRYPOINT ["/bin/bash"]
