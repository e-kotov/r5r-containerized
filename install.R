remotes::install_github("e-kotov/rJavaEnv", force = TRUE, dependencies = TRUE)

java_distr <- rJavaEnv::java_download(21)
java_home <- rJavaEnv::java_install(java_distr)

# check if Java was successfully installed
rJavaEnv::java_check_version_cmd(java_home)

pkgs <- c(
  'r5r',
  'accessibility',
  'ggplot2',
  'mapview',
  'dplyr',
  'h3jsr',
  'sf'
)

install.packages(pkgs)
