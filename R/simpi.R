#' Reproduce memory leak error by simulating pi in parallel
#' @param n Integer, number of simulations.
#' @param cl an object of class `cluster` (see [parallel::makeCluster]).
#' @param size Integer. Size of each simulation.
#' @export
#' @import parallel
#' @importFrom stats runif
#' @examples
#' # PSOCK is OK
#' cl <- makePSOCKcluster(2)
#' ans0 <- sim_pi(100, cl)
#' stopCluster(cl)
#'
#' # Fork is not
#' if (.Platform$OS.type == "unix") {
#'   cl <- makeForkCluster(2)
#'   ans0 <- sim_pi(100, cl)
#'   stopCluster(cl) # Produces errors catched by valgrind
#' }
sim_pi <- function(n, cl, size = 1000) {

  pisimulator <- function(i) {
    ans <- matrix(runif(size*2), ncol = 2)
    ans[] <- ans ^ 2
    mean(sqrt(rowSums(ans)) < 1) * 4
  }

  clusterExport(cl, c("pisimulator", "size"), envir = environment())

  parSapply(cl, 1:n, pisimulator)

}
