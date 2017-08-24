setMethod("show", signature(object="ITHIM"), function(object){
    return(lapply(object,show))
#  cat("Hello Vargo, this is an ITHIM object.  Currently the methods plot, show, get DALYs and update are available.  This is the show method.  Try plot().  I can't get summary to work.\n", sep = "")
})

#' @rdname update-methods
#' @aliases update
#' @export
setMethod("update", signature(x = "ITHIM", parList = "missing"), function(x, parList){
    x <- new("ITHIM", parameters = parameters <- x@parameters, means = means <- computeMeanMatrices(as(parameters,"list")), quintiles = getQuintiles(means, as(parameters,"list")))

    return(x)
})

#' @rdname update-methods
#' @aliases update
#' @export
setMethod("update", signature(x = "ITHIM", parList = "ParameterSet"), function(x, parList){
    x@parameters <- parList
    x <- update(x)
    return(x)
})

#' @rdname update-methods
#' @aliases update
#' @export
setMethod("update", signature(x = "ITHIM", parList = "list"), function(x, parList){

    parList <- update(x@parameters, parList)
    x <- update(x, parList)

    return(x)
})

setAs("ITHIM", "list", function(from) list(parameters = as(from@parameters,"list"),
                                           means = from@means,
                                           quintiles = from@quintiles))

#' @rdname getBurden-methods
#' @aliases getBurden
#' @export
setMethod("getBurden", signature(x = "ITHIM", bur = "character", dis = "character"), function(x, bur, dis){
    suppressMessages(
        if( dis[1] == "all" ){
            foo <- getGBD(x)
            foo <- foo[foo$burdenType == bur,]
        return(sum(foo$value, na.rm = TRUE))
        }else{
            foo <- getGBD(x)
            foo <- foo[foo$burdenType == bur & foo$disease %in% dis,]
        return(sum(foo$value, na.rm = TRUE))
    })
})

#' @rdname getBurden-methods
#' @aliases getBurden
#' @export
setMethod("getBurden", signature(x = "ITHIM", bur = "character", dis = "missing"), function(x, bur){
    return(getBurden(x, bur = bur, dis = "all"))
})

#' @rdname getBurden-methods
#' @aliases getBurden
#' @export
setMethod("getBurden", signature(x = "ITHIM", bur = "missing", dis = "character"), function(x, dis){
    return(getBurden(x, bur = "daly", dis = dis))
})

#' @rdname getBurden-methods
#' @aliases getBurden
#' @export
setMethod("getBurden", signature(x = "ITHIM", bur = "missing", dis = "missing"), function(x){
    return(getBurden(x, bur = "daly", dis = "all"))
})

#' @rdname deltaBurden-methods
#' @aliases deltaBurden
#' @export
setMethod("deltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM", bur = "character", dis = "character", type = "character"), function(baseline, scenario, bur, dis, type){
    return(deltaBurdenFunction(baseline, scenario, bur = bur, dis = dis, type = type))
})

#' @rdname deltaBurden-methods
#' @aliases deltaBurden
#' @export
setMethod("deltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM", bur = "character", dis = "character", type = "missing"), function(baseline, scenario, bur, dis, type){
    return(deltaBurdenFunction(baseline, scenario, bur = bur, dis = dis))
})

#' @rdname deltaBurden-methods
#' @aliases deltaBurden
#' @export
setMethod("deltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM", bur = "character", dis = "missing", type = "character"), function(baseline, scenario, bur, dis, type){
    return(deltaBurdenFunction(baseline, scenario, bur = bur, type = type))
})

#' @rdname deltaBurden-methods
#' @aliases deltaBurden
#' @export
setMethod("deltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM", bur = "character", dis = "missing", type = "missing"), function(baseline, scenario, bur, dis, type){
    return(deltaBurdenFunction(baseline, scenario, bur = bur))
})

#' @rdname deltaBurden-methods
#' @aliases deltaBurden
#' @export
setMethod("deltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM", bur = "missing", dis = "character", type = "character"), function(baseline, scenario, bur, dis, type){
    return(deltaBurdenFunction(baseline, scenario, dis = dis, type = type))
})

#' @rdname deltaBurden-methods
#' @aliases deltaBurden
#' @export
setMethod("deltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM", bur = "missing", dis = "character", type = "missing"), function(baseline, scenario, bur, dis, type){
    return(deltaBurdenFunction(baseline, scenario, dis = dis))
})

#' @rdname deltaBurden-methods
#' @aliases deltaBurden
#' @export
setMethod("deltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM", bur = "missing", dis = "missing", type = "character"), function(baseline, scenario, bur, dis, type){
    return(deltaBurdenFunction(baseline, scenario, type = type))
})

#' @rdname deltaBurden-methods
#' @aliases deltaBurden
#' @export
setMethod("deltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM", bur = "missing", dis = "missing", type = "missing"), function(baseline, scenario, bur, dis, type){
    return(deltaBurdenFunction(baseline, scenario))
})

#' @rdname getParameterSet-methods
#' @aliases getParameterSet
#' @export
setMethod("getParameterSet", signature(x = "ITHIM"), function(x){
    return(x@parameters)
})

#' @rdname getParameterNames-methods
#' @aliases getParameterNames
#' @export
setMethod("getParameterNames", signature(x = "ITHIM"), function(x){
    return(getParameterNames(getParameterSet(x)))
})

#' @rdname getMeans-methods
#' @aliases getMeans
#' @export
setMethod("getMeans", signature(x = "ITHIM"), function(x){
    return(getMeans(getParameterSet(x)))
})

