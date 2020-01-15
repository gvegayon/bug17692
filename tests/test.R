library(bug17692)

cl <- makePSOCKcluster(2)
ans0 <- sim_pi(100, cl)
stopCluster(cl) # This is OK

# Fork is not
if (.Platform$OS.type == "unix") {
  cl <- makeForkCluster(2)
  ans0 <- sim_pi(100, cl)
  stopCluster(cl) # Produces errors catched by valgrind
}
