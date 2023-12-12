      SUBROUTINE USDFLD(FIELD,STATEV,PNEWDT,DIRECT,T,CELENT,
     1 TIME,DTIME,CMNAME,ORNAME,NFIELD,NSTATV,NOEL,NPT,LAYER,
     2 KSPT,KSTEP,KINC,NDI,NSHR,COORD,JMAC,JMATYP,MATLAYO,LACCFLA)
C
      INCLUDE 'ABA_PARAM.INC'
C
      CHARACTER*80 CMNAME,ORNAME
      CHARACTER*3  FLGRAY(15)
      DIMENSION FIELD(NFIELD),STATEV(NSTATV),DIRECT(3,3),
     1 T(3,3),TIME(2)
      DIMENSION ARRAY(15),JARRAY(15),JMAC(*),JMATYP(*),COORD(*)

C-----------------------------------------------------------------------
C      user coding to define FIELD and, if necessary, STATEV and PNEWDT
C-----------------------------------------------------------------------
C       CENTER OF COORDINATE SYSTEM
      X0=0.0
      Y0=0.0
      Z0=0.0
C      READ X,Y,Z COORDINATES OF THE NODE
      X=COORD(1)
      Y=COORD(2)
      Z=COORD(3)
C      CALCULATE YOUNG`S MODULUS IN CYLINDRICAL COORDINATES        
      E=SQRT((Z-Z0)**2+(Y-Y0)**2)
C      DEFINE DEPENDENT VARIABLE E(X,Y)
      FIELD(1)=E      
C      SAVE E IN STATEV(1)
      STATEV(1)= -4112*E**3 + 1.727e+05*E**2 - 2.397e+06*E + 1.101e+07

C------------------ END OF USER CODE  ---------------------------------      
      RETURN
      END