test_that("nwords counts words correctly", {
  # Basic word counting
  expect_equal(nwords("Hello world"), 2)
  expect_equal(nwords("One two three four"), 4)
  expect_equal(nwords(""), 0)
  
  # Single word
  expect_equal(nwords("Hello"), 1)
    # Text with punctuation
  expect_equal(nwords("Hello, world!"), 2)
  expect_equal(nwords("Oh my what a lovely day. We should all go out and play!"), 13)
    # Text with numbers and special characters (pseudo = FALSE, default)
  expect_equal(nwords("Hello 123 world"), 2)
  expect_equal(nwords("Test@email.com"), 3)  # "Test", "email", "com"
  
  # Text with numbers and special characters (pseudo = TRUE)
  expect_equal(nwords("Hello 123 world", pseudo = TRUE), 3)
  expect_equal(nwords("Test@email.com", pseudo = TRUE), 1)
  expect_equal(nwords("word1 word2 123 @#$", pseudo = TRUE), 4)
  
  # Edge cases
  expect_equal(nwords("   "), 0)
  expect_equal(nwords("123 456"), 0)  # Only numbers, pseudo = FALSE
  expect_equal(nwords("123 456", pseudo = TRUE), 2)  # Numbers count with pseudo = TRUE
  
  # Vector input
  expect_equal(nwords(c("one", "two words", "three word sentence")), c(1, 2, 3))
})
