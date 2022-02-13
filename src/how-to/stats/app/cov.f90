program cov
  use stdlib_stats, only: cov
  implicit none
  real :: y(1:2, 1:3) = reshape([1., 2., 3., 4., 5., 6.], [2, 3])

  print*, cov(y, 1)
  print*, cov(y, 2)
end program cov
