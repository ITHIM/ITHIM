#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieves the mean travel activity
#'
#' Retrieves the mean travel activity
#'
#' @param object A ParameterSet object
#'
#' @return Mean travel activity
#'
#' @note For a list of parameter names use \code{getParameterNames}.
#'
#' @export
#' @docType methods
#' @rdname getTravelActivity-methods
setGeneric("getTravelActivity", function(object) standardGeneric("getTravelActivity"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieves the quantiles of the mixture distibution
#'
#' Retrieves the quantiles of the mixture distibution
#'
#' @param object A ParameterSet object
#'
#' @return Foo
#'
#' @note For a list of parameter names use \code{getParameterNames}.
#'
#' @export
#' @docType methods
#' @rdname getQuantilesMixture-methods
setGeneric("getQuantilesMixture", function(object) standardGeneric("getQuantilesMixture"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieves the quantiles of the mixture distibution
#'
#' Retrieves the quantiles of the mixture distibution
#'
#' @param baseline ps
#' @param scenario ps
#'
#' @return Foo
#'
#' @note For a list of parameter names use \code{getParameterNames}.
#'
#' @export
#' @docType methods
#' @rdname computeAF-methods
setGeneric("computeAF", function(baseline, scenario) standardGeneric("computeAF"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Update an ITHIM object
#'
#' Takes an ITHIM object as input and returns a new ITHIM object with
#' parameters updated accordingly.
#'
#' @param x ITHIM object or a ParameterSet object
#' @param parList A named list of parameters
#'
#' @return An ITHIM object
#'
#' @note For a list of parameter names use \code{getParameterNames}.
#'
#' @examples
#' ITHIM <- createITHIM()
#' getMeans(ITHIM)
#' ITHIM.new <- update(ITHIM, list(muwt = 10, muct = 5))
#' getMeans(ITHIM.new)
#'
#' @export
#' @docType methods
#' @rdname update-methods
setGeneric("update", function(x, parList) standardGeneric("update"))
## #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## #~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## #' Tile plot
## #'
## #' Creates a tile plot
## #'
## #' @param x ITHIM object
## #' @param n A numeric value indicating the length of the walk and
## #'     cycle vectors
## #'
## #' @return A figure created by ggplot2
## #'
## #' @export
## #' @docType methods
## #' @rdname tilePlot-methods
## setGeneric("tilePlot", function(x, n) standardGeneric("tilePlot"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Gets Burden
#'
#' Gets burden
#'
#' @param x ITHIM object
#' @param bur A character string indicating the type of disease burden
#'     measure.  Available values are "deaths", "yll", "yld" and
#'     "daly".  The default value is "daly".
#' @param dis A character string indicating which disease to consider.
#'     Possible values are "BreastCancer", "ColonCancer", "HHD",
#'     "IHD", "Stroke", "Dementia", "Diabetes", "Depression",
#'     "LungCancer", "InflammatoryHD", "RespiratoryDisease" and
#'     "RTIs".  See \code{readGBD} for more information.  The default
#'     value is "all" which returns the sum of disease burden across
#'     these diseases.
#'
#' @return A numerical value for the disease burden
#'
#' @note If bur is set wrong 0 will be returned, not an error message.
#'     This is a bug.  It should not return zero in this case.  That
#'     is misleading.
#'
#' @export
#' @docType methods
#' @rdname getBurden-methods
setGeneric("getBurden", function(x, bur, dis) standardGeneric("getBurden"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Gets Change in Disease Burden due to Physical Activity
#'
#' Gets Change in Disease Burden due to Physical Activity
#'
#' @param baseline ITHIM object
#' @param scenario ITHIM object
#'
#' @param bur A character string indicating the type of disease burden
#'     measure.  Available values are "deaths", "yll", "yld" and
#'     "daly".  The default value is "daly".
#' @param dis A character string indicating which disease to consider.
#'     Possible values are "BreastCancer", "ColonCancer",
#'     "Depression", "Dementia", "Diabetes" and "CVD".  The default
#'     value is "all" which returns the sum of disease burden across
#'     these diseases.
#' @param type A character string.  Either "percent" or "absolute",
#'     default is "absolute"
#'
##' @inheritParams getBurden
#'
#' @return A burden value
#'
#' @note The parameters dis and bur should be harmonized across
#'     \code{getBurden} and \code{deltaBurden}.
#'
#' @export
#' @docType methods
#' @rdname deltaBurden-methods
setGeneric("deltaBurden", function(baseline, scenario, bur, dis, type) standardGeneric("deltaBurden"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Gets Road Injury counts from ITHIM object
#'
#' Gets Road Injury counts from ITHIM object
#'
#' @param x ITHIM object
#'
#' @return A list of matrices of road injury counts.
#'
#' @note The matrices have striking modes as rows and victim modes as
#'     columns.  NOV is considered a striking mode.
#'
#' @export
#' @docType methods
#' @rdname getRoadInjuries-methods
setGeneric("getRoadInjuries", function(x) standardGeneric("getRoadInjuries"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieves the distance by road type
#'
#' Retrieve distance by road type contained in ITHIM object.
#'
#' @param x An ITHIM object or a ParameterSet object
#'
#' @return A list of matrices...
#'
#' @note The road injury component of the ITHIM package is still under
#'     development.  It is not recommended to use this method right
#'     now.
#'
#' @export
#' @docType methods
#' @rdname getDistRoadType-methods
setGeneric("getDistRoadType", function(x) standardGeneric("getDistRoadType"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Returns the names of the parameters in the ITHIM object
#'
#' Returns the names of the parameters in the ITHIM object
#'
#' @param x ITHIM object or a ParameterSet object
#'
#' @return A character vector of parameter names
#'
#' @export
#' @docType methods
#' @rdname getParameterNames-methods
setGeneric("getParameterNames", function(x) standardGeneric("getParameterNames"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Create an ITHIM object
#'
#' Returns an ITHIM object.
#'
#' @param activeTransportFile A character string indicating the name
#'     of the file containing mean walk and cycle times.  Default
#'     value uses data from the inst directory.
#' @param GBDFile A character string indicating the name of the file
#'     containing the disease burden data.  Default value uses data
#'     from the inst directory.
#' @param roadInjuriesFile A character string indicating the name of
#'     the file containing the road injury data (still under
#'     development).  Default value uses data from the inst directory.
#' @param distRoadTypeFile A character string indicating the name of
#'     the file containing distances (person and vehicle) by road type
#'     (minor, major, motorOnly)
#' @param safetyInNumbersFile A character string indicating the name
#'     of the file conatining safety in number parameters.
#'
#' @note The path is relative to current working directory.
#'
#' @note GBD stands for Global Burden of Disease.  We use this simply
#'     because this was our original data source.  It does not need to
#'     be estimates from GBD.  Any disease burden estimate is fine.
#' @note The disease burden file must contain values for any of the
#'     following diseases; "BreastCancer", "ColonCancer", "CVD",
#'     "Dementia", "Diabetes", "Depression" and "RTIs", and must be
#'     labeled accordingly.  RTI stands for road traffic injury and is
#'     needed only if the road injury component is being used.
#'
#' @note The format for the disease burden will be normalized and
#'     explained in greater detail soon.  See
#'     \url{https://github.com/syounkin/ITHIM/blob/devel/inst/gbd.csv}
#'     for an example.
#'
#' @return An object of class ITHIM
#'
#' @note If run with no arguments this function will return the
#'     default ITHIM object
#'
#' @export
#' @docType methods
#' @rdname createITHIM-methods
#' @examples
#'
#' activeTransportFile <- system.file("activeTransportTime.csv", package = "ITHIM")
#' GBDFile <- system.file("gbd.csv", package = "ITHIM")
#'
#' ITHIM <- createITHIM(activeTransportFile = activeTransportFile, GBDFile = GBDFile)
#'
setGeneric("createITHIM", function(activeTransportFile, GBDFile, roadInjuriesFile, distRoadTypeFile, safetyInNumbersFile) standardGeneric("createITHIM"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieve a ParameterSet object
#'
#' Returns the ParameterSet object embedded in an ITHIM object.
#'
#' @param x An ITHIM object
#'
#' @return An object of class ParameterSet
#'
#' @export
#' @docType methods
#' @rdname getParameterSet-methods
setGeneric("getParameterSet", function(x) standardGeneric("getParameterSet"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieve mean values
#'
#' Retrieves walking, cycling and nonTravel activity means from an
#' ITHIM object.
#'
#' @param x An ITHIM object
#'
#' @return A numeric vector of means.
#'
#' @export
#' @docType methods
#' @rdname getMeans-methods
setGeneric("getMeans", function(x) standardGeneric("getMeans"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieves the Global Burden of Disease (GBD) data
#'
#' Retrieves the Global Burden of Disease (GBD) data from an ITHIM object
#'
#' @param x An ITHIM object
#' @param format A character string indicating what form to return the
#'     data.  Possible values are "data.frame" and "list".
#'
#' @return Either a list or a data frame containg GBD data.
#'
#' @export
#' @docType methods
#' @rdname getGBD-methods
setGeneric("getGBD", function(x, format = "data.frame") standardGeneric("getGBD"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieves the Safety in Numbers parameters
#'
#' Retrieves the Safety in Numbers parameters
#'
#' @param x An ITHIM or ParameterSet object
#'
#' @return An array of safety in numbers parameters
#'
#' @export
#' @docType methods
#' @rdname getSiN-methods
setGeneric("getSiN", function(x) standardGeneric("getSiN"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Returns the mean walk time matrix
#'
#' Returns the mean walk time matrix
#'
#' @param x An ITHIM object
#' @param form an integer
#'
#' @return A numerical matrix of mean walk time
#'
#' @export
#' @docType methods
#' @rdname getWalkTime-methods
setGeneric("getWalkTime", function(x, form) standardGeneric("getWalkTime"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Returns the mean cycle time matrix
#'
#' Returns the mean cycle time matrix
#'
#' @inheritParams getWalkTime
#'
#' @return A numerical matrix of mean cycle time
#'
#' @export
#' @docType methods
#' @rdname getCycleTime-methods
setGeneric("getCycleTime", function(x, form) standardGeneric("getCycleTime"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Returns the non-travel METs matrix
#'
#' Returns the non-travel METs matrix
#'
#' @inheritParams getWalkTime
#'
#' @return A numerical matrix of mean non-travel activity
#'
#' @export
#' @docType methods
#' @rdname getNonTravelMETs-methods
setGeneric("getNonTravelMETs", function(x, form) standardGeneric("getNonTravelMETs"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Retrieves population matrix from U.S. Census
#'
#' Retrieves population matrix from U.S. Census
#'
#' @param state An integer representing the state ID
#' @param county An integer representing the county ID
#' @param msa An integer representing the MSA ID (NHTS specific)
#'
#' @return A data frame of population counts
#' @export
#' @docType methods
#' @rdname getPopulation-methods
#' @note The underlying function, \code{getTractAgeSex}, was written
#'     primarily by Vargo
#'
#'
setGeneric("getPopulation", function(msa, state, county) standardGeneric("getPopulation"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Foo
#'
#' Foo
#'
#' @param baseline foo
#' @param scenario foo
#'
#' @return foo
#' @export
#' @docType methods
#' @rdname tabulateDeltaBurden-methods
#'
#'
setGeneric("tabulateDeltaBurden", function(baseline, scenario) standardGeneric("tabulateDeltaBurden"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Get F
#'
#' Get F
#'
#' @param x ITHIM or ParameterSetobject
#' @param prob a logical value
#'
#' @return foo
#' @export
#' @docType methods
#' @rdname getF-methods
#'
#'
setGeneric("getF", function(x, prob) standardGeneric("getF"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Foo
#'
#' Foobar
#'
#' @param baseline ITHIM object
#' @param scenario ITHIM object
#'
#' @return A list of attributable fractions
#'
#' @export
#' @docType methods
#' @rdname getAF-methods
setGeneric("getAF", function(baseline, scenario) standardGeneric("getAF"))
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#' Foo
#'
#' Foobar
#'
#' @param baseline ITHIM object
#' @param scenario ITHIM object
#'
#' @return A vector of summarised attributable fractions
#'
#' @export
#' @docType methods
#' @rdname summariseAF-methods
setGeneric("summariseAF", function(baseline, scenario) standardGeneric("summariseAF"))
