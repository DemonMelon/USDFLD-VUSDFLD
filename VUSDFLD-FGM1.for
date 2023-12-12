      subroutine vusdfld(
c Read only variables -
     1   nblock, nstatev, nfieldv, nprops, ndir, nshr, 
     2   jElem, kIntPt, kLayer, kSecPt, 
     3   stepTime, totalTime, dt, cmname, 
     4   coordMp, direct, T, charLength, props, 
     5   stateOld, 
c Write only variables -
     6   stateNew, field )
c
          include 'vaba_param.inc'
c
      dimension jElem(nblock), coordMp(nblock,*), 
     1          direct(nblock,3,3), T(nblock,3,3), 
     2          charLength(nblock), props(nprops), 
     3          stateOld(nblock,nstatev), 
     4          stateNew(nblock,nstatev),
     5          field(nblock,nfieldv)
      character*80 cmname
c
c     Local arrays from vgetvrm are dimensioned to 
c     maximum block size (maxblk)
c
      parameter( nrData=6 )
      character*3 cData(maxblk*nrData)
      dimension rData(maxblk*nrData), jData(maxblk*nrData)
c
      DO K = 1, nblock
C       CENTER OF COORDINATE SYSTEM
      X0=0.0
      Y0=0.0
      Z0=0.0
C      READ X,Y,Z COORDINATES OF THE NODE
      
      X=coordMp(nblock,1)
      Y=coordMp(nblock,2)
      Z=coordMp(nblock,3)
C      CALCULATE YOUNG`S MODULUS IN CYLINDRICAL COORDINATES     
      stateNew(K,1) = STATEOLD(K,1)
      stateNew(K,2) = STATEOLD(K,2)
      R=STATEOLD(K,1)
      E=STATEOLD(K,2)
      R=SQRT((Z-Z0)**2+(Y-Y0)**2)
      E= -4112*R**3 + 1.727e+05*R**2 - 2.397e+06*R + 1.101e+07
C     
      
      FIELD(K,1)=R
      FIELD(K,2)=E
C      SAVE THE NEW STATE VARIABLES
      stateNew(K,1)=FIELD(K,1)
      STATENEW(K,2)=FIELD(K,2)
      ENDDO
      
C------------------ END OF USER CODE  ---------------------------------   
          
      
c
      RETURN
      END
          