#' @rdname getRoadInjuries-methods
#' @aliases getRoadInjuries
#' @export
setMethod("getRoadInjuries", signature(x = "ITHIM"), function(x){
    return(getRoadInjuries(getParameterSet(x)))
})

#' @rdname getDistRoadType-methods
#' @aliases getDistRoadType
#' @export
setMethod("getDistRoadType", signature(x = "ITHIM"), function(x){
    return(getDistRoadType(getParameterSet(x)))
})

#' @rdname getGBD-methods
#' @aliases getGBD
#' @export
setMethod("getGBD", signature(x = "ITHIM", format = "character"), function(x, format){
    if(format == "list"){
        return(getParameterSet(x)@GBD)
    }else if(format == "data.frame"){
        GBD <- do.call("rbind", do.call("rbind",getParameterSet(x)@GBD))
        return(GBD)
    }else{
        message("Error with getGBD format argument.")
        }
})

#' @rdname getGBD-methods
#' @aliases getGBD
#' @export
setMethod("getGBD", signature(x = "ITHIM", format = "missing"), function(x){
    getGBD(x, format = "data.frame")
})
#' @rdname getSiN-methods
#' @aliases getSiN
#' @export
setMethod("getSiN", signature(x = "ITHIM"), function(x){
    return(getSiN(getParameterSet(x)))
})
#' @rdname getF-methods
#' @aliases getF
#' @export
setMethod("getF", signature(x = "ITHIM", prob = "logical"), function(x, prob){
    return(getF(getParameterSet(x), prob = prob))
})
#' @rdname getF-methods
#' @aliases getF
#' @export
setMethod("getF", signature(x = "ITHIM", prob = "missing"), function(x, prob){
    return(getF(getParameterSet(x), prob = FALSE))
})
#' @rdname getWalkTime-methods
#' @aliases getWalkTime
#' @export
setMethod("getWalkTime", signature(x = "ITHIM", form = "integer"), function(x, form){
    return(getWalkTimeFunction(x, form))
})
#' @rdname getWalkTime-methods
#' @aliases getWalkTime
#' @export
setMethod("getWalkTime", signature(x = "ITHIM", form = "numeric"), function(x, form){
    return(getWalkTimeFunction(x, as.integer(form)))
})
#' @rdname getWalkTime-methods
#' @aliases getWalkTime
#' @export
setMethod("getWalkTime", signature(x = "ITHIM", form = "missing"), function(x, form){
    return(getWalkTimeFunction(x))
})
#' @rdname getCycleTime-methods
#' @aliases getCycleTime
#' @export
setMethod("getCycleTime", signature(x = "ITHIM", form = "integer"), function(x, form){
    return(getCycleTimeFunction(x, form))
})
#' @rdname getCycleTime-methods
#' @aliases getCycleTime
#' @export
setMethod("getCycleTime", signature(x = "ITHIM", form = "numeric"), function(x, form){
    return(getCycleTimeFunction(x, as.integer(form)))
})
#' @rdname getCycleTime-methods
#' @aliases getCycleTime
#' @export
setMethod("getCycleTime", signature(x = "ITHIM", form = "missing"), function(x, form){
    return(getCycleTimeFunction(x))
})
#' @rdname getNonTravelMETs-methods
#' @aliases getNonTravelMETs
#' @export
setMethod("getNonTravelMETs", signature(x = "ITHIM", form = "integer"), function(x, form){
    return(getNonTravelMETsFunction(x, form))
})
#' @rdname getNonTravelMETs-methods
#' @aliases getNonTravelMETs
#' @export
setMethod("getNonTravelMETs", signature(x = "ITHIM", form = "numeric"), function(x, form){
    return(getNonTravelMETsFunction(x, as.integer(form)))
})
#' @rdname getNonTravelMETs-methods
#' @aliases getNonTravelMETs
#' @export
setMethod("getNonTravelMETs", signature(x = "ITHIM", form = "missing"), function(x, form){
    return(getNonTravelMETsFunction(x))
})
#' @rdname tabulateDeltaBurden-methods
#' @aliases tabulateDeltaBurden
#' @export
setMethod("tabulateDeltaBurden", signature(baseline = "ITHIM", scenario = "ITHIM"), function(baseline, scenario){
    return(tabulateDeltaBurdenFunction(baseline, scenario))
})
#' @rdname getAF-methods
#' @aliases getAF
#' @export
setMethod("getAF", signature(baseline = "ITHIM", scenario = "ITHIM"), function(baseline, scenario){
    CM <- compareModels(baseline, scenario)
    return(CM$AF)
})
#' @rdname summariseAF-methods
#' @aliases summariseAF
#' @export
setMethod("summariseAF", signature(baseline = "ITHIM", scenario = "ITHIM"), function(baseline, scenario){
    phi <- summariseAFFunction(baseline, scenario)
    return(phi)
})


summariseAFFunction <- function(baseline, scenario){
    require("tidyverse")
    foo <- getGBD(baseline) %>% tbl_df(.) %>% dplyr::filter(., burdenType == "deaths") %>% tidyr::spread(., sex, value) %>% dplyr::select(., disease,M,F)
    foo <- lapply(split(foo,foo$disease), function(x) x[,-1])
    AF <- getAF(baseline,scenario)
    diseaseVec <- intersect(names(foo),names(AF))

    phi <- mapply(function(x,y) sum(x*y), AF[diseaseVec], foo[diseaseVec])
    return(phi)
}
