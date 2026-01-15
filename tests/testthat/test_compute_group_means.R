testthat::test_that("compute_group_means collapses x and y to means", {
                    
      df <- data.frame(x = 1:10, y = 1:10) |> 
           compute_group_means()

  
      expect_identical(
        object = df, 
        expected = data.frame(x = 5.5, y = 5.5))
  }
)

