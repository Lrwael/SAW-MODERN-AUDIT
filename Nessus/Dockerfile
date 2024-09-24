FROM ubuntu:20.04
RUN apt-get update && apt-get install -y curl wget
RUN curl --request GET \
  --url 'https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.8.3-ubuntu1604_amd64.deb' \
  --output 'Nessus-10.8.3-ubuntu1604_amd64.deb'
RUN dpkg -i Nessus-10.8.3-ubuntu1604_amd64.deb
EXPOSE 8834
ENTRYPOINT ["/bin/bash"]
