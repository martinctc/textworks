test_that("add_line_breaks adds line breaks correctly", {
  tea_text <- "This is a lovely cup of tea"
  
  # Basic functionality with nword
  expect_equal(add_line_breaks(text = tea_text, nword = 2), 
               "This is \n a lovely \n cup of \n tea")
  
  expect_equal(add_line_breaks(text = tea_text, nword = 3), 
               "This is a \n lovely cup of \n tea")
  
  # Basic functionality with nchar
  expect_equal(add_line_breaks(text = "Hello world test", nchar = 5), 
               "Hello\nworld\ntest\n")
  
  # Edge case - single word  
  expect_equal(add_line_breaks(text = "Hello", nword = 1), "Hello \n")
  # Note: nword = 2 with single word doesn't produce line breaks
  
  # Edge case - empty string
  expect_equal(add_line_breaks(text = "", nword = 2), "")
  expect_equal(add_line_breaks(text = "", nchar = 5), "\n")
  
  # Long string with nword
  long_text <- "word1 word2 word3 word4 word5 word6"
  expect_equal(add_line_breaks(text = long_text, nword = 2), 
               "word1 word2 \n word3 word4 \n word5 word6 \n")
  
  # Character-based line breaks
  expect_equal(add_line_breaks(text = "123456789", nchar = 3), 
               "123\n456\n789\n")
  
  # Error cases - both parameters provided
  expect_error(add_line_breaks(text = tea_text, nword = 2, nchar = 10),
               "Please only supply a value to either `nword` or `nchar`, not both")
  
  # Error cases - no parameters provided
  expect_error(add_line_breaks(text = tea_text),
               "Please provide a valid value to either `nword` or `nchar`.")
  
  # Text with punctuation
  punct_text <- "Hello, world! How are you?"
  expect_equal(add_line_breaks(text = punct_text, nword = 2), 
               "Hello, world! \n How are \n you? \n")
})
