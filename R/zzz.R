# .onLoad <- function(libname, pkgname) {
#
#   warn_depreciated()
#
#   invisible()
# }

.onAttach <- function(libname, pkgname) {

  warn_depreciated()

}
