#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([gvterm], [0.1.0], [BUG-REPORT-ADDRESS])

# Checks for programs.
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([1.14 gnu tar-ustar silent-rules subdir-objects \
 color-tests parallel-tests -Woverride -Wno-portability])

AM_SILENT_RULES([yes])
AC_USE_SYSTEM_EXTENSIONS
AC_PROG_CC
GUILE_PKG([3.0 2.2])
GUILE_PROGS
GUILE_SITE_DIR
AC_USE_SYSTEM_EXTENSIONS
PKG_CHECK_MODULES([GUILE], [guile-3.0])
PKG_CHECK_MODULES([VTERM], [vterm])
PKG_CHECK_MODULES([G_WRAP_2_GUILE], [g-wrap-2.0-guile])
dnl PKG_CHECK_VAR([VTERM_LIBDIR],[vterm],[libdir])
dnl PKG_CHECK_VAR([VTERM_LIBDIR],[vterm],[include])
LT_INIT([dlopen])
AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([pre-inst-env], [chmod +x pre-inst-env])
# Checks for libraries.

# Checks for header files.

# Checks for typedefs, structures, and compiler characteristics.

# Checks for library functions.

AC_OUTPUT
