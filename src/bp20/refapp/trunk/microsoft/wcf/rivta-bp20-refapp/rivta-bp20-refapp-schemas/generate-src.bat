@REM --------------------------------------------------------------------------
@REM 
@REM Generates WCF Proxy and config code for RIV13606 EhrExtraction Interaction
@REM 
@REM --------------------------------------------------------------------------
@REM 
@REM Problem with adressing the wsdl locally. Workaround in place is to use the Java - Apache CXF Web Service to provide the wsdl.
@REM 
@REM The command should look like:
@REM 	svcutil.exe /language:cs /out:EhrExtractionResponderProxy.cs /config:app.config business\JournalinfoApoteketRIV\EhrExtractionInteraction.wsdl business\JournalinfoApoteketRIV\*.xsd  technical\wsaddressing\ws-addressing-1.0.xsd
@REM 
@REM But gives us errormessages like
@REM 	Validation Error: Type 'urn:riv13606:v1:II' is not declared.
@REM 
@REM --------------------------------------------------------------------------
@REM svcutil.exe /language:cs /out:generated-src\EhrExtractionResponderProxy.cs /config:generated-src\app.config business\JournalinfoApoteketRIV\EhrExtractionInteraction.wsdl business\JournalinfoApoteketRIV\*.xsd  technical\wsaddressing\ws-addressing-1.0.xsd
svcutil.exe /language:cs /out:generated-src\EhrExtractionResponderProxy.cs /config:generated-src\app.config /namespace:urn:riv:ehr:ehrexchange:EhrExtraction:1:rivtabp20,rivta_bp20_refapp_schemas.wsdl /namespace:urn:riv:ehr:ehrexchange:EhrExtraction:1,rivta_bp20_refapp_schemas.xsd http://172.16.64.1:10000/rivtabp20/refapp/riv13606RequestEHRExtract?wsdl technical\wsaddressing\ws-addressing-1.0.xsd