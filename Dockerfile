FROM rabbitmq
MAINTAINER LMC(chuc.le@axonactive.com)

# Define environment variables.
ENV RABBITMQ_USER test
ENV RABBITMQ_PASSWORD test

# Create Rabbitmq user
RUN ( sleep 5 ; \
rabbitmqctl add_user $RABBITMQ_USER $RABBITMQ_PASSWORD 2>/dev/null ; \
rabbitmqctl set_user_tags $RABBITMQ_USER administrator ; \
rabbitmqctl set_permissions -p / $RABBITMQ_USER  ".*" ".*" ".*" ; \
echo "*** User '$RABBITMQ_USER' with password '$RABBITMQ_PASSWORD' completed. ***" ; \
echo "*** Log in the WebUI at port 15672 (example: http:/localhost:15672) ***") ;

# $@ is used to pass arguments to the rabbitmq-server command.
# For example if you use it like this: docker run -d rabbitmq arg1 arg2,
# it will be as you run in the container rabbitmq-server arg1 arg2
RUN rabbitmq-server $@

EXPOSE 15672
# Define default command
CMD ["rabbitmq-server"]