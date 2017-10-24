#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### This function coverts the 2001 CDC Age variable to years.
###
### @param value The value for age, i.e., characters 2-4 of the code
###     (sloppy with class!)
### @param unit The units for age, i.e., chatater 1 of the code (sloppy
###     with class!)
### @note This function is likely only applicable to the 2001 data
###     file.
### @return A numeric vector of age in years - this is a test
###
###
convertAge <- function(value, unit){

    value <- ifelse(value == "999", NA, value)

    convertedValue <- ifelse( unit == "1", value,
    ifelse( unit == "2", value/12,
    ifelse( unit == "4", value/365,
    ifelse( unit == "5", value/365/24,
    ifelse( unit == "6", value/365/24/60,
    ifelse( unit == "9", NA, 999 ))))))

    return(as.numeric(convertedValue))

}
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
### Converts age to ITHIM age class
###
### Converts age to ITHIM age class
###
### @param age A vector of ages.  This vector will be coerced to numeric.
###
### @return A character vector of ITHIM age categories
###
###
convertToAgeClass <- function(age){
  age <- as.numeric(age)
  agecat <- ifelse( age <= 4, "00-04", ifelse( age <= 14, "05-14", ifelse( age <= 29, "15-29", ifelse( age <= 44, "30-44", ifelse( age <= 59, "45-59", ifelse( age <= 69, "60-69", ifelse( age <= 79, "70-79", ifelse( age >= 80, "80+", NA))))))))
  agecat <- factor(agecat, levels = c("00-04","05-14","15-29","30-44","45-59","60-69","70-79","80+"))
  return(agecat)
}
s4Methods <- function(class)
{
    methods <-
      showMethods(classes = class, printTo = FALSE)
    methods <- methods[grep("^Function:", methods)]
    sapply(strsplit(methods, " "), "[", 2)
}
setEquality <- function(a,b) identical(sort(a),sort(b))

getTractAgeSex <- function(state, county) {
    require(tidyverse)
  varString <-
    "B01001_003E,B01001_004E,B01001_005E,B01001_006E,B01001_007E,B01001_008E,B01001_009E,B01001_010E,B01001_011E,B01001_012E,B01001_013E,B01001_014E,B01001_015E,B01001_016E,B01001_017E,B01001_018E,B01001_019E,B01001_020E,B01001_021E,B01001_022E,B01001_023E,B01001_024E,B01001_025E,B01001_027E,B01001_028E,B01001_029E,B01001_030E,B01001_031E,B01001_032E,B01001_033E,B01001_034E,B01001_035E,B01001_036E,B01001_037E,B01001_038E,B01001_039E,B01001_040E,B01001_041E,B01001_042E,B01001_043E,B01001_044E,B01001_045E,B01001_046E,B01001_047E,B01001_048E,B01001_049E"

  ACSpop <-
    as.data.frame(jsonlite:::fromJSON(
      paste(
        "https://api.census.gov/data/2015/acs5?get=NAME,",
        varString,
        "&for=tract:*&in=state:",
        state,
        "+county:",
        county,
        "&key=f78d6b6c18608edc379b5a06c55407ceb45e7038",
        sep = ""
      )
    ), stringsAsFactors = FALSE)
  ACSpop <- ACSpop[-1,]

  colnames(ACSpop) <-
    c(
      "name",
      "M_Under 5 years",
      "M_5 to 9 years",
      "M_10 to 14 years",
      "M_15 to 17 years",
      "M_18 and 19 years",
      "M_20 years",
      "M_21 years",
      "M_22 to 24 years",
      "M_25 to 29 years",
      "M_30 to 34 years",
      "M_35 to 39 years",
      "M_40 to 44 years",
      "M_45 to 49 years",
      "M_50 to 54 years",
      "M_55 to 59 years",
      "M_60 and 61 years",
      "M_62 to 64 years",
      "M_65 and 66 years",
      "M_67 to 69 years",
      "M_70 to 74 years",
      "M_75 to 79 years",
      "M_80 to 84 years",
      "M_85 years and over",
      "F_Under 5 years",
      "F_5 to 9 years",
      "F_10 to 14 years",
      "F_15 to 17 years",
      "F_18 and 19 years",
      "F_20 years",
      "F_21 years",
      "F_22 to 24 years",
      "F_25 to 29 years",
      "F_30 to 34 years",
      "F_35 to 39 years",
      "F_40 to 44 years",
      "F_45 to 49 years",
      "F_50 to 54 years",
      "F_55 to 59 years",
      "F_60 and 61 years",
      "F_62 to 64 years",
      "F_65 and 66 years",
      "F_67 to 69 years",
      "F_70 to 74 years",
      "F_75 to 79 years",
      "F_80 to 84 years",
      "F_85 years and over",
      "state",
      "county",
      "tract"
    )

  ACSpop <- ACSpop %>% gather(2:47,key = variable, value = value)

  ACSpop$sex <-  matrix(unlist(strsplit(as.character(ACSpop$variable), "_")), ncol = 2, byrow =T)[, 1]
  ACSpop$acsAge <-  matrix(unlist(strsplit(as.character(ACSpop$variable), "_")), ncol = 2, byrow =T)[, 2]

  ITHIMageKey <-
    c(
      "ageClass1",
      "ageClass2",
      "ageClass2",
      "ageClass3",
      "ageClass3",
      "ageClass3",
      "ageClass3",
      "ageClass3",
      "ageClass3",
      "ageClass4",
      "ageClass4",
      "ageClass4",
      "ageClass5",
      "ageClass5",
      "ageClass5",
      "ageClass6",
      "ageClass6",
      "ageClass6",
      "ageClass6",
      "ageClass7",
      "ageClass7",
      "ageClass8",
      "ageClass8"
    )

  names(ITHIMageKey) <- unique(ACSpop$acsAge) # This vector must have the correct order.  How do we ensure that?
  ACSpop$age <- ITHIMageKey[as.character(ACSpop$acsAge)]

  ACSpop <- ACSpop %>% select(state,county,tract,sex,age,value) %>% group_by(state,county,sex,age) %>% summarise(n = sum(as.integer(value))) %>% ungroup() %>% spread(sex,n) %>% arrange(age) %>% select(M,F) %>% as.data.frame()

  row.names(ACSpop) <- paste0("ageClass",1:8)

  return(ACSpop)

}


