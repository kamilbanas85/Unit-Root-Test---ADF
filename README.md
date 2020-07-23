# Unit-Root-Test---ADF

ADF Unit Root test, based on **urca::ur.df**

Deciding  which  case of test  to  use (none, drift, trend)  involves  a  combination  of  theory  and  visual  inspection  of  the  data (https://www.stata.com/manuals13/tsdfuller.pdf).
However, when some trend appear in data, it can be drift of trend, sometimes difficult to distinguish.
Therefore a statistical test to check significance of some coefficient can be made.
When the null hypothesis holds the t coefficient doesn’t follow a normal distribution, so we can’t use the usual t test (ftp://ftp.repec.org/opt/ReDIF/RePEc/ers/papers/02_34_p3.pdf, https://www.real-statistics.com/time-series-analysis/stochastic-processes/dickey-fuller-test/).

Function urca::ur.df has special test to check significance of constant and trend coefficients:  
https://stats.stackexchange.com/questions/24072/interpreting-rs-ur-df-dickey-fuller-unit-root-test-results


"none"

<a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;y_t&space;=&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;e_t" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;y_t&space;=&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;e_t" title="\Delta y_t = \gamma \cdot y_{t-1} + e_t" /></a>

The hypothesis is:

tau1: <a href="https://www.codecogs.com/eqnedit.php?latex=\gamma&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\gamma&space;=&space;0" title="\gamma = 0" /></a>


"trend": 

<a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;a_2&space;t&space;&plus;&space;e_t" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;a_2&space;t&space;&plus;&space;e_t" title="\Delta y_t = a_0 + \gamma \cdot y_{t-1} + a_2 t + e_t" /></a>


(where a2t
is a time trend term) The hypotheses (from Enders p. 208) are as follows:

tau: <a href="https://www.codecogs.com/eqnedit.php?latex=\gamma&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\gamma&space;=&space;0" title="\gamma = 0" /></a>

phi3: <a href="https://www.codecogs.com/eqnedit.php?latex=\gamma&space;=&space;a_2&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\gamma&space;=&space;a_2&space;=&space;0" title="\gamma = a_2 = 0" /></a>

phi2: <a href="https://www.codecogs.com/eqnedit.php?latex=a_0&space;=&space;\gamma&space;=&space;a_2&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?a_0&space;=&space;\gamma&space;=&space;a_2&space;=&space;0" title="a_0 = \gamma = a_2 = 0" /></a>


"drift" 

<a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;e_t" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;e_t" title="\Delta y_t = a_0 + \gamma \cdot y_{t-1} + e_t" /></a>







Fitted model summary based on: http://www.econ.uiuc.edu/~econ536/eTA/R8.html

With aim to follow general procedure of Unit Root evaluation from:
https://shishirshakya.blogspot.com/search?q=unit+root

Number of Lags is chosen based on BIC:
https://www.econometrics-with-r.org/14-6-llsuic.html

