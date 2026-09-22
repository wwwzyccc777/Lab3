test_that("euclidean handles correct inputs and errors", {
  expect_equal(euclidean(123612, 13892347912), 4)
  expect_equal(euclidean(100, 1000), 100)
  expect_error(euclidean("a", 100))
  expect_error(euclidean(c(1, 2), 100))
})
