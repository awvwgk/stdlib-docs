# Installing stdlib packages

This guide covers the installation of the Fortran Standard Library (stdlib) on various platforms from a package manager.

:::{note}
If you are looking for using stdlib with the Fortran Package Manager (fpm) checkout the guide on {ref}`fpm`.
:::

:::{note}
If none of the package managers is suitable for your platform or you plan to contribute to stdlib checkout the guide on {ref}`building-from-source`.
:::


## {fab}`apple` {fab}`linux` Conda package manager

Stdlib is available on [conda-forge](https://conda-forge.org/), to add conda-forge to your channels use:

```{code-block} bash
conda config --add channels conda-forge
```

Stdlib can be installed with:

```{code-block} bash
conda create -n stdlib fortran_stdlib
conda activate stdli
```

Alternatively, if you want stdlib to be always available directly install into your current environment with

```{code-block} bash
conda install fortran_stdlib
```

Now you a stdlib installation available which is compatible with GCC 9 and upwards.

:::{note}
The conda package manager can be installed from [miniforge](https://github.com/conda-forge/miniforge/releases)
or from [miniconda](https://docs.conda.io/en/latest/miniconda.html).
:::


## {fab}`linux` Arch Linux user repository

The Arch Linux user repository (AUR) contains a package for [fortran\_stdlib](https://aur.archlinux.org/packages/fortran_stdlib) to install the stdlib from source.
You will have to provide an installation of [fypp](https://aur.archlinux.org/packages/fypp), which is also available via the AUR.

Select one of the PKGBUILDs and retrieve it with

```{code-block} bash
git clone https://aur.archlinux.org/fypp.git
cd fypp
```

As usual, first inspect the PKGBUILD before building it.
After verifying the PKGBUILD is fine, build the package with

```{code-block} bash
makepkg -si
```

Now with fypp available you can repeat the above steps for stdlib

```{code-block} bash
git clone https://aur.archlinux.org/fortran_stdlib.git
cd fortran_stdlib
```

Again, inspect the PKGBUILD before building it and than run the package script with

```{code-block} bash
makepkg -si
```

Now you have an installation of stdlib available for use with your systems GCC compiler.
