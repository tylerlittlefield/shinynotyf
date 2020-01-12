icons <- unlist(strsplit(gsub("'", "", readLines(system.file("extdata", "icons.txt", package = "shinynotyf"))), ","))
icons_list <- as.list(icons)
names(icons_list) <- icons
icons <- icons_list
usethis::use_data(icons)
