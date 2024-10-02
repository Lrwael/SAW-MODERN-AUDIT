# Use Ubuntu as the base image
FROM ubuntu:20.04

# Install dependencies and download Nessus package
RUN apt-get update && apt-get install -y curl wget systemd

# Download the Nessus package
RUN curl --request GET \
  --url 'https://www.tenable.com/downloads/api/v2/pages/nessus/files/Nessus-10.8.3-ubuntu1604_amd64.deb' \
  --output 'Nessus-10.8.3-ubuntu1604_amd64.deb'

# Install Nessus
RUN dpkg -i Nessus-10.8.3-ubuntu1604_amd64.deb

# Set execute permission for the nessusd service
RUN chmod u+x /etc/init.d/nessusd

# Expose Nessus web interface port
EXPOSE 8834

# Start Nessus in the foreground
CMD ["/opt/nessus/sbin/nessus-service", "-D"]

