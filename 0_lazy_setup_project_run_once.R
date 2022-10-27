dir <- "C:\\Users\\125295_admin\\My Drive (simon.knight@uts.edu.au)\\research projects\\r projects\\creds_bibliometrics"

usethis::create_from_github("sjgknight/CREDS_project", dir)

gitignore::gi_write_gitignore(gitignore::gi_fetch_templates("r", "python"), gitignore_file = paste0(dir,".gitignore"))

gitignore::gi_write_gitignore("\n#gdrive files \n*.ini \n\n#data folder\n\ndata\\", gitignore_file = paste0(dir,".gitignore"))

