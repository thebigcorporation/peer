# Vendored dependencies
This directory contains vendored deps for PEER. At the time of readme creation, this includes boost.math version 1.84.0, Eigen 3.4.0, and Alglib 4.0.1.

In an environment where we can get these dependencies from somewhere else, we should. For example, both conda-forge and CRAN already distribute Eigen and Boost. However, in the interest of creating fully standalone source packages that are installable in any R or Python environment, we're including vendored copies of these.

