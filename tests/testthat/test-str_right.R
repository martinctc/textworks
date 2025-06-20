test_that("str_right returns correct number of characters from right", {
  # Basic functionality
  expect_equal(str_right("Wittgenstein", 5), "stein")
  expect_equal(str_right("Hello", 3), "llo")
    # Edge cases
  expect_equal(str_right("Hello", 0), "")
  expect_equal(str_right("Hello", 5), "Hello")  # Exactly the length
  expect_equal(str_right("Hello", 10), "ello")  # More than length, different behavior
  expect_equal(str_right("", 5), "")  # Empty string
  
  # Single character
  expect_equal(str_right("A", 1), "A")
  expect_equal(str_right("A", 0), "")
  
  # Special characters and numbers
  expect_equal(str_right("Hello@World123", 6), "rld123")
  expect_equal(str_right("123-456-789", 7), "456-789")
  
  # Unicode characters
  expect_equal(str_right("Café", 2), "fé")
  
  # Vector input
  expect_equal(str_right(c("Hello", "World", "Testing"), 3), c("llo", "rld", "ing"))
  expect_equal(str_right(c("A", "BB", "CCC"), c(1, 2, 3)), c("A", "BB", "CCC"))
  
  # Single character strings
  expect_equal(str_right("X", 1), "X")
  expect_equal(str_right("X", 2), "X")
})
