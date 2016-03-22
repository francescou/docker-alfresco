FROM centos:7

WORKDIR /opt
RUN yum install -y https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/chefdk-0.10.0-1.el7.x86_64.rpm
ADD https://github.com/Alfresco/chef-alfresco/archive/newtomcat.tar.gz .
RUN tar -xvf newtomcat.tar.gz

WORKDIR chef-alfresco-newtomcat
ENV LC_CTYPE en_US.UTF-8
RUN yum install -y git
RUN berks vendor
RUN mkdir /etc/chef/
RUN mv berks-cookbooks/ /etc/chef/cookbooks

WORKDIR /etc/chef
COPY attributes.json .
RUN  chef-client -z -j attributes.json
RUN sed -i s/autostart=false/autostart=true/g /etc/supervisor.d/tomcat-alfresco.conf
RUN sed -i s/\"$/\ \$JAVA_OPTS\"/g /usr/share/tomcat-multi/alfresco/bin/setenv.sh

# cleanup
RUN rm -r /etc/chef/
RUN rm -r /var/tmp/
RUN rm -r /root/.chef/
RUN rm -r /root/.m2/
RUN rm -r /root/.berkshelf/
RUN rm -r /opt/chefdk/
RUN yum clean all
