test_that("count_ngram counts n-grams correctly", {
  # Basic functionality with default bigrams (n=2)
  result <- count_ngram("The quick brown fox jumped over the lazy dog")
  
  # Check that result is a data frame with correct columns
  expect_s3_class(result, "data.frame")
  expect_true("ngrams" %in% names(result))
  expect_true("count" %in% names(result))
  
  # Check basic content (bigrams should be created)
  expect_true(nrow(result) > 0)
  expect_true(all(result$count >= 1))
  
  # Test with custom count column name
  result_custom <- count_ngram("hello world hello", count_col = "frequency")
  expect_true("frequency" %in% names(result_custom))
  expect_false("count" %in% names(result_custom))
  
  # Test with different n values
  # Unigrams (n=1)
  result_1 <- count_ngram("hello world hello", n = 1)
  expect_true(nrow(result_1) > 0)
  
  # Trigrams (n=3)
  result_3 <- count_ngram("the quick brown fox jumps", n = 3)
  expect_true(nrow(result_3) > 0)
  
  # Test with repeated text to check counting
  repeated_text <- "hello world hello world"
  result_repeated <- count_ngram(repeated_text, n = 2)
  
  # Check that results are sorted by count (descending)
  if(nrow(result_repeated) > 1) {
    expect_true(all(result_repeated$count[-1] <= result_repeated$count[-nrow(result_repeated)]))
  }
  
  # Edge case - single word
  result_single <- count_ngram("hello", n = 1)
  expect_equal(nrow(result_single), 1)
  expect_equal(result_single$count[1], 1)
  
  # Edge case - n larger than available words (for bigrams with single word)
  result_edge <- count_ngram("hello", n = 2)
  expect_true(nrow(result_edge) == 0 || all(is.na(result_edge$ngrams)))
})
