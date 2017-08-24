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
#prob <- seq(0,1,length.out=n)
quantiles <- quantile(t.vec, prob = prob)
D <- data.frame(quantiles = quantiles, prob = prob)
return(D)

}

computeAF <- function(p.AT.baseline, p.AT.scenario, mean.AT.baseline, mean.AT.scenario, sd.AT.baseline, sd.AT.scenario, mean.NT.baseline, mean.NT.scenario, sd.NT.baseline, sd.NT.scenario, alpha, k){
    D.baseline <- getQuantilesMixture(p.AT = p.AT.baseline, mean.AT = mean.AT.baseline, sd.AT = sd.AT.baseline, mean.NT = mean.NT.baseline, sd.NT = sd.NT.baseline)
    RR.baseline <- getRR(D.baseline$quantiles, alpha = alpha, k = k)
    D.scenario <- getQuantilesMixture(p.AT = p.AT.scenario, mean.AT = mean.AT.scenario, sd.AT = sd.AT.scenario, mean.NT = mean.NT.scenario, sd.NT = sd.NT.scenario)
    RR.scenario <- getRR(D.scenario$quantiles, alpha = alpha, k = k)
    AF <- 1 - sum(RR.scenario)/sum(RR.baseline)
    return(AF)
}

