# Unit-Root-Test---ADF

ADF Unit Root test from urca library: ur.df

Deciding  which  case of test  to  use (none, drift, trend)  involves  a  combination  of  theory  and  visual  inspection  of  the  data (https://www.stata.com/manuals13/tsdfuller.pdf).
Hoevever, when some trend appear in data, it can be drift of trend, somethimes difficult to distingush. 
Therefore a statistical test to check significance of some coefficient can be made.
However, when the null hypothesis holds the t coefficient doesn’t follow a normal distribution and so we can’t use the usual t test (ftp://ftp.repec.org/opt/ReDIF/RePEc/ers/papers/02_34_p3.pdf, https://www.real-statistics.com/time-series-analysis/stochastic-processes/dickey-fuller-test/). 
Function urca::ur.df has special test to check significance of  




Fitted model summary based on: http://www.econ.uiuc.edu/~econ536/eTA/R8.html

With aim to follow general procedure of Unit Root evaluation from:
https://shishirshakya.blogspot.com/search?q=unit+root

Number of Lags is chosen based on BIC:
https://www.econometrics-with-r.org/14-6-llsuic.html

