#                                               -*- Autoconf -*-
# Process this file with autoconf to produce a configure script.

AC_PREREQ([2.71])
AC_INIT([guile-libinput], [0.0.1], [873216071@qq.com])

# Checks for programs.
AC_CONFIG_MACRO_DIR([m4])
AC_CONFIG_AUX_DIR([build-aux])
AM_INIT_AUTOMAKE([1.14 gnu tar-ustar silent-rules subdir-objects \
 color-tests parallel-tests -Woverride -Wno-portability])
AC_CONFIG_FILES([gen.scm])
AC_CONFIG_FILES([Makefile])
AC_CONFIG_FILES([libinput/config.scm])
AC_CONFIG_FILES([pre-inst-env], [chmod +x pre-inst-env])

AM_SILENT_RULES([yes])

GUILE_PKG([3.0 2.2])
GUILE_PROGS
GUILE_SITE_DIR

PKG_CHECK_MODULES([GUILE], [guile-3.0])
PKG_CHECK_MODULES([LIBINPUT], [libinput])
PKG_CHECK_VAR([LIBINPUT_LIBDIR],[libinput],[libdir])
PKG_CHECK_VAR([LIBINPUT_INCLUDEDIR],[libinput],[includedir])

AC_SUBST([LIBINPUT_LIBDIR])
AC_SUBST([LIBINPUT_INCLUDEDIR])

GUILE_MODULE_REQUIRED([bytestructures guile])
GUILE_MODULE_REQUIRED([bytestructure-class])

guilemoduledir="${datarootdir}/guile/site/$GUILE_EFFECTIVE_VERSION"
guileobjectdir="${libdir}/guile/$GUILE_EFFECTIVE_VERSION/site-ccache"

AC_SUBST([guilemoduledir])
AC_SUBST([guileobjectdir])

AC_OUTPUT
