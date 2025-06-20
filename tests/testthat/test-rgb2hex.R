test_that("rgb2hex converts RGB values to HEX correctly", {
  # Basic functionality from example
  expect_equal(rgb2hex(0, 144, 218), "#0090DA")
  
  # Pure colors
  expect_equal(rgb2hex(255, 0, 0), "#FF0000")    # Red
  expect_equal(rgb2hex(0, 255, 0), "#00FF00")    # Green
  expect_equal(rgb2hex(0, 0, 255), "#0000FF")    # Blue
  
  # Black and white
  expect_equal(rgb2hex(0, 0, 0), "#000000")      # Black
  expect_equal(rgb2hex(255, 255, 255), "#FFFFFF") # White
  
  # Gray values
  expect_equal(rgb2hex(128, 128, 128), "#808080") # Medium gray
  expect_equal(rgb2hex(64, 64, 64), "#404040")    # Dark gray
  expect_equal(rgb2hex(192, 192, 192), "#C0C0C0") # Light gray
  
  # Mixed values
  expect_equal(rgb2hex(255, 128, 0), "#FF8000")   # Orange
  expect_equal(rgb2hex(128, 0, 128), "#800080")   # Purple
  expect_equal(rgb2hex(255, 255, 0), "#FFFF00")   # Yellow
  
  # Edge cases - minimum values
  expect_equal(rgb2hex(0, 0, 0), "#000000")
  expect_equal(rgb2hex(1, 1, 1), "#010101")
  
  # Edge cases - maximum values
  expect_equal(rgb2hex(255, 255, 255), "#FFFFFF")
  expect_equal(rgb2hex(254, 254, 254), "#FEFEFE")
  
  # Vector inputs (if supported)
  expect_equal(rgb2hex(c(255, 0), c(0, 255), c(0, 0)), c("#FF0000", "#00FF00"))
})
