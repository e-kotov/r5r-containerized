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

remotes::install_github("e-kotov/rJavaEnv", force = TRUE, dependencies = TRUE)

rJavaEnv::java_quick_install(
  version = 21,
  distribution = 'Corretto')

# check if Java was successfully installed
rJavaEnv::java_check_version_rjava()

