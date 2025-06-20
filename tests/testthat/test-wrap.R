test_that("wrap adds wrapper characters around text correctly", {
  # Basic functionality with default wrapper (double quote)
  expect_equal(wrap("lol"), '"lol"')
  expect_equal(wrap("hello"), '"hello"')
  expect_equal(wrap("test string"), '"test string"')
  
  # Custom wrapper
  expect_equal(wrap("lol", "lol"), "lollollol")
  expect_equal(wrap("hello", "*"), "*hello*")
  expect_equal(wrap("test", "[]"), "[]test[]")
  
  # Single character wrapper
  expect_equal(wrap("hello", "'"), "'hello'")
  expect_equal(wrap("test", "#"), "#test#")
  expect_equal(wrap("word", "|"), "|word|")
  
  # Multi-character wrapper
  expect_equal(wrap("hello", "**"), "**hello**")
  expect_equal(wrap("test", ">>>"), ">>>test>>>")
  
  # Edge cases
  expect_equal(wrap("", '"'), '""')  # Empty string with default wrapper
  expect_equal(wrap("", "*"), "**")  # Empty string with custom wrapper
  expect_equal(wrap("a", '"'), '"a"')  # Single character
  
  # Special characters in text
  expect_equal(wrap("hello@world.com", '"'), '"hello@world.com"')
  expect_equal(wrap("test 123 !@#", "*"), "*test 123 !@#*")
  
  # Vector input
  expect_equal(wrap(c("hello", "world", "test"), '"'), 
               c('"hello"', '"world"', '"test"'))
  expect_equal(wrap(c("a", "b"), "*"), c("*a*", "*b*"))
  
  # Wrapper same as content
  expect_equal(wrap("test", "test"), "testtesttest")
    # Empty wrapper
  expect_equal(wrap("hello", ""), "hello")
})
