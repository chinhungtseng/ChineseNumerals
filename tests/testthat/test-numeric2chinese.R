test_that("check numeric2chinese", {
  a <- numeric2Chinese(9478, "upper")
  b <- numeric2Chinese(0, "upper")

  expect_equal(a, "\u7396\u4edf\u8086\u4f70\u67d2\u62fe\u634c")
  expect_equal(b, "\u96f6")
})
