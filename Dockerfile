FROM rocker/binder:4.4.0
COPY --chown=${NB_USER} . ${HOME}
RUN if [ -f install.R ]; then R --quiet -f install.R; fi
USER root
RUN R CMD javareconf
USER rstudio
RUN R -e 'rJavaEnv::java_check_version_rjava()'
