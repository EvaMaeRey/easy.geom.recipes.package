testthat::expect_equal(
  object = data.frame(x = 1:10, y = 1:10) |> 
           compute_group_means() |> _$x, 
  expected = 5.5
  )

