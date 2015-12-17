## This script takes the .csv data files and creates the .JSON files that
## the visualization uses.
library('jsonlite')

## Assuming your WD is the data folder! The student nodes are used in each
## of the JSON files, appended to the specific nodes for that file.
student_nodes <- read.table("student_nodes.csv", header=TRUE, sep=",",
                            stringsAsFactors=FALSE)
for(ii in c("methods", "collaborations", "ecosystems")){
    nodes <- read.table(paste0(ii, "_nodes.csv"), header=TRUE, sep=",",
                        stringsAsFactors=FALSE)
    links <- read.table(paste0(ii, "_links.csv"), header=TRUE, sep=",",
                        stringsAsFactors=FALSE)
    ## Merge the nodes for each file, test for missing data, and then
    ## create json and write to file.
    nodes2 <- rbind(student_nodes, nodes)
    which.missing.ids <-
        which(!unique(unlist(links)) %in% unique(nodes2$id))
    if(length(which.missing.ids)>0)
      stop(paste(ii,"IDs in links not in nodes:",
        paste0(unique(unlist(links))[which.missing.ids], collapse=', ')))
    x <- c("{ \"nodes\":", toJSON(nodes2), ", \"links\":", toJSON(links), "}")
    write(x, file=paste0(ii, '.json'))
}
