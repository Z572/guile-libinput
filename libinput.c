#include <libguile.h>
#include <libinput.h>
#include <stdio.h>

int open_restricted(const char *path, int flags, void *user_data) {
  SCM proc = scm_car(user_data);
  return scm_to_int(
      scm_call_2(proc, scm_from_locale_string(path), scm_from_int(flags)));
};
void close_restricted(int fd, void *user_data) {
  SCM proc = scm_cdr(user_data);
  scm_call_1(proc, scm_from_int(fd));
};
const struct libinput_interface interface = {
    .open_restricted = open_restricted, .close_restricted = close_restricted};

void libinput_finalizer(void *data) {
  struct libinput *libinput = data;
  SCM cons = libinput_get_user_data(libinput);
  scm_gc_unprotect_object(cons);
  libinput_unref(libinput);
}

SCM_DEFINE(g_libinput_path_create_context, "%libinput-path-create-context", 2,
           0, 0, (SCM open, SCM close), "") {
  SCM cons = scm_cons(open, close);
  scm_gc_protect_object(cons);
  return scm_from_pointer(libinput_path_create_context(&interface, cons),
                          libinput_finalizer);
}

void init_libinput() {
#include "libinput.x"
}
