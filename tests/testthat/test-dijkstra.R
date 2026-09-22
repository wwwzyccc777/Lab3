test_that("dijkstra handles correct inputs and errors", {
  data("wiki_graph")
  expect_equal(dijkstra(wiki_graph, 1), c(0, 7, 9, 20, 20, 11))
  expect_equal(dijkstra(wiki_graph, 3), c(9, 10, 0, 11, 11, 2))
  expect_error(dijkstra(wiki_graph, 7))
  expect_error(dijkstra(wiki_graph[, 1:2], 1))
})
