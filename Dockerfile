FROM rabbitmq
MAINTAINER LMC(chuc.le@axonactive.com)

# Define environment variables.
ENV RABBITMQ_USER test
ENV RABBITMQ_PASSWORD test

COPY init.sh /init.sh
RUN chmod +x /init.sh

USER 1001

EXPOSE 15672
# Define default command
CMD ["/init.sh"]