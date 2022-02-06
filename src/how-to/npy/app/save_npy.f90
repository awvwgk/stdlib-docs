program demo_load
  use stdlib_io_npy, only: save_npy
  use stdlib_math, only: logspace
  implicit none
  integer, parameter :: dp = selected_real_kind(15)
  real(dp), allocatable :: array(:, :, :)

  array = reshape(logspace(0.0_dp, 2.0_dp, 60), [6, 2, 5])
  call save_npy("array.npy", array)
end program demo_load
