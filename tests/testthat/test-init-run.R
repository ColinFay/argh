context("test-init-run.R")

test_that("init check", {
  expect_silent(init_argh("en"))
  expect_silent(init_argh("fr"))
  expect_silent(init_argh("ko"))
})
