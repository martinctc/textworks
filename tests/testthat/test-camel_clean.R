test_that("camel_clean converts CamelCase to Camel Case correctly", {
  # Basic functionality
  expect_equal(camel_clean("NoteHowTheStringIsFormatted"), 
               "Note How The String Is Formatted")
  expect_equal(camel_clean("ApplePie"), "Apple Pie")
  expect_equal(camel_clean("CamelCase"), "Camel Case")
  
  # Single word (no change expected)
  expect_equal(camel_clean("Hello"), "Hello")
  expect_equal(camel_clean("HELLO"), "HELLO")
  expect_equal(camel_clean("hello"), "hello")
  
  # Multiple words
  expect_equal(camel_clean("FirstNameLastName"), "First Name Last Name")
  expect_equal(camel_clean("XMLHttpRequest"), "XMLHttp Request")
  
  # Mixed case scenarios
  expect_equal(camel_clean("iPhone"), "i Phone")
  expect_equal(camel_clean("MacBook"), "Mac Book")
  
  # Edge cases
  expect_equal(camel_clean(""), "")
  expect_equal(camel_clean("A"), "A")
  expect_equal(camel_clean("AB"), "AB")  # No lowercase before uppercase
  expect_equal(camel_clean("Ab"), "Ab")  # No uppercase after lowercase
    # Numbers and special characters (no space added between letter and number)
  expect_equal(camel_clean("Test123Case"), "Test123Case")  # No change with numbers
  expect_equal(camel_clean("HTML5Parser"), "HTML5Parser")  # No change with numbers
  
  # Already spaced text (should not change much)
  expect_equal(camel_clean("Already Spaced"), "Already Spaced")
  expect_equal(camel_clean("mixed CamelCase"), "mixed Camel Case")
    # Vector input
  expect_equal(camel_clean(c("CamelCase", "AnotherExample", "TestCase")), 
               c("Camel Case", "Another Example", "Test Case"))
  
  # Consecutive uppercase letters
  expect_equal(camel_clean("HTMLParser"), "HTMLParser")  # No change
  expect_equal(camel_clean("XMLHttpRequest"), "XMLHttp Request")
})
