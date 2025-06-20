test_that("sentence_case converts text to sentence case correctly", {
  # Basic functionality
  expect_equal(sentence_case("i'm not hundred percent sure. why not. cool!"), 
               "I'm not hundred percent sure. Why not. Cool!")
  
  # Single sentence
  expect_equal(sentence_case("hello world"), "Hello world")
  expect_equal(sentence_case("this is a test"), "This is a test")
  
  # Multiple sentences
  expect_equal(sentence_case("first sentence. second sentence. third sentence."), 
               "First sentence. Second sentence. Third sentence.")
  
  # Already properly formatted
  expect_equal(sentence_case("Hello world. How are you?"), 
               "Hello world. How are you?")
  
  # Empty and edge cases
  expect_equal(sentence_case(""), "")
  expect_equal(sentence_case("."), ".")
  expect_equal(sentence_case("a"), "A")
  
  # Sentences with extra spaces
  expect_equal(sentence_case("hello.   world"), "Hello. World")
  expect_equal(sentence_case("test.    another test"), "Test. Another test")
  
  # No periods
  expect_equal(sentence_case("hello world"), "Hello world")
    # Multiple periods (actual behavior may differ)
  expect_equal(sentence_case("hello... world"), "Hello. .. World")
  
  # Sentences starting with numbers or special characters
  expect_equal(sentence_case("123 is a number. another sentence."), 
               "123 is a number. Another sentence.")
  
  # Vector input
  expect_equal(sentence_case(c("hello. world.", "test. case.")), 
               c("Hello. World.", "Test. Case."))
  # Edge case with period at start (no change when period is first)
  expect_equal(sentence_case(". hello world"), ". hello world")
})
