setwd("~/Downloads")
library(igraph)
library(sna)
igraph <- load("~/Downloads/astrocollab.Rdata")
#how to simplify
#use igraph and then graph.adjacency look at lecture 2a
#make igraph an adjacency matrix to do ego.extract
graph.a <- graph.adjacency(igraph, mode = "undirected")
ego.extract(graph.a)
