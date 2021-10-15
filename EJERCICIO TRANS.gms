*problema de trasnporte

option limrow = 100 ;
sets
     I      ORIGENES      /CUC , BOY /
     J      DESTINOS      /BOG, BUG, PAM /;
     
parameters
   A(I)  CANTIDAD DISPONIBLE
   /CUC 350
   BOY  600/
   B(J)   DEMANDA EN DESTINO
   /BOG   325
    BUG   300
    PAM   275 /;
    
TABLE D(I,J)   DISTANCIA EN KILOMETROS

      BOG     BUG     PAM
 CUC  538     1046    439
 BOY  393     693     673
 

SCALAR F    COSTE POR KILOMETRO /5/ ;

PARAMETER    C(I,J) COSTE DE TRANSPORTE ;
         C(I,J) = F*D(I,J) ;
         
VARIABLES
X(I,J)
Z;
POSITIVE VARIABLES X;

EQUATIONS
OBJ
OFERTA (I)
DEMANDA (J); 

OBJ .. Z =E= SUM((I,J), C(I,J) * X (I,J) ) ;
OFERTA ( I ) .. SUM (J , X ( I,J) ) =L= A (I) ;
DEMANDA (J) .. SUM (I, X (I,J)) =G= B (J) ;

MODEL TRANS1 /ALL/

SOLVE TRANS1 USING LP MINIMIZING Z ;
DISPLAY x.L , z.L ;
