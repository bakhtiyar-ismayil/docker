FROM ubuntu
RUN apt update -y ;apt upgrade -y ;apt install socat -y
WORKDIR /task
COPY time_checker.sh /task
RUN chmod +x /task/time_checker.sh
CMD ["/task/time_checker.sh"]
