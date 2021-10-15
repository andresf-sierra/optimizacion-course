** La empresa ZUMOTECse dedica a la obtención de zumos de frutas exóticas.
** En el proceso de transformación se utiliza zumo puro, agua y otros
** aditivos que diferencian sus zumos respecto a los de la competencia.
** El zumo puro se obtiene exprimiendo las frutas y desechando las pieles y
** otros residuos sólidos. ZUMOTEC tiene tres clases de zumo: A, B y C, que
** se diferencian en la cantidad de zumo puro, agua y aditivos



VARIABLES
ZUMOA,ZUMOB,ZUMOC,B;


POSITIVE VARIABLES ZUMOA,ZUMOB,ZUMOC;
ZUMOA.L = 30; ZUMOB.L = 30; ZUMOC.L = 30;

EQUATIONS
OBJ, R1, R2, R3, R4;
OBJ..    B =E= (2*ZUMOA)^2 + ZUMOB^2 + (2*ZUMOC)^2 - 10*ZUMOA - 2*ZUMOB -3*ZUMOC;


R1..      (2/4)*ZUMOA + (5/9)*ZUMOB    + (3/6)*ZUMOC =L= (20000*7/10);
R2..            ZUMOA  - 0.4*(ZUMOA+ZUMOB     +ZUMOC)=L=0;
R3..                          ZUMOB - 0.4*(ZUMOA+ZUMOB+ZUMOC)=L=0;
R4..                                           ZUMOC - 0.4*(ZUMOA+ZUMOB+ZUMOC)=L=0;


MODEL ZUMOTEC /ALL/;
SOLVE ZUMOTEC USING NLP MAXIMIZING B;

**DISPLAY R1.M;
