install.packages('fUnitRoots')
install.packages('dynlm')
install.packages('TSstudio')
library(dynlm)


CreateModel <- function(x, k = 0, int = TRUE, trend = FALSE, printModel = FALSE){
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
  dynlm(as.formula(formula))
}

########################################################

ADFUnitRoot <- function(x, 
                        MaxLag = 10, 
                        type = "ct", 
                        plotBIC = TRUE){
  
  TimeSeriesInTSformat <- as.ts(x)
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
  
  BIClist <- c(NULL)

  for (i in 1:MaxLag){
    Model <- CreateModel(TimeSeriesInTSformat, k = i, int, trend)
    BIClist[i] <- BIC(Model)  
  }
  
  if(plotBIC){plot(BIClist)}
  
  FinalModel <- CreateModel(TimeSeriesInTSformat, 
                            k = which.min(BIClist), int, trend, 
                            printModel = TRUE)
  
  # Print information about fitted model and make Unit Root test
  print(summary(FinalModel)$coefficients)
  fUnitRoots::adfTest(TimeSeriesInTSformat, lags = which.min(BIClist), type = type)
  
}

########################################################

TmieSeries <- TSstudio::xts_to_ts(TmieSeries )
plot(TmieSeries)

ADFUnitRoot(TmieSeries, 
            MaxLag = 20, 
            type = "ct", 
            plotBIC = TRUE)
# type: 'ct' - const and trend, 'c' - constant, 'nc' - no constant



