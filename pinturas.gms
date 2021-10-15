SETS i unidades /u1, u2, u3/
     j periodos /m, t/

PARAMETERS costear(i) coste de para arrancar una unidad
                 /u1=2800, u2=2000, u3=1900/
           costekg(i) coste por Kg por periodo /u1=5, u2=3, u3=8/
           capacidad(i) capacidad /u1=19000, u2=1700, u3=2900/
           demanda(j) demanda por periodo /m=2500, t=3500/;

VARIABLES  y(i,j) si funciona o no la unidad i en el periodo j
           z(i) arranca la unidad i dicho día
           coste coste total de la producción del día

BINARY VARIABLES y,z;

EQUATIONS produccion(j) producción en cada periodo
          restriccion(i,j) limites en z
          costetotal calculo del coste;

         produccion(j).. sum(i,y(i,j)*capacidad(i))=G= demanda(j);
         restriccion(i,j).. z(i)=G=y(i,j);
         costetotal.. coste=E=sum(i,costear(i)*z(i)+costeKg(i)*capacidad(i)*sum(j,y(i,j)));

MODEL pinturas produccion /all/;

SOLVE pinturas minimizing coste using mip;