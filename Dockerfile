FROM rabbitmq
MAINTAINER LMC(chuc.le@axonactive.com)

# Define environment variables.
ENV RABBITMQ_USER test
ENV RABBITMQ_PASSWORD test

COPY init.sh /init.sh

ENV USER 1001
RUN chown 1001:0 /init.sh && chmod ug+rwx /init.sh
USER 1001

EXPOSE 15672
# Define default command
CMD ["/init.sh"]