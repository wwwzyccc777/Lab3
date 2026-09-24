# Lab3

[![R-CMD-check](https://github.com/wwwzyccc777/Lab3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/wwwzyccc777/Lab3/actions/workflows/R-CMD-check.yaml)

Lab3 is an R package implementing the Euclidean algorithm for finding
the greatest common divisor and Dijkstra's algorithm for finding
shortest paths in a weighted graph.

## Installation

You can install the development version from GitHub with:

```r
devtools::install_github("wwwzyccc777/Lab3")
```

## Example

```r
library(Lab3)

euclidean(100, 1000)

data(wiki_graph)
dijkstra(wiki_graph, 1)
dijkstra(wiki_graph, 3)
```
