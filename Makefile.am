GOBJECTS = $(SOURCES:%.scm=%.go) $(NODIST_SOURCES:%.scm=%.go)

nobase_mod_DATA = $(SOURCES) $(NOCOMP_SOURCES) $(NODIST_SOURCES)
nobase_go_DATA = $(GOBJECTS)

guile_install_go_files = install-nobase_goDATA
$(guile_install_go_files): install-nobase_modDATA

CLEANFILES = $(GOBJECTS)
EXTRA_DIST = $(SOURCES) $(NOCOMP_SOURCES)
GUILE_WARNINGS =                                          \
  -Wunbound-variable -Warity-mismatch -Wshadowed-toplevel \
  -Wmacro-use-before-definition                           \
  -Wunused-variable                                       \
  -Wduplicate-case-datum -Wbad-case-datum                 \
  -Wformat

SUFFIXES = .scm .go
.scm.go:
	$(AM_V_GEN)$(top_builddir)/pre-inst-env $(GUILE_TOOLS) compile $(GUILE_TARGET) $(GUILE_WARNINGS) -o "$@" "$<"


moddir=$(prefix)/share/guile/site/$(GUILE_EFFECTIVE_VERSION)
godir=$(libdir)/guile/$(GUILE_EFFECTIVE_VERSION)/site-ccache
SOURCES = libinput.scm libinput/config.scm
BUILT_SOURCES= $(filter %.x, $(libguile_libinput_la_SOURCES:%.c=%.x))
.c.x:
	$(AM_V_GEN)$(top_builddir)/pre-inst-env guile-snarf -o $@ $< $(libguile_libinput_la_CFLAGS)
libguile_libinput_la_SOURCES= libinput.c
libguile_libinput_la_CFLAGS= $(LIBINPUT_CFLAGS) $(GUILE_CFLAGS)
libguile_libinput_la_LIBADD= $(LIBINPUT_LIBS) $(GUILE_LIBS)
lib_LTLIBRARIES = libguile_libinput.la
