FROM alpine:3.20 as prod

RUN set -eux; \
    apk update; \
    apk add tzdata icu-data-full; \
    cat "/usr/share/zoneinfo/UTC" > /etc/localtime; \
    apk del tzdata; \
    addgroup -S 1000; \
    adduser -D -S -u 1000 -G 1000 -h /home/dockeruser -s /bin/sh dockeruser;

CMD [ "bash" ]

###########################################################

FROM prod as dev

RUN set -eux; \
    apk add exa git zsh-vcs zsh zsh-autosuggestions zsh-syntax-highlighting;

COPY docker/ /ohmyzsh/

RUN set -eux; \
    wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh; \
    ZSH=/ohmyzsh/.oh-my-zsh sh install.sh --unattended --keep-zshrc; \
    rm ./install.sh; \
    git clone https://github.com/spaceship-prompt/spaceship-prompt.git "/ohmyzsh/.oh-my-zsh/themes/spaceship-prompt" --depth=1; \
    ln -s "/ohmyzsh/.oh-my-zsh/themes/spaceship-prompt/spaceship.zsh-theme" "/ohmyzsh/.oh-my-zsh/themes/spaceship.zsh-theme"

RUN apk del git \
    && chmod +x /ohmyzsh/docker-entrypoint \
    && cp /ohmyzsh/zsh/.[^.]* /root/ \
    && mv /ohmyzsh/zsh/.[^.]* /home/dockeruser/ \
    && chown -R 1000:1000 /home/dockeruser/ \
    && rm -rf /var/cache/apk/*

CMD [ "/ohmyzsh/docker-entrypoint" ]
