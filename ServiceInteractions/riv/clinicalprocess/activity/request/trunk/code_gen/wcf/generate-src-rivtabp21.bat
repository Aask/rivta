
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
	
	SET W0=%SCHEMADIR%\interactions\GetRequestInstructionInteraction\GetRequestInstructionInteraction_1.0_RIVTABP21.wsdl
SET X0=%SCHEMADIR%\interactions\GetRequestInstructionInteraction\*.xsd

SET W1=%SCHEMADIR%\interactions\GetRequestStatusInteraction\GetRequestStatusInteraction_1.0_RIVTABP21.wsdl
SET X1=%SCHEMADIR%\interactions\GetRequestStatusInteraction\*.xsd

SET W2=%SCHEMADIR%\interactions\ProcessRequestConfirmationInteraction\ProcessRequestConfirmationInteraction_1.0_RIVTABP21.wsdl
SET X2=%SCHEMADIR%\interactions\ProcessRequestConfirmationInteraction\*.xsd

SET W3=%SCHEMADIR%\interactions\ProcessRequestInteraction\ProcessRequestInteraction_1.0_RIVTABP21.wsdl
SET X3=%SCHEMADIR%\interactions\ProcessRequestInteraction\*.xsd

SET W4=%SCHEMADIR%\interactions\ProcessRequestOutcomeInteraction\ProcessRequestOutcomeInteraction_1.0_RIVTABP21.wsdl
SET X4=%SCHEMADIR%\interactions\ProcessRequestOutcomeInteraction\*.xsd

SET XCORE=%SCHEMADIR%\core_components\*.xsd

SET SCHEMAS=%XCORE% %W0% %X0% %W1% %X1% %W2% %X2% %W3% %X3% %W4% %X4% 

SET OUTFILE=/out:wcf\generated-src\ClinicalprocessActivityRequestInteractions.cs
SET APPCONFIG=/config:wcf\generated-src\app.config
SET NAMESPACE=/namespace:*,Riv.Clinicalprocess.Activity.Request.Schemas.v1
SET SVCUTIL="svcutil.exe"
%SVCUTIL% /language:cs %OUTFILE% %APPCONFIG% %NAMESPACE% %SCHEMAS%

CD wcf
ECHO Generating Service contract .Net Binding interfaces and classes for clinicalprocess:activity:request Release 1
ECHO I DotNetprojektet ska du ta lagga till referens till System.ServiceModel
