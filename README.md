# Unit-Root-Test---ADF

   ADF Unit Root test, based on **urca::ur.df**

   Deciding  which  case of test  to  use (none, drift, trend)  involves  a  combination  of  theory  and  visual  inspection  of  the  data (https://www.stata.com/manuals13/tsdfuller.pdf).
   However, when some trend appear in data, it can be drift of trend, sometimes difficult to distinguish.
   Therefore a statistical test to check significance of some coefficient can be made.
   When the null hypothesis holds the t coefficient doesn’t follow a normal distribution, so we can’t use the usual t test (ftp://ftp.repec.org/opt/ReDIF/RePEc/ers/papers/02_34_p3.pdf, https://www.real-statistics.com/time-series-analysis/stochastic-processes/dickey-fuller-test/).

   Function urca::ur.df has special test to check significance of constant and trend coefficients:  
   https://stats.stackexchange.com/questions/24072/interpreting-rs-ur-df-dickey-fuller-unit-root-test-results

 * ## "none":&nbsp; &nbsp;   <a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;y_t&space;=&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;e_t" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;y_t&space;=&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;e_t" title="\Delta y_t = \gamma \cdot y_{t-1} + e_t" /></a>

     The hypothesis is:

     * tau1:&nbsp;&nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=\gamma&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\gamma&space;=&space;0"  title="\gamma = 0" /></a>

       ![Left Tailed Test](https://github.com/kamilbanas85/Unit-Root-Test---ADF/blob/master/Critical_Values.jpg)

       For Left Tailed Test:&nbsp; &nbsp;  <a href="https://www.codecogs.com/eqnedit.php?latex=Cr_{1%}&space;<&space;Cr_{5%}&space;<&space;Cr_{10%}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Cr_{1%}&space;<&space;Cr_{5%}&space;<&space;Cr_{10%}" title="Cr_{1%} < Cr_{5%} < Cr_{10%}" /></a>

       Therefore value of test statistic sholud be grater then critical value to support null hypothesis:

       <a href="https://www.codecogs.com/eqnedit.php?latex=Cr&space;\&space;<&space;\&space;\textrm{Test&space;Statistic&space;Value}&space;\qquad&space;\Rightarrow&space;\qquad&space;\textrm{Null&space;Hypothesis&space;is&space;True&space;(The&space;presence&space;of&space;Unit&space;Root)}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Cr&space;\&space;<&space;\&space;\textrm{Test&space;Statistic&space;Value}&space;\qquad&space;\Rightarrow&space;\qquad&space;\textrm{Null&space;Hypothesis&space;is&space;True&space;(The&space;presence&space;of&space;Unit&space;Root)}" title="Cr \ < \ \textrm{Test Statistic Value} \qquad \Rightarrow \qquad \textrm{Null Hypothesis is True (The presence of Unit Root)}" /></a>
       
       **In general:  |critical_value| < |Test_statistic_val| =>  null rejected**


 * ## "drift":&nbsp;&nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;e_t" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;e_t" title="\Delta y_t = a_0 + \gamma \cdot y_{t-1} + e_t" /></a>

     The Hypotheses:
     * tau2:&nbsp;&nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=\gamma&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\gamma&space;=&space;0" title="\gamma = 0" /></a>

     * phi1:&nbsp;&nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=\gamma&space;=&space;a_2&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\gamma&space;=&space;a_2&space;=&space;0" title="\gamma = a_2 = 0" /></a>

       phi1 is right tailed test, so: &nbsp; &nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=Cr_{10%}&space;<&space;Cr_{5%}&space;<&space;Cr_{1%}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Cr_{10%}&space;<&space;Cr_{5%}&space;<&space;Cr_{1%}" title="Cr_{10%} < Cr_{5%} < Cr_{1%}" /></a>

       Therefore value of test statistic should be less then critical value to support null hypothesis:

       <a href="https://www.codecogs.com/eqnedit.php?latex=\textrm{Test&space;Statistic&space;Value}&space;\&space;<&space;\&space;Cr&space;\quad&space;\Rightarrow&space;\quad&space;\textrm{Null&space;Hypothesis&space;is&space;True}\&space;(\gamma&space;=&space;a_2&space;=&space;0\&space;)" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\textrm{Test&space;Statistic&space;Value}&space;\&space;<&space;\&space;Cr&space;\quad&space;\Rightarrow&space;\quad&space;\textrm{Null&space;Hypothesis&space;is&space;True}\&space;(\gamma&space;=&space;a_2&space;=&space;0\&space;)" title="\textrm{Test Statistic Value} \ < \ Cr \quad \Rightarrow \quad \textrm{Null Hypothesis is True}\ (\gamma = a_2 = 0\ )" /></a>

       When the phi1 test support Null Hypothesis, then it is unit root and drift coefficient is insignificant, so formulation is inappropriate. If Null Hypothesis is rejected, than  one of coefficient or both are non zero.

 * ## "trend":&nbsp;&nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;a_2&space;t&space;&plus;&space;e_t" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\Delta&space;y_t&space;=&space;a_0&space;&plus;&space;\gamma&space;\cdot&space;y_{t-1}&space;&plus;&space;a_2&space;t&space;&plus;&space;e_t" title="\Delta y_t = a_0 + \gamma \cdot y_{t-1} + a_2 t + e_t" /></a>


      The Hypotheses:
      * tau:&nbsp;&nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=\gamma&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\gamma&space;=&space;0" title="\gamma = 0" /></a>

      * phi3:&nbsp;&nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=\gamma&space;=&space;a_2&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?\gamma&space;=&space;a_2&space;=&space;0" title="\gamma = a_2 = 0" /></a>

      * phi2:&nbsp;&nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=a_0&space;=&space;\gamma&space;=&space;a_2&space;=&space;0" target="_blank"><img src="https://latex.codecogs.com/gif.latex?a_0&space;=&space;\gamma&space;=&space;a_2&space;=&space;0" title="a_0 = \gamma = a_2 = 0" /></a>
 
        phi2 is also right tailed, so: &nbsp; &nbsp; <a href="https://www.codecogs.com/eqnedit.php?latex=Cr_{10%}&space;<&space;Cr_{5%}&space;<&space;Cr_{1%}" target="_blank"><img src="https://latex.codecogs.com/gif.latex?Cr_{10%}&space;<&space;Cr_{5%}&space;<&space;Cr_{1%}" title="Cr_{10%} < Cr_{5%} < Cr_{1%}" /></a>




   **Number of Lags is chosen based on** (https://www.econometrics-with-r.org/14-6-llsuic.html):
      * BIC or AIC.
      * Test the significance of the largest lag.


