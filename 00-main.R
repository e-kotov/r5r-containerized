# check java version
rJavaEnv::java_check_version_rjava()

# allocate RAM memory to Java
options(java.parameters = "-Xmx1G")

# 1) build transport network, pointing to the path where OSM and GTFS data are stored
library(r5r)
path <- system.file("extdata/poa", package = "r5r")

# debug setup_r5 once
debugonce(setup_r5)

# after running wait for ver check and print it
r5r_core <- setup_r5(data_path = path, verbose = FALSE)

# inside debug environment of setup_r5,
# both rJavaEnv::java_check_version_cmd() and
# rJavaEnv::java_check_version_rjava() get the correct version
# however the rJava::.jinit()
# ver <- rJava::.jcall("java.lang.System", "S", "getProperty",
#                      "java.version")
# picks up on system installed Java 11

# why?!

rJavaEnv::java_env_set(here::here("rjavaenv/linux/x64/21/"))
Sys.getenv("JAVA_HOME")

rJava::.jinit()
rJava::.jcall("java.lang.System", "S", "getProperty", "java.version")
