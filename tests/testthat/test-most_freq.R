# test-most_freq.R 

context('most_freq')

x <- factor( c(letters[1:3], "b", NA) ) %>% most_freq()
expect_equal(x,"b")
