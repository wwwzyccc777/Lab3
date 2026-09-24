#' Dijkstra's Shortest Path Algorithm
#'
#' Calculates the shortest distance from an initial node to every other
#' node in a weighted graph using Dijkstra's algorithm.
#'
#' The graph is represented as a data frame with three columns:
#' \code{v1}, \code{v2}, and \code{w}. Each row represents a directed edge
#' from node \code{v1} to node \code{v2} with weight \code{w}.
#'
#' @param graph A data frame with exactly three columns named
#'   \code{v1}, \code{v2}, and \code{w}. The columns \code{v1} and
#'   \code{v2} contain node numbers and \code{w} contains edge weights.
#' @param init_node A numeric scalar specifying the starting node.
#'
#' @return A numeric vector containing the shortest distance from
#'   \code{init_node} to every node in the graph.
#'
#' @references
#' Dijkstra's algorithm:
#' \url{https://en.wikipedia.org/wiki/Dijkstra\%27s_algorithm}
#'
#' @examples
#' wiki_graph <- data.frame(
#'   v1 = c(1,1,1,2,2,2,3,3,3,3,4,4,4,5,5,6,6,6),
#'   v2 = c(2,3,6,1,3,4,1,2,4,6,2,3,5,4,6,1,3,5),
#'   w = c(7,9,14,7,10,15,9,10,11,2,15,11,6,6,9,14,2,9)
#' )
#'
#' dijkstra(wiki_graph, 1)
#' dijkstra(wiki_graph, 3)
#'
#' @export
dijkstra <- function(graph, init_node) {

  # Check graph
  if (!is.data.frame(graph)) {
    stop("graph must be a data.frame")
  }

  if (ncol(graph) != 3) {
    stop("graph must contain exactly three columns")
  }

  if (!all(c("v1", "v2", "w") %in% names(graph))) {
    stop("graph must contain columns named v1, v2 and w")
  }

  # Check node columns and weights
  if (!is.numeric(graph$v1) ||
      !is.numeric(graph$v2) ||
      !is.numeric(graph$w)) {
    stop("v1, v2 and w must be numeric")
  }

  if (any(is.na(graph$v1)) ||
      any(is.na(graph$v2)) ||
      any(is.na(graph$w))) {
    stop("graph must not contain missing values")
  }

  if (any(graph$w < 0)) {
    stop("edge weights must be non-negative")
  }

  # Check init_node
  if (!is.numeric(init_node) ||
      length(init_node) != 1 ||
      is.na(init_node)) {
    stop("init_node must be a numeric scalar")
  }

  nodes <- sort(unique(c(graph$v1, graph$v2)))

  if (!(init_node %in% nodes)) {
    stop("init_node must exist in the graph")
  }

  # Initialize distances
  distances <- rep(Inf, length(nodes))
  names(distances) <- as.character(nodes)

  distances[as.character(init_node)] <- 0

  # All nodes are initially unvisited
  unvisited <- nodes

  while (length(unvisited) > 0) {

    # Find the unvisited node with the smallest distance
    unvisited_distances <-
      distances[as.character(unvisited)]

    current_index <- which.min(unvisited_distances)
    current_node <- unvisited[current_index]

    # If the smallest distance is infinite, the remaining nodes
    # cannot be reached from init_node
    if (is.infinite(distances[as.character(current_node)])) {
      break
    }

    # Find outgoing edges from the current node
    edges <- graph[graph$v1 == current_node, , drop = FALSE]

    if (nrow(edges) > 0) {

      for (i in seq_len(nrow(edges))) {

        neighbour <- edges$v2[i]
        weight <- edges$w[i]

        alternative_distance <-
          distances[as.character(current_node)] + weight

        if (alternative_distance <
            distances[as.character(neighbour)]) {

          distances[as.character(neighbour)] <-
            alternative_distance
        }
      }
    }

    # Mark current node as visited
    unvisited <- unvisited[unvisited != current_node]
  }

  # Return an unnamed numeric vector
  unname(distances)
}
