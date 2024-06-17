FROM rocker/binder:4.4.0

COPY --chown=${NB_USER} . ${HOME}

RUN if [ -f install.R ]; then R --quiet -f install.R; fi

USER root

RUN JAVA_HOME=$(cat /home/rstudio/java_home.txt) && \
    export JAVA_HOME && \
    echo "JAVA_HOME=$JAVA_HOME" && \
    R CMD javareconf

USER rstudio

RUN R -e 'rJavaEnv::java_check_version_rjava()'
