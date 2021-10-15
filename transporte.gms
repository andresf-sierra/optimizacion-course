SETS
i PLANTAS /CUC, BOY/
j DESTINOS /BUC, BOG, PAM/;

PARAMETERS

a(i) CAPACIDAD DE ALMACENAMIENTO
/CUC 350
 BOY 600/
b(j) DEMANDA
/BUC 275
 BOG 325
 PAM 300/;

TABLE d(i,j) distancia en km
         BUC BOG  PAM
     CUC 538 1046 439
     BOY 393 693  673 ;

SCALAR F costo unitario por km /5/

PARAMETER c(i,j) cost unitario de transporte;
c(i,j)=f*d(i,j);

VARIABLES
x(i,j)
z;

POSITIVE VARIABLES x;

EQUATIONS

obj
capacidad(i)
demanda(j);

obj.. z =E= sum((i,j),c(i,j)*x(i,j));
capacidad(i).. sum(j,x(i,j))=L= a(i);
demanda(j).. sum(i, x(i,j))=G= b(j);

MODEL transporte /ALL/;

SOLVE transporte USING LP MINIMIZING z;
