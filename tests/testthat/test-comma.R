test_that("comma formats numbers with thousand separators correctly", {
  # Basic functionality
  expect_equal(comma(1000), "1,000")
  expect_equal(comma(1000000), "1,000,000")
  expect_equal(comma(20190721), "20,190,721")
  
  # Small numbers (no comma needed)
  expect_equal(comma(100), "100")
  expect_equal(comma(999), "999")
  expect_equal(comma(0), "0")
  
  # Negative numbers
  expect_equal(comma(-1000), "-1,000")
  expect_equal(comma(-1000000), "-1,000,000")
    # Decimal numbers (should be rounded to whole numbers based on actual behavior)
  expect_equal(comma(1000.5), "1,000")  # Seems to round down/truncate
  expect_equal(comma(1000.4), "1,000")  # Rounds down
  expect_equal(comma(999.9), "1,000")   # Rounds up
  
  # Large numbers
  expect_equal(comma(1000000000), "1,000,000,000")
  
  # Vector input
  expect_equal(comma(c(1000, 2000, 3000)), c("1,000", "2,000", "3,000"))
  
  # Edge cases
  expect_equal(comma(1), "1")
  expect_equal(comma(10), "10")
  expect_equal(comma(100), "100")
})
