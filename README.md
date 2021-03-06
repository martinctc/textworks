# textworks

[![R build status](https://github.com/martinctc/textworks/workflows/R-CMD-check/badge.svg)](https://github.com/martinctc/textworks/actions)

[![CodeFactor](https://www.codefactor.io/repository/github/martinctc/textworks/badge)](https://www.codefactor.io/repository/github/martinctc/textworks)

Useful functions for handling text data. 

This is a curated collection of functions that I've either written or come across over the past years, in relation to text data handling. Packages such as stringr already make a lot of this work easier, enabling users to focus on the task at hand without having to bother with regular expressions.

The aim of this package is to provide collection of such functions with more specific applications (e.g. dividing sentences into n-grams) and to add value by curation, since it is likely that at some point similar functions will have already been written at some point by somebody, since R.

---

### Installation

surveytoolbox is not release on CRAN (yet). 
You can install the latest development version from GitHub with:

```
install.packages("devtools")
devtools::install_github("martinctc/textworks")
```

---
### Overview of Functions

Work in progress...

- `str_arrange()` sorts the letters in a character string by alphabetical order. This has applications in generating IDs from real data.
- `nwords()` counts the number of words in a text string
- `sentence_case()` converts a string of text into sentence case.
- `cap_all()` capitalises the first letter of all the words in a character string.
- `str_right()` returns the _nth_ number of characters from the right, similar to the Excel function RIGHT(). For convenience, there is an equivalent `str_left()` for returning number of characters starting from the left. 
- `rgb2hex()` provides a convenience wrapper around `rgb()` to convert RGB colour codes to HEX codes.

---
This package is currently still under development, so it does come with a health advice: if you do wish to use them - have a check and run through the examples before assimilating them into your analysis. 

---

Also check out my [website](https://martinctc.github.io) for my other work and packages.
