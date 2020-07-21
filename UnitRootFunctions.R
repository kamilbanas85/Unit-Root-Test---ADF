listOfPackagesToInstall <- c('urca','erer','zoo','gridExtra','ggplot2')

InstallRequiredPackages <- function(x){
  
  if(!(x %in% installed.packages()[,"Package"])){
    install.packages(x)
  }
}

invisible(lapply(listOfPackagesToInstall, InstallRequiredPackages))
require(ggplot2)

########################################################

ADFUnitRoot <- function(TimeSeries, 
                        type = 'trend', 
                        LagsNumber = 10,
                        selectlags = "BIC"){
  
  # type = ('none','drift','trent')
  # selectlags = c("Fixed", "AIC", "BIC")
  
  if(selectlags == 'AIC' | selectlags == 'BIC'){
    
    LagsAICtestList <- matrix(ncol=2, nrow=LagsNumber)
    LagsBICtestList <- matrix(ncol=2, nrow=LagsNumber)
    
    for (i in 1:LagsNumber){
      
      ModelForAICandBIC <- erer::ur.df2(TimeSeries, 
                                        type = type, 
                                        lags = i, 
                                        selectlags = 'Fixed')
      
      LagsAICtestList[i,1] <- i
      LagsAICtestList[i,2] <- ModelForAICandBIC$aic
      LagsBICtestList[i,1] <- i
      LagsBICtestList[i,2] <- ModelForAICandBIC$bic
    }
    
    LagsAICtestList <- data.frame(LagsAICtestList)
    LagsBICtestList <- data.frame(LagsBICtestList)
    names(LagsAICtestList) <- c('Lag_Number','AIC')
    names(LagsBICtestList) <- c('Lag_Number','BIC')

    plot1 <- ggplot(LagsAICtestList) + geom_line(aes(Lag_Number, AIC))+
                ggtitle('Lags Length AIC Test') +
                theme_minimal()
      
    plot2 <- ggplot(LagsBICtestList) + geom_line(aes(Lag_Number, BIC))+
                ggtitle('Lags Length BIC Test') +
                theme_minimal()
    
    gridExtra::grid.arrange(plot1, plot2, ncol=2)
  }
  
  FinalModel <- urca::ur.df(TimeSeries, 
                            type = type, 
                            lags = LagsNumber, 
                            selectlags = selectlags)
  
  print(urca::summary(FinalModel))
  invisible(FinalModel)
}

########################################################
########################################################

# ADFUnitRoot(TimeSeries, 
#   type = c('none','drift','trend'), 
#   selectlags = c("Fixed", "AIC", "BIC")
#   LagsNumber = 10)

# type: 'trent' - const and trend, 'drift' - constant, 'none' - no constant
# selectlags - method to select lags number
# LagsNumber - max lags if selectlags = 'AIC' or 'BIC' or lags number if 'Fixed' 

# Example:
# ADFUnitRoot(TimeSeries, 
#   type = 'drift', 
#   selectlags = "BIC",
#   LagsNumber = 20)
