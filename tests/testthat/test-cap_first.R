test_that("cap_first capitalizes first letters correctly", {
  # Basic functionality
  expect_equal(cap_first("hello world"), "Hello World")
  expect_equal(cap_first("steeles pots and pans"), "Steeles Pots And Pans")
  
  # Single word
  expect_equal(cap_first("hello"), "Hello")
  expect_equal(cap_first("a"), "A")
  
  # Already capitalized
  expect_equal(cap_first("Hello World"), "Hello World")
  expect_equal(cap_first("HELLO WORLD"), "HELLO WORLD")
    # Mixed case - only capitalizes first letter, doesn't change rest
  expect_equal(cap_first("hELLo wORLd"), "HELLo WORLd")
  
  # Empty and edge cases
  expect_equal(cap_first(""), "")
  expect_equal(cap_first(" "), " ")
  expect_equal(cap_first("  hello  world  "), "  Hello  World  ")
  
  # Special characters and numbers
  expect_equal(cap_first("hello-world"), "Hello-world")
  expect_equal(cap_first("hello world 123"), "Hello World 123")
  expect_equal(cap_first("test@email.com"), "Test@email.com")
  
  # Multiple spaces
  expect_equal(cap_first("hello   world"), "Hello   World")
  
  # Vector input
  expect_equal(cap_first(c("hello", "world peace", "test case")), 
               c("Hello", "World Peace", "Test Case"))
  
  # Non-alphabetic start
  expect_equal(cap_first("123 hello"), "123 Hello")
  expect_equal(cap_first("$hello world"), "$hello World")
})
