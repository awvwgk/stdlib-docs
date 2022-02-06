---
author: Stdlib contributors
date: 2021-10-04
category: release
...

# Stdlib version 0.1.0 released

This is the first release of the Fortran standard library (stdlib).
Many thanks go to all the contributors at stdlib participating in the discussions, reviewing patches and sharing code.
Almost two years of work are collected in this release since the project started in Dec 2019. (We plan to release in shorter intervals going forward.)

The following modules where added in version 0.1.0:

- new module `stdlib_ascii`  [#32](https://github.com/fortran-lang/stdlib/pull/32)
- new module `stdlib_bitsets`  [#239](https://github.com/fortran-lang/stdlib/pull/239)
  - new derived types `bitset_64` and `bitset_large`
  - new abstract base class `bitset_type`
- new module `stdlib_error`  [#53](https://github.com/fortran-lang/stdlib/pull/53)
- new module `stdlib_io`
  - new procedures `loadtxt` and `savetxt`    [#23](https://github.com/fortran-lang/stdlib/pull/23)    [#37](https://github.com/fortran-lang/stdlib/pull/37)
  - new procedure `open`    [#71](https://github.com/fortran-lang/stdlib/pull/71)    [#77](https://github.com/fortran-lang/stdlib/pull/77)
- new module `stdlib_kinds`  [#63](https://github.com/fortran-lang/stdlib/pull/63)
- new module `stdlib_linalg`
  - new procedures `diag`, `eye` and `trace`    [#170](https://github.com/fortran-lang/stdlib/pull/170)
  - new procedure `outer_product`    [#432](https://github.com/fortran-lang/stdlib/pull/432)
- new module `stdlib_logger`
  - new derived type: `logger_type`    [#228](https://github.com/fortran-lang/stdlib/pull/228)    [#261](https://github.com/fortran-lang/stdlib/pull/261)
- new module `stdlib_math`
  - new procedure `clip`    [#355](https://github.com/fortran-lang/stdlib/pull/355)
  - new procedures `linspace` and `logspace`    [#420](https://github.com/fortran-lang/stdlib/pull/420)
  - new procedure `arange`    [#480](https://github.com/fortran-lang/stdlib/pull/480)
  - new procedure `gcd`    [#539](https://github.com/fortran-lang/stdlib/pull/539)
- new module `stdlib_optval`  [#73](https://github.com/fortran-lang/stdlib/pull/73)  [#96](https://github.com/fortran-lang/stdlib/pull/96)  [#139](https://github.com/fortran-lang/stdlib/pull/139)
- new module `stdlib_quadrature`
  - new procedures `trapz`, `trapz_weights`, `simps` and `simps_weights`    [#146](https://github.com/fortran-lang/stdlib/pull/146)
  - new procedures `gauss_legendre`, `gauss_legendre_lobatto`    [#313](https://github.com/fortran-lang/stdlib/pull/313)
- new module `stdlib_random`  [#271](https://github.com/fortran-lang/stdlib/pull/271)
- new module `stdlib_sorting`
  - new procedures `sort`, `ord_sort` and `sort_index`    [#408](https://github.com/fortran-lang/stdlib/pull/408)
- new module `stdlib_specialfunctions`
  - new procedures `legendre` and `dlegendre`    [#313](https://github.com/fortran-lang/stdlib/pull/313)
- new module `stdlib_stats`
  - new procedure `mean`    [#124](https://github.com/fortran-lang/stdlib/pull/124)    [#130](https://github.com/fortran-lang/stdlib/pull/130)    [#132](https://github.com/fortran-lang/stdlib/pull/132)
  - new procedure `var`    [#144](https://github.com/fortran-lang/stdlib/pull/144)
  - new procedure `moment`    [#153](https://github.com/fortran-lang/stdlib/pull/153)
  - new procedure `corr`    [#191](https://github.com/fortran-lang/stdlib/pull/191)
  - new procedure `median`    [#426](https://github.com/fortran-lang/stdlib/pull/426)
- new module `stdlib_string_type`
  - new derived types `string_type`    [#320](https://github.com/fortran-lang/stdlib/pull/320)
  - new procedure `move`    [#467](https://github.com/fortran-lang/stdlib/pull/467)
- new module `stdlib_stringlist_type`
  - new derived types `stringlist_type` and `stringlist_index_type`    [#470](https://github.com/fortran-lang/stdlib/pull/470)
- new module `stdlib_strings`
  - new procedure `to_string`    [#444](https://github.com/fortran-lang/stdlib/pull/444)
  - new procedures `strip` and `chomp`    [#343](https://github.com/fortran-lang/stdlib/pull/343)
  - new procedures `starts_with` and `ends_with`    [#384](https://github.com/fortran-lang/stdlib/pull/384)
  - new procedure `slice`    [#414](https://github.com/fortran-lang/stdlib/pull/414)
  - new procedure `find`    [#433](https://github.com/fortran-lang/stdlib/pull/433)
  - new procedure `replace_all`    [#436](https://github.com/fortran-lang/stdlib/pull/436)
  - new procedures `padl` and `padr`    [#441](https://github.com/fortran-lang/stdlib/pull/441)
  - new procedure `count`    [#453](https://github.com/fortran-lang/stdlib/pull/453)
- new module `stdlib_system`
  - new procedure `sleep`    [#54](https://github.com/fortran-lang/stdlib/pull/54)

This project supports compilation with CMake, make and fpm.
The following compilers where tested for building this version of stdlib:

Name | Version | Platform | Architecture
--- | --- | --- | ---
GCC Fortran | 9, 10, 11 | Ubuntu 20.04 | x86\_64
GCC Fortran | 9, 10, 11 | MacOS Catalina 10.15 | x86\_64
GCC Fortran (MSYS) | 11 | Windows Server 2019 | x86\_64
GCC Fortran (MinGW) | 11 | Windows Server 2019 | x86\_64, i686
Intel oneAPI classic | 2021.1 | Ubuntu 20.04 | x86\_64
Intel oneAPI classic | 2021.1 | MacOS Catalina 10.15 | x86\_64

To use this release in fpm depend on

```toml
[dependencies]
stdlib.git = "https://github.com/fortran-lang/stdlib"
stdlib.commit = "d3fb9d4c6ce3fdd7f5bcb738d701037aebbff2ea"
```

---

Discuss this release:

- [Discourse thread](https://fortran-lang.discourse.group/t/2001)
- [Twitter](https://twitter.com/fortranlang/status/1445082459033387013)
