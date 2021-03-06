OPTIONS
         LP=CPLEX;

VARIABLES xA, xB, xC, xD, Z;

POSITIVE VARIABLES  xA, xB, xC, xD;

EQUATIONS obj, restr1, restr2, restr3;
obj.. Z =E= 4*xA + 9*xB + 2*xC - xD;

restr1.. 3.1*xB =E= xC + xD;

restr2.. 2.6*xA + 4.7*xB =L= 60;

restr3.. 3.3*xA + 4.6*xB =L= 65;

xC.UP = 12;

MODEL ejemplo1 /ALL/;

SOLVE ejemplo1 using LP maximizing Z;
