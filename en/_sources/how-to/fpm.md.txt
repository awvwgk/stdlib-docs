(fpm)=

# Using stdlib with fpm

This guide shows how to enable the Fortran Standard Library (stdlib) in projects using the Fortran package manager (fpm).

:::{note}
For more details on using fpm in general, see the [fpm documentation](https://fpm.fortran-lang).
:::


## Depending on stdlib

Either start a new fpm project or add the following lines to an existing package manifest

```{code-block} toml
[dependencies]
stdlib.git = "https://github.com/fortran-lang/stdlib"
stdlib.branch = "stdlib-fpm"
```

It is important to specify the branch explicitly here to depend on the fpm deployment of the stdlib repository rather than the CMake version.
Now, you should be able to access all modules of stdlib in your project.


## Troubleshooting

:::{admonition} Problem
:class: danger
Compilation fails with GCC 9 due to

```{code-block} text
 + gfortran-9 -c build/dependencies/stdlib/src/stdlib_hash_32bit.f90  -Wall -Wextra -Wimplicit-interface -fPIC -fmax-errors=1 -g -fcheck=bounds -fcheck=array-temps -fbacktrace -fcoarray=single -J build/gfortran-9_2A42023B310FA28D -Ibuild/gfortran-9_2A42023B310FA28D -o build/gfortran-9_2A42023B310FA28D/example-npy/build_dependencies_stdlib_src_stdlib_hash_32bit.f90.o
build/dependencies/stdlib/src/stdlib_hash_32bit.f90:25:30:

   25 |         pow32_over_phi = int( z'9E3779B9', int32 )
      |                              1
Error: Arithmetic overflow converting INTEGER(16) to INTEGER(4) at (1). This check can be disabled with the option ‘-fno-range-check’
compilation terminated due to -fmax-errors=1.
```
:::

:::{admonition} Solution
:class: success
add the argument for disabling the arithmetic overflow check

```{code-block} text
fpm build --profile debug --flag -fno-range-check
```
::::


:::{admonition} Problem
:class: danger
Compilation fails with GCC 8 or older.
:::

:::{admonition} Solution
:class: success
Stdlib requires at least GCC 9 or newer for successful compilation.
Please upgrade your GCC version.
:::
