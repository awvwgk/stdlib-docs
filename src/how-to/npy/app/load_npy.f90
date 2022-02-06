program demo_load
  use stdlib_io_npy, only: load_npy
  implicit none
  integer, parameter :: dp = selected_real_kind(15)
  real(dp), allocatable :: array(:, :, :)

  call load_npy("array.npy", array)

  print '(*(g0,1x))', "shape:", shape(array)
  ! shape: 5 2 6
end program demo_load
