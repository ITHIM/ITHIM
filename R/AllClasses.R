#' The ITHIM ParameterSet class
#'
#' This class defines the set of parameters needed for an
#' ITHIM analysis.  See ITHIM class for more information.
#'
#' @name ParameterSet
#' @rdname ParameterSet
#' @aliases ParameterSet-class
#' @exportClass ParameterSet
setClass("ParameterSet", representation(pAT = "numeric",
                                        meanWalk = "numeric",
                                        meanCycle = "numeric",
                                        metWalk = "numeric",
                                        metCycle = "numeric",
                                        cvTravel = "numeric",
                                        meanLeisure = "numeric",
                                        cvLeisure = "numeric",
                                        alpha = "numeric",
                                        k = "numeric",
                                        quantiles = "vector",
                                        label = "character"
                                        ))
#' The ITHIM class
#'
#' Foo.
#'
#' This line and the next ones go into the details.
#' This line thus appears in the details as well.
#'
#' @name ITHIM
#' @rdname ITHIM
#' @aliases ITHIM-class
#' @exportClass ITHIM
setClass("ITHIM",
         prototype = prototype(elementType = "ParameterSet"),
         contains = "list")
