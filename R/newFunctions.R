getQuantilesMixtureFunction <- function(p.AT, mean.AT, sd.AT, mean.NT, sd.NT, prob){

meanlog.AT <- log(mean.AT/sqrt(1+sd.AT^2/mean.AT^2))
sdlog.AT <- sqrt(log(1+sd.AT^2/mean.AT^2))

meanlog.NT <- log(mean.NT/sqrt(1+sd.NT^2/mean.NT^2))
sdlog.NT <- sqrt(log(1+sd.NT^2/mean.NT^2))

at.vec <- c()
nt.vec <- c()
t.vec <- c()

for( i in 1:1e4){
    if( runif(1) > p.AT ){
        at <- 0
        }else{
            at <- rlnorm(1,meanlog = meanlog.AT, sdlog = sdlog.AT)
            }
    at.vec <- c(at.vec,at)
    nt <- rlnorm(1,meanlog = meanlog.NT, sdlog = sdlog.NT)
    nt.vec <- c(nt.vec,nt)
}

t.vec <- at.vec + nt.vec

n <- 1e2
quantiles <- quantile(t.vec, prob = prob)
D <- data.frame(quantiles = quantiles, prob = prob)
return(D)

}

getRR <- function(x,alpha,k){
    return(exp(alpha*(x^k)))
}

computeAF <- function(baseline, scenario){
    RR.baseline <- getRR(getQuantilesMixture(baseline), alpha = baseline@alpha, k = baseline@k)
    RR.scenario <- getRR(getQuantilesMixture(scenario), alpha = scenario@alpha, k = scenario@k)
    AF <- 1 - sum(RR.scenario)/sum(RR.baseline)
    return(AF)
}
