

install.packages("igraph")
require("igraph")
load("astrocollab.Rdata")


astrocollab <- upgrade_graph(astrocollab)


# Central person:
# input: graph
# output: array of strings with 
#         names of nodes with the most neighbors
central_person <- function(graph) {
  
  d <-sort( degree(graph), decreasing = TRUE)
  
  # Get the people with the most
  m <- max(d)
  n <- names(which( m == d ))
  return(n)
}

# Simplify the graph
# First easy thing to be done would be to remove all the
# nodes that are isolates
remove_isolates <- function(graph) {
  
  d <- degree(graph)
  
  # find those that have zero neighbors
  new <- delete.vertices( graph, which( d == 0 ) )
  return( new )
}

# Can simplify the graph more
# We notice that there are 369 connectected components
# with the largest connected component comprising of 88%
# of the graph. Let's only analyze that part
largest_connected <- function(graph) {
  
  cls <- clusters(new)
  # what is the index of the largest connected component?
  i <- which.max(cls$csize)
  largest_cc <- which(clusters(new)$membership != i)
  
  new <- delete.vertices(graph, largest_cc)
  return(new)
}

simple <- largest_connected( remove_isolates( astrocollab ) )
