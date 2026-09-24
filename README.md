# Lab3

[![R-CMD-check](https://github.com/wwwzyccc777/Lab3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/wwwzyccc777/Lab3/actions/workflows/R-CMD-check.yaml)

<<<<<<< HEAD
Lab3 is an R package implementing the Euclidean algorithm for finding
the greatest common divisor and Dijkstra's algorithm for finding
shortest paths in a weighted graph.

## Installation

You can install the development version from GitHub with:

```r

**Lab3** is an R package that implements two classic algorithms:

- `euclidean()`: the **Euclidean algorithm** for the greatest common divisor (GCD) of two numbers.
- `dijkstra()`: **Dijkstra's algorithm** for the shortest distance from a starting node to every other node in a weighted graph.

The package also includes `wiki_graph`, the example graph from the Wikipedia article on Dijkstra's algorithm.

This package was written for Computer Lab 3 in *732A94 Advanced R Programming* at Linköping University.

## Installation

Install the development version from GitHub:

```r
# install.packages("devtools")
>>>>>>> 66faed9 (Uppdate file)
devtools::install_github("wwwzyccc777/Lab3")
```

## Usage

```r
library(Lab3)
<<< HEAD

euclidean(100, 1000)

data(wiki_graph)
dijkstra(wiki_graph, 1)
dijkstra(wiki_graph, 3)
```
=======
```

### Greatest common divisor

```r
euclidean(123612, 13892347912)
#> [1] 4

euclidean(100, 1000)
#> [1] 100

euclidean(-100, 1000)   # negative inputs are handled
#> [1] 100
```

Both arguments must be numeric scalars. Other input throws an error:

```r
euclidean("100", 1000)
#> Error in euclidean("100", 1000) : is.numeric(a) is not TRUE
```

### Shortest paths

A graph is a `data.frame` with three columns. Each row is one directed edge:

| Column | Meaning                       |
|--------|-------------------------------|
| `v1`   | node the edge starts from     |
| `v2`   | node the edge goes to         |
| `w`    | weight (distance) of the edge |

To make an undirected graph, list each edge in both directions, as `wiki_graph` does.

```r
head(wiki_graph)
#>   v1 v2  w
#> 1  1  2  7
#> 2  1  3  9
#> 3  1  6 14
#> 4  2  1  7
#> 5  2  3 10
#> 6  2  4 15

dijkstra(wiki_graph, 1)
#> [1]  0  7  9 20 20 11

dijkstra(wiki_graph, 3)
#> [1]  9 10  0 11 11  2
```

The result gives the shortest distance from `init_node` to each node, ordered by node number. Unreachable nodes get `Inf`.

`dijkstra()` checks its input and throws an informative error in these cases:

- `graph` is not a data frame with the columns `v1`, `v2` and `w`.
- `graph` contains non-numeric values, missing values or negative weights.
- `init_node` is not a single number or is not a node in the graph.

## Testing

The package uses [testthat](https://testthat.r-lib.org/). To run the tests from the package directory:

```r
devtools::test()
```

GitHub Actions runs `R CMD check` on every push, on Windows, macOS and Linux. The badge at the top of this page shows the result.

## References

- [Euclidean algorithm](https://en.wikipedia.org/wiki/Euclidean_algorithm), Wikipedia
- [Dijkstra's algorithm](https://en.wikipedia.org/wiki/Dijkstra%27s_algorithm), Wikipedia

## Authors

- Zhengyu Wang ([@wwwzyccc777](https://github.com/wwwzyccc777))
- Viet Tien Trinh ([@Tvths](https://github.com/Tvths))

## License

MIT © Zhengyu Wang and Viet Tien Trinh. See [LICENSE.md](LICENSE.md).
>>> 66faed9 (Uppdate file)
