# Unit-Root-Test---ADF

ADF Unit Root test, based on **urca::ur.df**

Deciding  which  case of test  to  use (none, drift, trend)  involves  a  combination  of  theory  and  visual  inspection  of  the  data (https://www.stata.com/manuals13/tsdfuller.pdf).
However, when some trend appear in data, it can be drift of trend, sometimes difficult to distinguish.
Therefore a statistical test to check significance of some coefficient can be made.
When the null hypothesis holds the t coefficient doesn’t follow a normal distribution, so we can’t use the usual t test (ftp://ftp.repec.org/opt/ReDIF/RePEc/ers/papers/02_34_p3.pdf, https://www.real-statistics.com/time-series-analysis/stochastic-processes/dickey-fuller-test/).

Function urca::ur.df has special test to check significance of constant and trend coefficients:  

"trend": 

<a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;a_2&space;t&space;&plus;&space;e_t" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;a_2&space;t&space;&plus;&space;e_t" title="\Delta y_t = a_0 + \gamma \cdot y_{t-1} + a_2 t + e_t" /></a>


(where a2t
is a time trend term) The hypotheses (from Enders p. 208) are as follows:
tau: γ=0
phi3: γ=a2=0
phi2: a0=γ=a2=0






Fitted model summary based on: http://www.econ.uiuc.edu/~econ536/eTA/R8.html

With aim to follow general procedure of Unit Root evaluation from:
https://shishirshakya.blogspot.com/search?q=unit+root

Number of Lags is chosen based on BIC:
https://www.econometrics-with-r.org/14-6-llsuic.html

