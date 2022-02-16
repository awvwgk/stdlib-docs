program mean_dim
  use stdlib_stats, only: mean
  implicit none
  real :: y(1:2, 1:3) = reshape([1., 2., 3., 4., 5., 6.], [2, 3])

  print*, mean(y, 1)
  print*, mean(y, 2)
end program mean_dim