getDistribution2 <- function(x){

    n <- ncol(x)

    foobar <- melt(x)
    names(foobar) <- c("age","k","value")
    D <- foobar  %>% arrange(age) %>% cbind(.,F = cumsum(rep(1,n)/(n+1)))

    foo <- c("00-04","05-14","15-29","30-44","45-59","60-69","70-79","80+")
    names(foo) <- paste0("ageClass",1:8)


    D <- within(D, age <- as.factor(foo[age]))

    return(D)
}



getDistribution <- function(ITHIM, type = "TotalMET"){

    foo <- ITHIM@quintiles[[type]]$M
    D <- data.frame(sex = "M", getDistribution2(foo))

    foo <- ITHIM@quintiles[[type]]$F
    D <- rbind(D, data.frame(sex = "F", getDistribution2(foo)))

    D <- within(D, age <-  as.factor(age))

    return(D)
}



compareDistributions <- function(ITHIM.baseline, ITHIM.scenario, type = "TotalMET"){

    D.baseline <- getDistribution(ITHIM.baseline, type = type)

    D.scenario <- getDistribution(ITHIM.scenario, type = type)

    D <- rbind(cbind(D.baseline, vision = "baseline"),cbind(D.scenario, vision = "scenario"))

    D <- within(D, {
        vision <-  as.factor(vision)
        age <-  factor(age, levels = c("00-04","05-14","15-29","30-44","45-59","60-69","70-79","80+"))
        sex <-  as.factor(sex)
    })

    p <- ggplot(D, aes(x = value, y = F, colour = vision))
    p <- p + geom_line(aes(colour = vision)) + facet_grid( sex ~ age) + xlab(type) + ylab("Cumulative Distribution")

    return(p)
}



## plotRR <- function(RR.baseline,RR.scenario){
## D <- melt(list(baseline = RR.baseline, scenario = RR.scenario), c("age","quint"), value.name = "RR")
## D <- subset(D, !(age %in% paste0("ageClass",1:2)))
## names(D) <- c("age","quint","RR","sex","vision")
## p <- ggplot(D, aes(age,  RR)) + geom_bar(aes(fill=vision), stat = "identity", position = "dodge")
## p <- p + facet_grid( quint ~ sex )
## return(p)
## }
