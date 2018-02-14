FROM evarga/jenkins-slave
MAINTAINER Marsel Taipov taipovm@gmail.com
RUN apt-get update && apt-get install -y python3.4-venv mercurial
USER jenkins
ENV HOME=/home/jenkins
ADD --chown=jenkins:jenkins https://bootstrap.pypa.io/get-pip.py "${HOME}"

RUN python3 -m venv --without-pip "${HOME}/bsw-env" \
    && . "${HOME}/bsw-env/bin/activate" \
    && python3 "${HOME}/get-pip.py" \
    && rm "${HOME}/get-pip.py" \
    && pip install autopep8==1.3.2 \
                   coverage==4.3.4 \
                   factory-boy==2.8.1 \
                   flake8-docstrings==1.1.0 \
                   flake8==3.4.1 \
                   mock==2.0.0 \
                   prospector==0.12.7 \
                   pydocstyle==2.1.1 \
                   pyflakes==1.5.0 \
                   pytest-cov==2.5.1 \
                   pytest-django==3.1.2 \
                   pytest-flake8==0.8.1 \
                   pytest-pythonpath==0.7.1 \
                   pytest==3.0.7 \
                   requests-mock==1.2.0 \
    && printf '. "$HOME/bsw-env/bin/activate"\nexport PIP_FORMAT=columns\n' >> ${HOME}/.profile

USER root
