FROM jboss/wildfly
RUN ls -ltr
RUN /opt/jboss/wildfly/bin/add-user.sh admin redhat --silent
ADD configuration/config-server.cli /opt/jboss/
RUN /opt/jboss/wildfly/bin/jboss-cli.sh --file=config-server.cli
RUN rm -rf /opt/jboss/wildfly/standalone/configuration/standalone_xml_history/*
ADD application/cluster.war /opt/jboss/wildfly/standalone/deployments/
EXPOSE 8080 9990 7600 8888
ENV POD_NAMESPACE test
