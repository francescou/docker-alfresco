FROM centos:7

COPY attributes.json /etc/chef/
ENV LC_CTYPE en_US.UTF-8
ADD https://github.com/francescou/chef-alfresco/archive/newtomcat.tar.gz /opt/

RUN yum install -y https://opscode-omnibus-packages.s3.amazonaws.com/el/7/x86_64/chefdk-0.10.0-1.el7.x86_64.rpm && \
  yum install -y git && \
  tar -xvf /opt/newtomcat.tar.gz && \
  cd chef-alfresco-newtomcat && \
  berks vendor && \
  mv berks-cookbooks/ /etc/chef/cookbooks && \
  cd /etc/chef/ && chef-client -z -j /etc/chef/attributes.json
RUN rm -r /etc/chef/ /var/tmp/ /root/.chef/  /root/.m2/ /root/.berkshelf/  /opt/chefdk/ && \
  yum clean all

RUN sed -i s/\"$/\ \$JAVA_OPTS\"/g /usr/share/tomcat-multi/solr/bin/setenv.sh

ENV CATALINA_BASE /usr/share/tomcat-multi/solr/

USER tomcat
ENTRYPOINT /usr/share/tomcat-multi/bin/catalina.sh run
