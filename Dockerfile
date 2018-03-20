FROM bitwalker/alpine-erlang:20.3.1
MAINTAINER jari@choicely.com

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Install app dependencies
ADD rel_alpine/choicely_votefront.tar.gz /app/

CMD PORT=8080 bin/choicely_votefront foreground

EXPOSE 8080
