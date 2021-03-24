FROM alpine:3.13

RUN set -eux; \
    apk update; \
    apk add exa tzdata git zsh zsh-autosuggestions zsh-syntax-highlighting; \
    cat "/usr/share/zoneinfo/UTC" > /etc/localtime

COPY docker/ /ohmyzsh/

RUN set -eux; \
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh; \
    ZSH=/ohmyzsh/.oh-my-zsh sh install.sh --unattended --keep-zshrc; \
    apk del git tzdata; \
    rm ./install.sh

RUN addgroup -S 1000 \
    && adduser -D -S -u 1000 -G 1000 -h /home/dockeruser -s /bin/sh dockeruser

RUN mv /ohmyzsh/nord.zsh-theme /ohmyzsh/.oh-my-zsh/custom/themes/ \
    && chmod +x /ohmyzsh/docker-entrypoint \
    && cp /ohmyzsh/zsh/.[^.]* /root/ \
    && mv /ohmyzsh/zsh/.[^.]* /home/dockeruser/ \
    && chown -R 1000:1000 /home/dockeruser/ \
    && rm -rf /var/cache/apk/*

CMD [ "/ohmyzsh/docker-entrypoint" ]
