$TITLE PROBLEMA DE LA PLANIFICACIÓN DE LA PRODUCCIÓN

SET

T indice de los meses /0*4/;

PARAMETER

Y(T) demanda en el mes T


    /1 2
     2 3  
     3 6
     4 1/

A(T)
B(T)
C(T);

A(T)=1; B(T)=1; C(T)=1;
    
VARIABLES

Z valor de la función objetivo
x(T) numero de unidades producidas en el mes T
s(T) numero de unidades almacenadas en el mes T;

POSITIVE VARIABLES x(T), s(T);

s.fx('0')=2;

EQUATIONS

COST funcion objetivo
INOUT(T) balance de entradas y salidas;

COST.. Z=E= SUM(T$(ORD(T) gt 1), A(T)*Y(T)-B(T)*x(T)-C(T)*s(T));
INOUT(T)$(ord(T) gt 1)..s(T)=E= s(T-1)+x(T)-Y(T);

MODEL planificacion /ALL/;

SOLVE planificacion USUING LP MAXIMIZING Z;

     
     
