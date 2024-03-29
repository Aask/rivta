@REM ---------------------------------------------------------------------------------
@REM Generates c# WCF service contracts (interface), client proxies and wcf config 
@REM file for ehr:accesscontrol 1.0 WSDLs + XML Schemas, using .Net WCF tool svcuti.exe
@REM ---------------------------------------------------------------------------------
@REM Licensed to Inera AB under one
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
SET OUTFILE=/out:wcf\generated-src\EhrAccessControlInteractions.cs
SET APPCONFIG=/config:wcf\generated-src\app.config
SET NAMESPACE=/namespace:*,Riv.Ehr.AccessControl.Schemas.v1
SET SCHEMADIR="schemas\interactions"
SET SVCUTIL="svcutil.exe"

SET X1=schemas\core_components\*.xsd

SET W2=%SCHEMADIR%\VerifySubjectOfCareHasProtectedIdentityInteraction\VerifySubjectOfCareHasProtectedIdentityInteraction_1.0_RIVTABP20.wsdl
SET X3=%SCHEMADIR%\VerifySubjectOfCareHasProtectedIdentityInteraction\*.xsd

SET W3=%SCHEMADIR%\GetCurrentRevisionOfProtectedIdentitiesRepositoryInteraction\GetCurrentRevisionOfProtectedIdentitiesRepositoryInteraction_1.0_RIVTABP20.wsdl
SET X4=%SCHEMADIR%\GetCurrentRevisionOfProtectedIdentitiesRepositoryInteraction\*.xsd

SET W4=%SCHEMADIR%\ListProtectedIdentitiesRepositoryContentInteraction\ListProtectedIdentitiesRepositoryContentInteraction_1.0_RIVTABP20.wsdl
SET X5=%SCHEMADIR%\ListProtectedIdentitiesRepositoryContentInteraction\*.xsd

SET SCHEMAS=%W2% %W3% %W4% %X1% %X3% %X4% %X5% 

%SVCUTIL% /language:cs /wrapped %OUTFILE% %APPCONFIG% %NAMESPACE% %SCHEMAS%

CD wcf

ECHO I DotNetprojektet ska du lagga till en referens till System.ServiceModel