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
                                        meanLogTA = "numeric",
                                        meanLogLA = "numeric",
                                        sdLogTA = "numeric",
                                        sdLogLA = "numeric",
                                        metWalk = "numeric",
                                        metCycle = "numeric",
                                        alpha = "numeric",
                                        k = "numeric",
                                        disease = "factor",
                                        burdenType = "factor",
                                        burdenValue = "numeric",
                                        quantiles = "vector",
                                        sex = "factor",
                                        age = "factor",
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
