FROM swipl:stable
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
# install dependency
RUN swipl -g "pack_install(list_util, [interactive(false), silent(true)])." -t halt.
COPY . /usr/src/app
