java_distr <- rJavaEnv::java_download(21)
java_home <- rJavaEnv::java_install(java_distr)

print(java_home)

rJavaEnv::java_check_version_cmd() #
rJavaEnv::java_check_version_rjava() # the internals of the function are basically below

Sys.getenv("JAVA_HOME")

# Check Java version if JAVA_HOME
# is set to '/home/rstudio/.cache/R/rJavaEnv/installed/linux/x64/21'
# in a separate (but child) R process
r_script <- "
tryCatch({
    java_home <- '/home/rstudio/.cache/R/rJavaEnv/installed/linux/x64/21'
    Sys.setenv(JAVA_HOME = java_home)
    old_path <- Sys.getenv('PATH')
    new_path <- file.path(java_home, 'bin')
    Sys.setenv(PATH = paste(new_path, old_path, sep = .Platform$path.sep))
    suppressWarnings(rJava::.jinit())
    suppressWarnings(java_version <- rJava::.jcall('java.lang.System', 
      'S', 'getProperty', 'java.version'))
    message <- cli::format_message('rJava and other rJava/Java-based packages will use Java version: {.val {java_version}}')
    print(message)
}, error = function(e) {
    message <- cli::format_message('An error occurred: {.val {e$message}}')
    print(message)
})
"


script_file <- tempfile(fileext = ".R")
writeLines(r_script, script_file)

output <- system2("Rscript", args = script_file, stdout = TRUE, stderr = TRUE)

cat(output, sep = "\n")
file.remove(script_file)


# Check Java version if JAVA_HOME
# is set to '/home/rstudio/.cache/R/rJavaEnv/installed/linux/x64/21'
# in the current R session
rJava::.jinit()
rJava::.jcall("java.lang.System", "S", "getProperty", "java.version")



