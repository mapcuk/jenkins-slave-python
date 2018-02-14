FROM evarga/jenkins-slave
MAINTAINER Marsel Taipov mtaipov@iponweb.net
RUN apt-get update && apt-get install -y python3.4-venv
USER jenkins
ENV HOME=/home/jenkins
ADD --chown=jenkins:jenkins https://bootstrap.pypa.io/get-pip.py "${HOME}"

RUN python3 -m venv --without-pip "${HOME}/bsw-env" \
    && . "${HOME}/bsw-env/bin/activate" \
    && python3 "${HOME}/get-pip.py" \
    && rm "${HOME}/get-pip.py" \
    && printf '. "$HOME/bsw-env/bin/activate"\nexport PIP_FORMAT=columns' >> ${HOME}/.profile

USER root
