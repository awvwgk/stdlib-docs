# Covariance and correlation

The Fortran Standard library stdlib provides several procedures to compute
covariances and Pearson correlations of the elements of an array along a
dimension.

This guide shows examples to compute covariances and Pearson correlations from an
array. 
All the functions described in this tutorial can be accessed via the [stdlib\_stats](https://fortran-lang.github.io/stdlib-docs/module/stdlib_stats.html) module.

## Covariance

The Fortran Standard library stdlib provides the function `cov` for computing the
covariance of the elements of an array along a dimension:

:::{literalinclude} ../../src/how-to/stats/app/cov.f90
:language: fortran
:caption: cov.f90
:::

:::{note}
The default scaling of the covariance  is `n-1`. However, it can be scaled with
`n` by setting the optional argument `corrected` to `.false.`.
:::

## Pearson correlation

The Fortran Standard library stdlib provides the function `corr` for computing the
Pearson correlation of the elements of an array along a dimension:

:::{literalinclude} ../../src/how-to/stats/app/corr.f90
:language: fortran
:caption: corr.f90
:::


:::{note}
Like other procedures in the
[stdlib\_stats](https://fortran-lang.github.io/stdlib-docs/module/stdlib_stats.html)
module, the functions for computing covariances and correlations of array elements
support an optional mask to ignore some elements of the array.
:::
