FROM webdevops/php:7.4

ARG HOST_TYPE=default

RUN if [ $HOST_TYPE = "m1" ]; then \
        wget -O "/usr/local/bin/go-replace" "https://github.com/webdevops/goreplace/releases/download/1.1.2/gr-arm64-linux"; \
        chmod +x "/usr/local/bin/go-replace"; \
        "/usr/local/bin/go-replace" --version; \
    fi

RUN mkdir /home/application/.composer && \
    chown -R application: /home/application/.composer

WORKDIR /app
