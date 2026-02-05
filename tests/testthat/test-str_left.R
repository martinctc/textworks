test_that("str_left returns correct number of characters from left", {
  # Basic functionality
  expect_equal(str_left("Wittgenstein", 7), "Wittgen")
  expect_equal(str_left("Hello", 3), "Hel")
  
  # Edge cases
  expect_equal(str_left("Hello", 0), "")
  expect_equal(str_left("Hello", 5), "Hello")  # Exactly the length
  expect_equal(str_left("Hello", 10), "Hello")  # More than the length
  expect_equal(str_left("", 5), "")  # Empty string
  
  # Single character
  expect_equal(str_left("A", 1), "A")
  expect_equal(str_left("A", 0), "")
  
  # Special characters and numbers
  expect_equal(str_left("Hello@World123", 5), "Hello")
  expect_equal(str_left("123-456-789", 7), "123-456")
  
  # Unicode characters
  expect_equal(str_left("Café", 3), "Caf")
  
  # Vector input
  expect_equal(str_left(c("Hello", "World", "Testing"), 3), c("Hel", "Wor", "Tes"))
  expect_equal(str_left(c("A", "BB", "CCC"), c(1, 2, 3)), c("A", "BB", "CCC"))
    # Negative numbers (str_sub behavior with negative start)
  expect_equal(str_left("Hello", -1), "Hello")  # str_sub handles negative numbers differently
})
