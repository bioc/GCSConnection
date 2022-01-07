#' @useDynLib GCSConnection, .registration = TRUE
#' @importFrom googleCloudStorageR gcs_get_global_bucket
#' @importFrom googleAuthR gar_auth_service
#' @importFrom stats setNames
#' @import httr
#' @import Rcpp
#' @import methods
#' @importFrom jsonlite fromJSON
#' @importFrom utils URLencode
NULL

.onLoad <- function(libname, pkgname) {
    gcs_cloud_auth()
    pkg_namespace <- getNamespace(pkgname)
    C_package_onLoad(pkg_namespace)
}
.onAttach <- function(libname, pkgname) {
    msg <- sprintf(
        "Package '%s' is deprecated and will be removed from Bioconductor
         version %s", pkgname, "3.16")
    .Deprecated(msg=paste(strwrap(msg, exdent=2), collapse="\n"))
}
