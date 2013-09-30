
	@REM ---------------------------------------------------------------------------------
	@REM Generates c# WCF service contracts (interface), client proxies and wcf config
	@REM file for the WSDLs + XML Schemas of the service domain, using .Net WCF tool svcuti.exe
	@REM ---------------------------------------------------------------------------------
	@REM Licensed to the Apache Software Foundation (ASF) under one
	@REM or more contributor license agreements. See the NOTICE file
	@REM distributed with this work for additional information
	@REM regarding copyright ownership. Inera AB licenses this file
	@REM to you under the Apache License, Version 2.0 (the
	@REM "License"); you may not use this file except in compliance
	@REM with the License. You may obtain a copy of the License at
	@REM
	@REM http://www.apache.org/licenses/LICENSE-2.0
	@REM Unless required by applicable law or agreed to in writing,
	@REM software distributed under the License is distributed on an
	@REM "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
	@REM KIND, either express or implied. See the License for the
	@REM specific language governing permissions and limitations
	@REM under the License.
	@REM ---------------------------------------------------------------------------------
	CD ..
	
	SET SCHEMADIR=schemas
	
	SET W0=%SCHEMADIR%\interactions\AvregistreraEpsosSamtyckeInteraction\AvregistreraEpsosSamtyckeInteraction_4.0_rivtabp21.wsdl
SET X0=%SCHEMADIR%\interactions\AvregistreraEpsosSamtyckeInteraction\*.xsd

SET W1=%SCHEMADIR%\interactions\HamtaEpsosSamtyckeInteraction\HamtaEpsosSamtyckeInteraction_4.0_rivtabp21.wsdl
SET X1=%SCHEMADIR%\interactions\HamtaEpsosSamtyckeInteraction\*.xsd

SET W2=%SCHEMADIR%\interactions\HamtaIckeAktuellaOrdinationerInteraction\HamtaIckeAktuellaOrdinationerInteraction_4.0_rivtabp21.wsdl
SET X2=%SCHEMADIR%\interactions\HamtaIckeAktuellaOrdinationerInteraction\*.xsd

SET W3=%SCHEMADIR%\interactions\HamtaOrdinationerPrivatpersonInteraction\HamtaOrdinationerPrivatpersonInteraction_4.0_rivtabp21.wsdl
SET X3=%SCHEMADIR%\interactions\HamtaOrdinationerPrivatpersonInteraction\*.xsd

SET W4=%SCHEMADIR%\interactions\KorrigeraOrdinationVardInteraction\KorrigeraOrdinationVardInteraction_4.0_rivtabp21.wsdl
SET X4=%SCHEMADIR%\interactions\KorrigeraOrdinationVardInteraction\*.xsd

SET W5=%SCHEMADIR%\interactions\RegistreraEpsosSamtyckeInteraction\RegistreraEpsosSamtyckeInteraction_4.0_rivtabp21.wsdl
SET X5=%SCHEMADIR%\interactions\RegistreraEpsosSamtyckeInteraction\*.xsd

SET W6=%SCHEMADIR%\interactions\SkapaOrdinationVardInteraction\SkapaOrdinationVardInteraction_4.0_rivtabp21.wsdl
SET X6=%SCHEMADIR%\interactions\SkapaOrdinationVardInteraction\*.xsd

SET XCORE=%SCHEMADIR%\core_components\*.xsd

SET SCHEMAS=%XCORE% %W0% %X0% %W1% %X1% %W2% %X2% %W3% %X3% %W4% %X4% %W5% %X5% %W6% %X6% 

SET OUTFILE=/out:wcf\generated-src\Se.apotekensserviceOrInteractions.cs
SET APPCONFIG=/config:wcf\generated-src\app.config
SET NAMESPACE=/namespace:*,Riv.Se.apotekensservice.Or.Schemas.v4
SET SVCUTIL="svcutil.exe"
%SVCUTIL% /language:cs %OUTFILE% %APPCONFIG% %NAMESPACE% %SCHEMAS%

CD wcf
ECHO Generating Service contract .Net Binding interfaces and classes for se.apotekensservice:or Release 4
ECHO I DotNetprojektet ska du ta lagga till referens till System.ServiceModel
