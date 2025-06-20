test_that("us_to_space replaces underscores with spaces correctly", {
  # Basic functionality
  expect_equal(us_to_space("Meeting_hours_with_manager_1_on_1"), 
               "Meeting hours with manager 1 on 1")
  expect_equal(us_to_space("hello_world"), "hello world")
  expect_equal(us_to_space("test_case_example"), "test case example")
  
  # Single underscore
  expect_equal(us_to_space("hello_world"), "hello world")
  expect_equal(us_to_space("a_b"), "a b")
  
  # Multiple consecutive underscores
  expect_equal(us_to_space("hello__world"), "hello  world")
  expect_equal(us_to_space("test___case"), "test   case")
  
  # No underscores
  expect_equal(us_to_space("hello world"), "hello world")
  expect_equal(us_to_space("no underscores here"), "no underscores here")
  
  # Edge cases
  expect_equal(us_to_space(""), "")
  expect_equal(us_to_space("_"), " ")
  expect_equal(us_to_space("__"), "  ")
  expect_equal(us_to_space("_hello_"), " hello ")
  
  # Mixed with other characters
  expect_equal(us_to_space("hello_world123"), "hello world123")
  expect_equal(us_to_space("test_@#$_case"), "test @#$ case")
  
  # Vector input
  expect_equal(us_to_space(c("hello_world", "test_case", "no_underscores")), 
               c("hello world", "test case", "no underscores"))
  
  # Only underscores
  expect_equal(us_to_space("___"), "   ")
})
