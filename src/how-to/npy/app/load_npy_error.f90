program demo_load_error
  use stdlib_io_npy, only: load_npy
  implicit none
  real, allocatable :: array(:, :, :)
  integer :: stat
  character(len=:), allocatable :: message

  call load_npy("array.npy", array, stat, message)

  if (stat /= 0) then
    print '(a)', message
    ! File 'array.npy' contains data of type '<f8', but expected '<f4'
  end if
end program demo_load_error
