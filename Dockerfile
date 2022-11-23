FROM ubuntu:20.04
ENV DEBIAN_FRONTEND=noninteractive 
COPY start.sh /start.sh
RUN chmod 777 start.sh

COPY run-emulator.sh /run-emulator.sh
RUN chmod 777 run-emulator.sh
CMD ["/bin/bash"]

# Expose Port for the Application 
EXPOSE 80 443