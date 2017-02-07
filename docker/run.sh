#!/usr/bin/env bash

if [[ ${USER} = "ucs" ]]; then
    /usr/lib/jvm/java-6-jdk/jre/bin/javaws /viewer.jnlp
else
    sudo -u ucs -g ucs /usr/lib/jvm/java-6-jdk/jre/bin/javaws /viewer.jnlp
fi
