test_that("check chnNumChar", {
  a <- chnNumChar(9, "upper")
  b <- chnNumChar(5, "upper")
  c <- chnNumChar(2, "lower")
  d <- chnNumChar(7, "lower")

  expect_equal(a, "\u7396")
  expect_equal(b, "\u4f0d")
  expect_equal(c, "\u4e8c")
  expect_equal(d, "\u4e03")
})
