getQuantilesMixtureFunction <- function(p.AT, mean.AT, sd.AT, mean.NT, sd.NT, prob){

    ## meanlog.AT <- log(mean.AT/sqrt(1+sd.AT^2/mean.AT^2))
    ## sdlog.AT <- sqrt(log(1+sd.AT^2/mean.AT^2))

    ## meanlog.NT <- log(mean.NT/sqrt(1+sd.NT^2/mean.NT^2))
    ## sdlog.NT <- sqrt(log(1+sd.NT^2/mean.NT^2))

    meanlog.AT <- mean.AT
    sdlog.AT <- sd.AT

    meanlog.NT <- mean.NT
    sdlog.NT <- sd.NT

    n <- 1e5
    pseudo <- runif(n)
    at.vec <- ifelse(pseudo > p.AT, 0, rlnorm(n,meanlog = meanlog.AT, sdlog = sdlog.AT))
    nt.vec <- rlnorm(n,meanlog = meanlog.NT, sdlog = sdlog.NT)
    t.vec <- at.vec + nt.vec

    quantiles <- quantile(t.vec, prob = prob)
    D <- data.frame(quantiles = quantiles, prob = prob)
    return(D)

}

getRR <- function(x,alpha,k){
    return(exp(alpha*(x^k)))
}

computeAFFunction <- function(baseline, scenario){
    RR.baseline <- getRR(getQuantilesMixture(baseline), alpha = baseline@alpha, k = baseline@k)
    RR.scenario <- getRR(getQuantilesMixture(scenario), alpha = scenario@alpha, k = scenario@k)
    AF <- 1 - sum(RR.scenario)/sum(RR.baseline)
    return(AF)
}
