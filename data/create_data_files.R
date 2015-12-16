## This script takes the .csv data files and creates the .JSON files that
## the visualization uses.
library('jsonlite')

## Assuming your WD is the data folder! The student nodes are used in each
## of the JSON files, appended to the specific nodes for that file.
student_nodes <- read.table("student_nodes.csv", header=TRUE, sep=",",
                            stringsAsFactors=FALSE)
method_nodes <- read.table("method_nodes.csv", header=TRUE, sep=",",
                            stringsAsFactors=FALSE)
method_links <- read.table("method_links.csv", header=TRUE, sep=",",
                            stringsAsFactors=FALSE)

## Merge the nodes for each file, test for missing data, and then create
## json and write to file.
method_nodes2 <- rbind(student_nodes, method_nodes)
which.missing.ids <-
    which(!unique(unlist(method_links)) %in% unique(method_nodes2$id))
if(length(which.missing.ids)>0)
       stop(paste("Method IDs in links not in nodes:",
     paste0(unique(unlist(method_links))[which.missing.ids], collapse=', ')))
x <- c("{ \"nodes\":", toJSON(method_nodes2), ", \"links\":", toJSON(method_links), "}")
write(x, 'methods.json')

