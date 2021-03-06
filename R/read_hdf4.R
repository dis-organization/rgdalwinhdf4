
#' Read HDF4 file
#'
#' This function expects to use the HDF4Image driver of GDAL, and warns
#' if that's not the case.
#' @param file (optional) path or source string to GDAL-readable raster
#' @param ... ignored
#'
#' @return `rgdal SpatialGridDataFrame`
#' @export
#' @importFrom rgdal GDALinfo readGDAL
#' @examples
#' x <- read_hdf4()
#' print(class(x))
read_hdf4 <- function(file, ...) {
  if (missing(file)) {
    file <- system.file("extdata", "asi-AMSR2-s6250-20171211-v5.hdf", package = "rgdalwinhdf4")
    print(file)
    print("")
  }
  stopifnot(nchar(file) > 0)
  op <- options(warn = -1)
  on.exit(options(op), add = TRUE)
  info <- try(rgdal::GDALinfo(file), silent = TRUE)

  if (!inherits(info, "GDALobj")) stop(sprintf("GDAL failed to open this source: %s", file))
  message("\n\nhere comes the data!\n\n")
  rgdal::readGDAL(file, silent = TRUE)
}
