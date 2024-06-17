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
