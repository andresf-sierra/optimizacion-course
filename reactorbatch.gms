$Ontext
Optimal control of a batch reactor.
Find the optimal temperature profile which gives maximum intermediate product
concentration in a batch reactor with two consecutive reactions. The first
reaction is of second order and the second one is of first order with known
rate constants.

Renfro J.G., Morshedi, A.M., Osbjornsen, O.A., Simultaneous optimization and
solution of systems described by differential/algebraic equations. Computer
and Chemical Engineering, vol.11, 1987, pp.503-517.
$Offtext

$if     set n  $set nh %n%
$if not set nh $set nh 100

set nh Number of subintervals / 0*%nh% /;
alias (nh,k);

Scalar    tf   final time            / 100/
          ca_0 initial value for ca  / 1.0/
          cb_0 initial value for cb  / 0.0/
          h  ;
          h=tf/%nh% ;

Variables ca(nh)  concentration of component A
          cb(nh)  concentration of component B
          t(nh)   temperature of reactor (control variable)
          k1(nh)  rate constant for the first reaction
          k2(nh)  rate constant for the second reaction
          obj     criterion ;

Equations eobj        criterion definition
          state1(nh)  state equation 1
          state2(nh)  state equation 2
          ek1(nh)
          ek2(nh) ;

eobj..
 obj =e= cb['%nh%'] ;

 ek1(nh(k)).. k1(k) =e= 4000*exp(-2500/t(k));
 ek2(nh(k)).. k2(k) =e= 620000*exp(-5000/t(k));

state1(nh(k+1))..
 ca[k+1] =e= ca(k)+
             (h/2)*(-k1(k)*ca(k)*ca(k) - k1(k+1)*ca(k+1)*ca(k+1) ) ;

state2(nh(k+1))..
 cb[k+1] =e= cb(k)+
             (h/2)*( k1(k)*ca(k)*ca(k) - k2(k)*cb(k) +
                     k1(k+1)*ca(k+1)*ca(k+1) - k2(k+1)*cb(k+1) );

*Initial point
ca.l[nh] = 1.0;
cb.l[nh] = 0.0;

ca.fx ['0'] = ca_0;
cb.fx ['0'] = cb_0;

*Bounds
t.lo(nh) = 110;
t.up(nh) = 280;

Model batchReactor /all/;

$iftheni x%mode%==xbook
$onecho >bench.opt
  solvers conopt knitro minos snopt
$offecho
batchReactor.optfile=1;
option nlp=bench
$endif

Solve batchReactor maximizing obj using nlp;

$iftheni x%mode%==xbook
file stat1 /batch1.dat/;
file stat2 /batch2.dat/;
file stat3 /batch3.dat/;

put stat1;
loop(nh, put ca.l(nh):10:5,',', put/)

put stat2;
loop(nh, put cb.l(nh):10:5,',', put/)

put stat3;
loop(nh, put t.l(nh):10:5,',', put/)
$endif


* End of batchReactor