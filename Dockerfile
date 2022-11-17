FROM centos:7
#base image is from centos version7
LABEL maintainer="Engr Mimi"
#Label adds metadata to our image
RUN yum -y update && yum clean all
#&& will run the subsequent command in that line
#yum clean all will clean up the OS
RUN yum install -y httpd
#install apache who will create the /var/www/html/
COPY index.html /var/www/html/
#copy index.html file to where the website reads
EXPOSE 80
#PORT INSIDE CONTAINER
ENTRYPOINT [ "/usr/sbin/httpd" ] 
#start httpd. similar to systemctl start httpd
CMD [ "-D", "FOREGROUND" ]
#CMD will keep your container running
#Foreground means background