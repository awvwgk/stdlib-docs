program corr
  use stdlib_stats, only: corr
  implicit none
  real :: y(1:2, 1:3) = reshape([1., 2., 3., 4., 5., 6.], [2, 3])

  print*, corr(y, 1)
  print*, corr(y, 2)
end program corr
