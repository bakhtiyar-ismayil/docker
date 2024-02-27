# Use an official Ubuntu as a parent image
FROM ubuntu 

# Set environment variables (optional)

# Update the package list and install essential packages
RUN apt-get update -y  
RUN apt-get upgrade -y 
RUN apt-get install apt-utils -y 
RUN apt-get install iproute2 -y 
RUN apt-get install vim -y
#    && rm -rf /var/lib/apt/lists/*


# Clean up
# RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the default command to run when the container starts
CMD ["/bin/bash"]

