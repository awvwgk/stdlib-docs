# Descriptive statistics

A descriptive statistic is a summary statistic that describes and summarizes
different features of a dataset.
The Fortran Standard library stdlib provides several descriptive statistics that can be
classified in two groups:

 * the measures of central tendency, such as the mean and the median;
 * the measures of variability, such as the moment and the variance.

In the context of Fortran, an array of any rank will be considered as a dataset.
This guide shows examples for computing different descriptive statistics from an
array.

All the functions described in this tutorial can be accessed via the [stdlib\_stats](https://fortran-lang.github.io/stdlib-docs/module/stdlib_stats.html) module.

First, we provide some examples for computing the mean of all elements of an array, or
of the elements of an array along a dimension.
These examples can be easily adapted to compute other descriptive statistics, such
as the median, the moment, of the variance of a dataset.

## Mean of an array

The Fortran Standard library stdlib provides the function `mean` for computing the
mean of a whole array:

:::{literalinclude} ../../src/how-to/stats/app/mean_all.f90
:language: fortran
:caption: mean_all.f90
:::

The same function can be also used to compute the mean of the elements of an array
along a dimension:

:::{literalinclude} ../../src/how-to/stats/app/mean_dim.f90
:language: fortran
:caption: mean_dim.f90
:::

Finally, a mask can be also provided to ignore some elements of the array, as
follows:

:::{literalinclude} ../../src/how-to/stats/app/mean_mask.f90
:language: fortran
:caption: mean_mask.f90
:::

:::{note}
The module [stdlib\_stats](https://fortran-lang.github.io/stdlib-docs/module/stdlib_stats.html) provives procedures for arrays of any rank, as well as
any numerical type.
:::

## Other descriptive statistics

Other descriptive statistics, such as the median or the variance of an array, can be computed using the [stdlib\_stats](https://fortran-lang.github.io/stdlib-docs/module/stdlib_stats.html) module.

:::{admonition} Summary
:class: tip
Using the [stdlib\_stats](https://fortran-lang.github.io/stdlib-docs/module/stdlib_stats.html) module allows to compute:

 * the measures of central tendency, such as the mean and the median;
 * the measures of variability, such as the moment and the variance.
:::
