# Reading and writing npy files

This guide shows examples of reading and writing ``npy`` files via stdlib.


## Reading npy files in Fortran

Numpy can store numpy arrays as binary files in ``npy`` format via [numpy.save](https://numpy.org/doc/stable/reference/generated/numpy.save.html):

```{code-block} python
import numpy as np

array = np.logspace(0, 2, 60).reshape((6, 2, 5))
np.save("array.npy", array)
```

This file can be read from Fortran via the [stdlib\_io\_npy](https://fortran-lang.github.io/stdlib-docs/module/stdlib_io_npy.html) module.

:::{literalinclude} ../../src/how-to/npy/app/load_npy.f90
:language: fortran
:caption: load_npy.f90
:::

:::{note}
Numpy supports two memory layouts for ndarrays, either right-to-left memory layout (C stride scheme, row major ordering) or left-to-right memory layout (Fortran stride scheme, column major ordering).

The ``load_npy`` routine will read arrays always in left-to-right memory layout as contiguous array, rather than preserving the shape and transposing a multidimensional array in case data in right-to-left layout is encountered.
This is equivalent to using [numpy.ascontiguousarray](https://numpy.org/doc/stable/reference/generated/numpy.ascontiguousarray.html) to transfer from right-to-left layout to left-to-right layout in Python.
:::

In case the data mismatches in type or rank an error occurs, which can be handled gracefully by retrieving the optional status and message arguments.

:::{literalinclude} ../../src/how-to/npy/app/load_npy_error.f90
:language: fortran
:caption: load_npy_error.f90
:::


## Writing npy files from Fortran

With stdlib it is also possible to write arrays in ``npy`` format

:::{literalinclude} ../../src/how-to/npy/app/save_npy.f90
:language: fortran
:caption: save_npy.f90
:::

We can check whether the array is readable from Python and contains the expected data using [numpy.load](https://numpy.org/doc/stable/reference/generated/numpy.load.html):

```{code-block} python
import numpy as np

farray = np.load("array.npy")
parray = np.logspace(0, 2, 60).reshape((6, 2, 5), order="F")

print(np.allclose(farray, parray))
# True
```

Note that arrays written in ``npy`` format by stdlib always will be in left-to-right memory layout (Fortran stride scheme, column major ordering).

:::{admonition} Summary
:class: tip

Using the [stdlib\_io\_npy](https://fortran-lang.github.io/stdlib-docs/module/stdlib_io_npy.html) module allows to

- store data in a numpy compatible format
- load data produced by numpy
- safely round-trip data between Fortran and Python
:::
