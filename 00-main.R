rJavaEnv::java_quick_install(21)

# check java version
rJavaEnv::java_check_version_rjava()

# allocate RAM memory to Java
options(java.parameters = "-Xmx1G")

# 1) build transport network, pointing to the path where OSM and GTFS data are stored
library(r5r)
path <- system.file("extdata/poa", package = "r5r")

# after running wait for ver check and print it
r5r_core <- setup_r5(data_path = path, verbose = FALSE)

