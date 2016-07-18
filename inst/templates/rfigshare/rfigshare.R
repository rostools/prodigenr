# Steps to take in the Git repo:
# 1. Make new orphan branch (git checkout --orphan code)
# 2. Keep only R files and purl('vignette/maindocument.Rmd')
# 3. git commit the files
# 4. git archive --format=zip --output=code-archive.zip code
# 5. Then run the below code
id <- rfigshare::fs_new_article("Brief main title of project",
                     "Brief description of the code.",
                     type = "fileset",
                     # there was a problem with the authors...
                     # authors = c("First Last"),
                     tags = c("tags"),
                     categories = c("categories"),
                     links = "link to github",
                     files = "code-archive.zip",
                     visibility = "draft")
