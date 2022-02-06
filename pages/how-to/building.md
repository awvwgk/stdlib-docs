# Building stdlib from source

This guide describes how to setup a development environment to build Fortran Standard Library (stdlib).
To build stdlib the following requirements must be met

- a Fortran 2008 compliant compiler, or better, a Fortran 2018 compliant compiler
  (for a full list see {ref}`supported-compilers`)
- CMake version 3.14 or newer (alternatively Make can be used)
- a build backend for CMake, like Make or Ninja (the latter is recommended on Windows)
- the [fypp](https://github.com/aradi/fypp) preprocessor (used as meta-programming tool)


## Getting the source

Start by cloning the repository from GitHub with

```{code-block} text
git clone https://github.com/fortran-lang/stdlib
cd stdlib
```


## Installing build tools

The following sections describe how to setup your system with the required build tools.


### Conda

To install the build requirements in on all platforms we recommend the [conda](https://docs.conda.io/en/latest/) package manager.
First, enable the conda-forge if not already available with

```{code-block} text
conda config --add channels conda-forge
```

Create and activate a new environment with

```{code-block} text
conda create -n stdlib-tools fypp cmake ninja
conda activate stdlib-tools
```

:::{note}
A conda environment can be setup using the [miniforge installer](https://github.com/conda-forge/miniforge/releases).
:::

Also, you can install a Fortran compiler from conda-forge by installing the ``fortran-compiler`` package, which installs GFortran.


### MSYS2

For Windows users the [MSYS2](https://www.msys2.org/) toolchain provides access to the required build tools.

```{code-block} text
pacman -S mingw-w64-x86_64-python-fypp mingw-w64-x86_64-cmake mingw-w64-x86_64-ninja
```

The native terminals MinGW64 (`x86_64`), MinGW32 (`i686`), and UCRT64 (`ucrt-x86_64`) can be used to build stdlib.
MSYS2 also provides up-to-date Fortran compilers which can be installed via

```{code-block} text
pacman -S mingw-w64-x86_64-gcc-fortran
```


### Homebrew

For MacOS the [brew](https://brew.sh/) package manager can be used to provide the required build tools:

```{code-block} text
brew install fypp cmake ninja
```

A Fortran compiler can be installed via

```{code-block} text
brew install gcc
```

To select a specific version add the major version number to the formula, *e.g.* ``gcc@10`` for GCC 10.


## Build with CMake

Start by configuring the build with

```{code-block} text
cmake -B build -G Ninja
```

You can pass additional options to CMake to customize the build.
Important options are

- `-DCMAKE_INSTALL_PREFIX` is used to provide the install location for the library. If not provided the defaults will depend on your operating system, [see here](https://cmake.org/cmake/help/latest/variable/CMAKE_INSTALL_PREFIX.html). 
- `-DCMAKE_MAXIMUM_RANK` the maximum array rank procedures should be generated for.
  The default value is chosen as 4.
  The maximum is 15 for Fortran 2003 compliant compilers, otherwise 7 for compilers not supporting Fortran 2003 completely yet.
  The minimum required rank to compile this project is 4.
  Compiling with maximum rank 15 can be resource intensive and requires at least 16 GB of memory to allow parallel compilation or 4 GB memory for sequential compilation.
- `-DBUILD_SHARED_LIBS` set to `on` in case you want link your application dynamically against the standard library (default: `off`).

For example, to configure a build using the Ninja backend while specifying compiler flags `FFLAGS`, generating procedures up to rank 7, and installing to your home directory, use

```{code-block} text
export FFLAGS="-O3"
cmake -B build -G Ninja -DCMAKE_MAXIMUM_RANK:String=7 -DCMAKE_INSTALL_PREFIX=$HOME/.local
```

To build the standard library run

```{code-block} text
cmake --build build
```

To test your build, run the test suite after the build has finished with

```{code-block} text
cmake --build build --target test
```

Please report failing tests on our [issue tracker](https://github.com/fortran-lang/stdlib/issues/new/choose) including details of the compiler used, the operating system and platform architecture.

To install the project to the declared prefix run

```{code-block} text
cmake --install build
```

Now you have a working version of stdlib you can use for your project.

If at some point you wish to recompile `stdlib` with different options, you might
want to delete the `build` folder. This will ensure that cached variables from
earlier builds do not affect the new build.


(supported-compilers)=

## Supported compilers

The following compiler versions are currently supported and tested for stdlib

Name | Version | Platform | Architecture
--- | --- | --- | ---
GCC Fortran | 9, 10, 11 | Ubuntu 20.04 | x86\_64
GCC Fortran | 9, 10, 11 | MacOS Catalina 10.15 | x86\_64
GCC Fortran (MSYS) | 10 | Windows Server 2019 | x86\_64
GCC Fortran (MinGW) | 10 | Windows Server 2019 | x86\_64, i686
Intel oneAPI classic | 2021.1 | Ubuntu 20.04 | x86\_64
Intel oneAPI classic | 2021.1 | MacOS Catalina 10.15 | x86\_64


The following toolchains are known to fail.
Please check the linked issues for their current status.

Name | Version | Platform | Architecture | Status
--- | --- | --- | --- | ---
GCC Fortran | <9 | any | any | [#296](https://github.com/fortran-lang/stdlib/issues/296), [#430](https://github.com/fortran-lang/stdlib/pull/430)
NVIDIA HPC SDK | 20.7, 20.9, 20.11 | Manjaro Linux 20 | x86\_64 | [#107](https://github.com/fortran-lang/stdlib/issues/107)
NAG | 7.0 | RHEL | x86\_64 | [#108](https://github.com/fortran-lang/stdlib/issues/108)
Intel Parallel Studio XE | 16, 17, 18 | OpenSUSE | x86\_64 | [#299](https://github.com/fortran-lang/stdlib/issues/299)
