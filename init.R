

install.packages("igraph")
require("igraph")
load("~/Documents/GWU/16Spring/CSCI6907/Project1/astrocollab.Rdata")


astrocollab <- upgrade_graph(astrocollab)


# Central person:
# input: graph
# output: array of strings with 
#         names of nodes with the most neighbors
central_person <- function(graph) {
  
  d <-sort( degree(astrocollab), decreasing = TRUE)
  
  # Get the people with the most
  m <- max(d)
  n <- names(which( m == d ))
  return(n)
}
