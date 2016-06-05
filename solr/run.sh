#! /bin/bash

docker run -u tomcat --rm --name solr \
  -v $(pwd)/alfresco.log:/alfresco.log \
  -v $(pwd)/logs/:/usr/share/tomcat-multi-7.0.59/solr/logs \
  -p 8090:8090 \
  francescou/alfresco-solr 
