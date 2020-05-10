listOfPackagesToInstall <- c('fUnitRoots','dynlm','TSstudio','xts')

InstallRequiredPackages <- function(x){
  if(!(x %in% installed.packages()[,"Package"])){
    install.packages(x)
  }
}
  
invisible(lapply(listOfPackagesToInstall, InstallRequiredPackages))

###############

CreateModel <- function(x, k = 0, 
                        int = TRUE, trend = FALSE, printModel = FALSE){
  # NB:  returns conventional lm summary so p-values for adf test are wrong!

  dx <- diff(x)
  formula <- paste("dx ~ L(x)")
  if(k > 0)
    formula <- paste0(formula," + L(dx,1:",k,")")
  if(trend){
    s <- time(x)
    t <- ts(s - s[1],start = s[1],freq = frequency(x))
    formula <- paste0(formula," + t")
  }
  if(!int) formula <- paste0(formula," - 1")
  
  if(printModel){print(formula)}
  
  dynlm::dynlm(as.formula(formula))
}

###############

ADFUnitRoot <- function(TimeSeries, 
                        type = 'ct', 
                        LagsNumber = 10,
                        selectlags = c("Fixed", "AIC", "BIC")){
  
  # Converts TimeSeries format to 'ts'
  if('data.frame' %in% class(TimeSeries) ){
    TimeSeriesInXTSformat <- xts::xts(TimeSeries[,2], 
                                     order.by=TimeSeries[,1])
    TimeSeriesInTSformat <- TSstudio::xts_to_ts(TimeSeriesInXTSformat)
  } else if('ts' %in% class(TimeSeries)){
      TimeSeriesInTSformat <- TimeSeries
  } else if('xts' %in% class(TimeSeries)){
    TimeSeriesInTSformat <- TSstudio::xts_to_ts(TimeSeries)
  }
    

  if(type == 'ct'){
    int = TRUE 
    trend = TRUE
  } else if(type == 'c'){
    int = TRUE
    trend = FALSE
  } else if(type == 'nc'){
    int = FALSE 
    trend = FALSE
  } 
  
  if(selectlags == 'AIC' | selectlags == 'BIC'){

      LagsTestlist <- c(NULL)

      for (i in 1:LagsNumber){
        Model <- CreateModel(TimeSeriesInTSformat, k = i, int, trend)
        
        if(selectlags == 'BIC'){
          LagsTestlist[i] <- BIC(Model)  
        } else if (selectlags == 'AIC'){
          LagsTestlist[i] <- AIC(Model)  
        }
      }
  
      plot(LagsTestlist,  main = "Lags Length Test",
            xlab = "Lag Number",
            ylab = selectlags)
  }
    
  FinallLagsNumber <- if (selectlags == 'Fixed') 
                        {LagsNumber}
                      else if(selectlags == 'BIC' | selectlags == 'AIC' )
                        {which.min(LagsTestlist)}
    
  FinalModel <- CreateModel(TimeSeriesInTSformat, 
                            k = FinallLagsNumber, int, trend, 
                            printModel = TRUE)
  
  print(summary(FinalModel)$coefficients)
  fUnitRoots::adfTest(TimeSeriesInTSformat, 
                      lags = FinallLagsNumber, 
                      type = type)

}

########################################################
########################################################

# ADFUnitRoot(TimeSeries, 
#   type = c('nc','c','ct'), 
#   selectlags = c("Fixed", "AIC", "BIC"),
#   LagsNumber = 10)

# type: 'ct' - const and trend, 'c' - constant, 'nc' - no constant
# LagsNumber - means max lags if selectlags = 'AIC' or 'BIC'  

# Example:
# ADFUnitRoot(TimeSeries, 
#   type = 'ct', 
#   selectlags = "BIC",
#   LagsNumber = 20)
