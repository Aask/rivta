@REM --------------------------------------------------------------------------
@REM 
@REM Generates Java Proxy classes with Axis2 1.4.1 and JDK 1.5.
@REM 
@REM --------------------------------------------------------------------------
set AXIS2_HOME=C:\Program\Java\axis2-1.4.1
set JAVA_HOME=C:\Program\Java\jdk1.5.0_19
set Path=C:\Program\Java\jdk1.5.0_19\bin;C:\Program\Java\axis2-1.4.1\bin;%Path%
set AXIS2_CLASS_PATH =""
setlocal EnableDelayedExpansion
set AXIS2_CLASS_PATH=%AXIS2_HOME%
FOR %%c in ("%AXIS2_HOME%\lib\*.jar") DO set AXIS2_CLASS_PATH=!AXIS2_CLASS_PATH!;%%c

@REM ======================================================================

CALL wsdl2java -g -uri ..\tjanstekontrakt\CreateListningInteraction.wsdl
CALL wsdl2java -g -uri ..\tjanstekontrakt\GetAvailableFacilitiesInteraction.wsdl
CALL wsdl2java -g -uri ..\tjanstekontrakt\GetListningInteraction.wsdl
CALL wsdl2java -g -uri ..\tjanstekontrakt\GetListningTypesInteraction.wsdl
CALL wsdl2java -g -uri ..\tjanstekontrakt\GetPersonQueueStatusInteraction.wsdl

CALL javac -cp .;%AXIS2_CLASS_PATH%  src\rivtabp20\_1\createlisting\carelisting\crm\riv\*.java
CALL javac -cp .;%AXIS2_CLASS_PATH%  src\rivtabp20\_1\getavailablefacilities\carelisting\crm\riv\*.java
CALL javac -cp .;%AXIS2_CLASS_PATH%  src\rivtabp20\_1\getlisting\carelisting\crm\riv\*.java
CALL javac -cp .;%AXIS2_CLASS_PATH%  src\rivtabp20\_1\getlistingtypes\carelisting\crm\riv\*.java
CALL javac -cp .;%AXIS2_CLASS_PATH%  src\rivtabp20\_1\getpersonqueuestatus\carelisting\crm\riv\*.java


cd  src
jar -cf ..\..\lib\axis1.4.1_With_jdk5_0_19_listingservice.jar rivtabp20\_1\createlisting\carelisting\crm\riv rivtabp20\_1\getavailablefacilities\carelisting\crm\riv rivtabp20\_1\getlisting\carelisting\crm\riv rivtabp20\_1\getlistingtypes\carelisting\crm\riv rivtabp20\_1\getpersonqueuestatus\carelisting\crm\riv 
cd ..
rem rmdir /S /Q src