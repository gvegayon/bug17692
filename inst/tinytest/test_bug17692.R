
# Placeholder with simple test
cl <- makePSOCKcluster(2)
ans0 <- sim_pi(100, cl)
expect_silent(stopCluster(cl)) # This is OK

# Fork is not
if (.Platform$OS.type == "unix") {
  cl <- makeForkCluster(2)
  ans0 <- sim_pi(100, cl)
  expect_silent(stopCluster(cl)) # Produces errors catched by valgrind
}
