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


$ONTEXT
Se trata de resolver la siguiente ecuacion lineal sujeta a una serie de restricciones

Min F(x) = 3*x1 + 2*x2 + x3 + 2*x4 + 3*x5     (Func.Objetivo)

s.a:
         2*x1 + 5*x2 + x4 + x5 >= 6               (1)
         4*x2 - 2*x3 + 2*x4 + 3*x5 >=5            (2)
         x1 - 6*x2 + 3*x3 + 7*x4 + 5*x5 >= 7      (3)
         x1, x2, x3, x4, x5, no negativas

En este voy a emplear el uso de SETS y PARAMETROS

$OFFTEXT

SETS
*Los sets corresponden a las variables, que son:

j variables /j1*j5/
*Desde j1 a j5 uno por cada variable
i restricciones /i1*i3/;
*Desde i1 a 13 por la cantidad de restricciones

*Ahora se definen los par�metros:

PARAMETERS
*Podemos ingresar por par�metros los coeficientes de la funci�n objetivo

C(j) coeficientes de la funcion F /j1=3, j2=2, j3=1, j4=2, j5=3/
B(i) valores de las restricciones /i1=6, i2=5, i3=7/;

TABLE A(i,j) matriz
*i hace referencia a las filas y j a las columnas, lo escribimos igual a las restricciones en matriz

         j1      j2      j3      j4      j5
     i1  2       5       0       1       1
     i2  0       4       -2      2       3
     i3  1      -6       3       7       5 ;

VARIABLES

F valor objetivo que queremos sea m�nimo;

POSITIVE VARIABLES

x(j) variables del problema   ;

EQUATIONS

funobj funcion objetivo
restricciones son las restricciones del problema ;

funobj.. F =E= sum(j, C(j)*x(j));
*Sumatoria en j(variables), coef de fun por variables del prob
restricciones(i).. sum(j, A(i,j)*x(j)) =G= B(i);

MODEL proglineal /all/;

SOLVE proglineal using LP minimazing F;









