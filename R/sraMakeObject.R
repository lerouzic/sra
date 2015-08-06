sraMakeObject <-
function (sradata, model, start, fixed, FUNtimeseries) 
{
    ans <- list()
    ans$data <- sradata
    ans$model <- model
    ans$start <- start
    ans$coefficients <- stats4::coef(model)[names(start)]
    sumcoef <- stats4::coef(stats4::summary(model))
    ans$confint <- cbind(sumcoef[,1]-2*sumcoef[,2], sumcoef[,1]+2*sumcoef[,2])
    ans$pred <- list()
    ans$residuals <- list()
    ans$vresiduals <- list()
    for (pop in split(ans$data, ans$data$rep)) {
        range <- 1:(nrow(pop) - 1)
        cc <- c(list(beta = (pop$sel[range] - pop$mean[range])/(pop$var[range]), 
            delta = (pop$vsel[range] - pop$var[range])/pop$var[range]))
        cc <- c(cc, ans$coefficients, unlist(fixed))
        cc$logvarME <- NULL
        ts <- do.call(what = FUNtimeseries, args = cc)
        r <- pop$rep[1]
        ans$pred[[as.character(r)]] <- list()
        ans$pred[[as.character(r)]]$Gen <- names(ts$mean)
        ans$pred[[as.character(r)]]$phen <- ts$mean
        ans$pred[[as.character(r)]]$var <- ts$varP
        ans$pred[[as.character(r)]]$varA <- ts$varA
        ans$residuals[[as.character(r)]] <- ans$data[ans$data[, 
            "rep"] == as.character(r), "mean"] - ts$mean
        ans$vresiduals[[as.character(r)]] <- ans$data[ans$data[, 
            "rep"] == as.character(r), "var"] - ts$varP
    }
    class(ans) <- c("srafit", "list")
    return(ans)
}
