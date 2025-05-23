#Step 1: render the csasdown project
# (working directory must be set to Framework/DataInputs/csasdown)
setwd("D:/Github/Framework/RefPts/csasdown/")
csasdown::render()
# Step 2: Add initial pages of a typical resdoc (title page, etc.)
frontmatter <- officer::read_docx(path = "templates/RES2021-eng-frontmatter.docx")
resdoc <- "_book/resdoc-english.docx"
x <- officer::body_add_docx(frontmatter, resdoc, pos = "before")
# Step 3: Add table of contents
x <- officer::cursor_reach(x, keyword = "TABLE OF CONTENTS")
x <- officer::body_add_toc(x)
# Step 4: print with TOC and Body text
print(x, target = "_book/resdoc-english.docx")
# Add appendix with diff numbering if necessary
#rmarkdown::render("05-appendix.Rmd")
#appendix <- "05-appendix.docx"
resdoc <- officer::read_docx(path = "_book/resdoc-english.docx")
#x <- officer::body_add_docx(resdoc, appendix)
# Step 4: Save
# If error message, look for temp file in RStudio Files panel. Select box, and delete in Rstudio. Temp file may not be visible in File explorer.
print(x, target = "_book/final_resdoc.docx")
