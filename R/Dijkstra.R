#' Dijkstra's shortest path algorithm
#'
#' @param graph A data.frame with three columns v1, v2, w,
#'   representing edges from node v1 to node v2 with weight w.
#' @param init_node A numeric scalar giving the starting node. Must be a node
#'   present in graph.
#'
#' @return A numeric vector of the shortest path distance from
#'   \code{init_node} to every node in the graph, ordered by node id.
#'
#' @details Implements Dijkstra's algorithm: starting from init_node,
#' iteratively selects the closest unvisited node and relaxes the distances
#' to its neighbors, until all nodes have been visited.
#'
#' @references \url{https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm}
#'
#' @export
dijkstra <- function(graph, init_node) {
  stopifnot(is.data.frame(graph),
            all(c("v1", "v2", "w") %in% names(graph)),
            is.numeric(init_node), length(init_node) == 1,
            init_node %in% graph$v1)
  
  nodes <- sort(unique(c(graph$v1, graph$v2)))
  n <- length(nodes)
  
  dist <- setNames(rep(Inf, n), nodes)
  dist[as.character(init_node)] <- 0
  visited <- setNames(rep(FALSE, n), nodes)
  
  for (i in seq_len(n)) {
    # pick unvisited node with smallest distance
    unvisited_dist <- dist[!visited]
    current <- names(unvisited_dist)[which.min(unvisited_dist)]
    
    if (is.infinite(dist[current])) break  # remaining nodes unreachable
    visited[current] <- TRUE
    
    # find neighbors of current (edges going out of current)
    neighbors <- graph[graph$v1 == as.numeric(current), ]
    
    for (j in seq_len(nrow(neighbors))) {
      neighbor <- as.character(neighbors$v2[j])
      weight <- neighbors$w[j]
      new_dist <- dist[current] + weight
      
      if (new_dist < dist[neighbor]) {
        dist[neighbor] <- new_dist
      }
    }
  }
  
  return(unname(dist[as.character(nodes)]))
}