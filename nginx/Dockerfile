# Use the official Nginx image from Docker Hub
FROM nginx
USER root
# Remove default Nginx configuration file
RUN apt update -y && apt upgrade -y && apt install vim  iproute2 zabbix-agent -y 

RUN sed -i 's/^Server=.*/Server=172.20.240.5/' /etc/zabbix/zabbix_agentd.conf && \
    sed -i 's/^ServerActive=.*/ServerActive=172.20.240.5/' /etc/zabbix/zabbix_agentd.conf

#RUN service zabbix-agent start
# Expose the Zabbix agent port (if needed)
EXPOSE 10050
# Copy custom Nginx configuration file

# Expose port 80 (the default port for HTTP traffic)
EXPOSE 80

# Start Nginx when the container launches
# Start Zabbix agent service
#CMD ["zabbix_agentd", "-f"]
# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh

# Make entrypoint script executable
RUN chmod +x /entrypoint.sh

# Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]

