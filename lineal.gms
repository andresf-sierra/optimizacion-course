$OFFSYMXREF
$OFFSYMLIST

option limrow=0;
option limcol=0;
option solprint=on;
option sysout=off;

option LP=CPLEX;
option MIP=CPLEX;
option NLP=CONOPT;
option MINLP=DICOPT;
option OPTCR=0;

$TITLE PRUEBA

$ONTEXT
Se trata de resolver la siguiente ecuaci?n lineal sujeta a una serie de restricciones

Min F(x) = 3*x1 + 2*x2 + x3 + 2*x4 + 3*x5

s.a:
         2*x1 + 5*x2 + x4 + x5 >= 6
         4*x2 - 2*x3 + 2*x4 + 3*x5 >=5
         x1 - 6*x2 + 3*x3 + 7*x4 + 5*x5 >= 7
         x1, x2, x3, x4, x5, no negativas


$OFFTEXT

VARIABLES
x1, x2, x3, x4, x5, F;

POSITIVE VARIABLES

x1, x2, x3, x4, x5;

EQUATIONS

funobj, eq1, eq2, eq3 ;

funobj.. F =E= 3*x1 + 2*x2 + x3 + 2*x4 +3*x5;
eq1.. 2*x1 + 5*x2 + x4 + x5 =G= 6;
eq2.. 4*x2 - 2*x3 + 2*x4 + 3*x5 =G= 5;
eq3.. x1 - 6*x2 + 3*x3 + 7*x4 + 5*x5 =G= 7;

MODEL problema1 /funobj, eq1, eq2, eq3/;


SOLVE problema1 using LP minimazing F ;
