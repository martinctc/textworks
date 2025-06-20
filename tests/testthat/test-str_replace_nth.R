test_that("str_replace_nth replaces nth occurrence correctly", {
  # Basic functionality from examples
  x <- "pineapplepie"
  expect_equal(str_replace_nth(text = x, pattern = "p", replacement = "q", n = 2), 
               "pineaqplepie")
  
  expect_equal(str_replace_nth(text = "pigpig", pattern = "pig", replacement = "dog", n = 2), 
               "pigdog")
  
  expect_equal(str_replace_nth(text = "pigpig", pattern = "pig", replacement = "gy", n = 2), 
               "piggy")
  
  # First occurrence
  expect_equal(str_replace_nth("hello hello hello", "hello", "hi", n = 1), 
               "hi hello hello")
  
  # Third occurrence
  expect_equal(str_replace_nth("test test test test", "test", "exam", n = 3), 
               "test test exam test")
  
  # Single character pattern
  expect_equal(str_replace_nth("aaaa", "a", "b", n = 2), "abaa")
  expect_equal(str_replace_nth("aaaa", "a", "b", n = 4), "aaab")
  
  # Pattern that doesn't exist enough times (should return original when n > occurrences)
  # Note: This might cause an error or unexpected behavior, testing actual behavior
  
  # Multi-character patterns
  expect_equal(str_replace_nth("abcabcabc", "abc", "xyz", n = 2), "abcxyzabc")
  
  # Overlapping patterns
  expect_equal(str_replace_nth("aaaa", "aa", "bb", n = 1), "bbaa")
  
  # Empty replacement
  expect_equal(str_replace_nth("hello world hello", "hello", "", n = 2), "hello world ")
  
  # Case sensitive
  expect_equal(str_replace_nth("Hello hello HELLO", "hello", "hi", n = 1), "Hello hi HELLO")
  
  # Special characters in pattern
  expect_equal(str_replace_nth("test.test.test", "test", "exam", n = 2), "test.exam.test")
})
