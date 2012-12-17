<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2013sp1

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ns0="urn:riv:clinicalprocess:activityrequest:1" xmlns:ns1="urn:riv:clinicalprocess:activityrequest:request" exclude-result-prefixes="xs fn ns0 ns1">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<xsl:variable name="var1_request" as="node()?" select="ns0:request"/>
		<ClinicalDocument xmlns="urn:hl7-org:v3">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'urn:hl7-org:v3 C:/Users/vije/Documents/Resources/HL7CDA~1/infrastructure/cda/CDA.xsd'"/>
			<xsl:attribute name="classCode" namespace="" select="'DOCCLIN'"/>
			<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
			<typeId>
				<xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.1.3'"/>
				<xsl:attribute name="extension" namespace="" select="'POCD_HD000040'"/>
			</typeId>
			<id>
				<xsl:attribute name="root" namespace="" select="'1.2.752.129.2.1.2.1'"/>
			</id>
			<code>
				<xsl:for-each select="$var1_request">
					<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns1:typeOfRequest/@code)))"/>
				</xsl:for-each>
				<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.129.2.2.2.24'"/>
				<xsl:attribute name="displayName" namespace="" select="'allmänremiss'"/>
			</code>
			<title>Allmänremiss</title>
			<xsl:for-each select="$var1_request">
				<effectiveTime>
					<xsl:attribute name="value" namespace="" select="fn:string(ns1:versionTimeStamp/@value)"/>
				</effectiveTime>
			</xsl:for-each>
			<confidentialityCode>
				<xsl:attribute name="code" namespace="" select="'N'"/>
				<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.5.25'"/>
			</confidentialityCode>
			<xsl:for-each select="$var1_request">
				<xsl:variable name="var2_resultof_first" as="node()" select="ns1:requestId"/>
				<setId>
					<xsl:attribute name="root" namespace="" select="fn:string($var2_resultof_first/@root)"/>
					<xsl:attribute name="extension" namespace="" select="fn:string($var2_resultof_first/@extension)"/>
				</setId>
			</xsl:for-each>
			<versionNumber>
				<xsl:for-each select="$var1_request">
					<xsl:attribute name="value" namespace="" select="xs:string(xs:integer(fn:string(ns1:versionNumber)))"/>
				</xsl:for-each>
			</versionNumber>
			<recordTarget>
				<xsl:for-each select="$var1_request">
					<xsl:variable name="var3_resultof_first" as="node()" select="ns1:patient"/>
					<xsl:variable name="var4_resultof_first" as="node()" select="$var3_resultof_first/ns1:personId"/>
					<patientRole>
						<id>
							<xsl:attribute name="root" namespace="" select="fn:string($var4_resultof_first/@root)"/>
							<xsl:attribute name="extension" namespace="" select="fn:string($var4_resultof_first/@extension)"/>
						</id>
						<xsl:for-each select="$var3_resultof_first/ns1:address">
							<addr>
								<xsl:attribute name="use" namespace="" select="'TMP'"/>
								<city>
									<xsl:sequence select="fn:string(ns1:postalCity)"/>
								</city>
								<postalCode>
									<xsl:sequence select="fn:string(ns1:postalCode)"/>
								</postalCode>
								<streetAddressLine>
									<xsl:sequence select="fn:string(ns1:streetName1)"/>
								</streetAddressLine>
								<xsl:for-each select="ns1:streetName2">
									<xsl:variable name="var5_resultof_cast" as="xs:string" select="fn:string(.)"/>
									<streetAddressLine>
										<xsl:sequence select="$var5_resultof_cast"/>
									</streetAddressLine>
								</xsl:for-each>
								<xsl:for-each select="ns1:streetName3">
									<xsl:variable name="var6_resultof_cast" as="xs:string" select="fn:string(.)"/>
									<streetAddressLine>
										<xsl:sequence select="$var6_resultof_cast"/>
									</streetAddressLine>
								</xsl:for-each>
								<xsl:for-each select="ns1:careOf">
									<careOf>
										<xsl:sequence select="fn:string(.)"/>
									</careOf>
								</xsl:for-each>
								<xsl:for-each select="ns1:postBox">
									<postBox>
										<xsl:sequence select="fn:string(.)"/>
									</postBox>
								</xsl:for-each>
							</addr>
						</xsl:for-each>
						<xsl:for-each select="$var3_resultof_first/ns1:telecom">
							<telecom>
								<xsl:sequence select="()"/>
							</telecom>
						</xsl:for-each>
						<patient>
							<xsl:for-each select="$var3_resultof_first/ns1:name">
								<name>
									<xsl:sequence select="fn:string(.)"/>
								</name>
							</xsl:for-each>
							<xsl:for-each select="$var3_resultof_first/ns1:gender">
								<administrativeGenderCode>
									<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(@code)))"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.129.2.2.1.1'"/>
								</administrativeGenderCode>
							</xsl:for-each>
							<xsl:for-each select="$var3_resultof_first/ns1:dateOfBirth">
								<birthTime>
									<xsl:attribute name="value" namespace="" select="fn:string(@value)"/>
								</birthTime>
							</xsl:for-each>
						</patient>
					</patientRole>
				</xsl:for-each>
			</recordTarget>
			<xsl:for-each select="$var1_request">
				<xsl:variable name="var7_resultof_first" as="node()" select="ns1:author"/>
				<xsl:variable name="var8_resultof_first" as="node()" select="$var7_resultof_first/ns1:healthcareProfessional"/>
				<author>
					<time>
						<xsl:attribute name="value" namespace="" select="fn:string($var7_resultof_first/ns1:dateOfRequest/@value)"/>
					</time>
					<assignedAuthor>
						<xsl:for-each select="$var8_resultof_first/ns1:id">
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string(@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string(@extension)"/>
							</id>
						</xsl:for-each>
						<code>
							<xsl:attribute name="code" namespace="" select="fn:string($var7_resultof_first/ns1:typeOfHealthcareProfessional/@code)"/>
							<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.2.8.8'"/>
						</code>
						<assignedPerson>
							<name>
								<xsl:sequence select="fn:string($var8_resultof_first/ns1:name)"/>
							</name>
						</assignedPerson>
					</assignedAuthor>
				</author>
			</xsl:for-each>
			<custodian>
				<assignedCustodian>
					<xsl:for-each select="$var1_request">
						<xsl:variable name="var9_resultof_first" as="node()" select="ns1:author/ns1:healthcareProfessionalOrganisation/ns1:careUnitId"/>
						<representedCustodianOrganization>
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string($var9_resultof_first/@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string($var9_resultof_first/@extension)"/>
							</id>
						</representedCustodianOrganization>
					</xsl:for-each>
				</assignedCustodian>
			</custodian>
			<xsl:for-each select="$var1_request">
				<xsl:variable name="var10_resultof_first" as="node()" select="ns1:recipient/ns1:organisation/ns1:careUnitId"/>
				<informationRecipient>
					<intendedRecipient>
						<receivedOrganization>
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string($var10_resultof_first/@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string($var10_resultof_first/@extension)"/>
							</id>
						</receivedOrganization>
					</intendedRecipient>
				</informationRecipient>
			</xsl:for-each>
			<component>
				<structuredBody>
					<component>
						<xsl:for-each select="$var1_request">
							<xsl:variable name="var11_resultof_first" as="node()" select="ns1:additionalInformation"/>
							<section>
								<code>
									<xsl:attribute name="code" namespace="" select="'ÖI'"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
									<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
									<xsl:attribute name="displayName" namespace="" select="'Övrig information'"/>
								</code>
								<title>Övrig remissinformation</title>
								<entry>
									<act>
										<xsl:attribute name="classCode" namespace="" select="'ACT'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="fn:string(ns1:reasonForVersion/ns1:typeOfReason/@code)"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.2.8.5'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'kv_e-remiss_versionsorsak'"/>
										</code>
									</act>
								</entry>
								<entry>
									<encounter>
										<xsl:attribute name="classCode" namespace="" select="'ENC'"/>
										<xsl:attribute name="moodCode" namespace="" select="'RQO'"/>
										<xsl:for-each select="$var11_resultof_first/ns1:desiredDateForPerformance">
											<xsl:variable name="var12_high" as="node()?" select="@high"/>
											<xsl:variable name="var13_low" as="node()?" select="@low"/>
											<effectiveTime>
												<low>
													<xsl:if test="fn:exists($var13_low)">
														<xsl:attribute name="value" namespace="" select="fn:string($var13_low)"/>
													</xsl:if>
												</low>
												<high>
													<xsl:if test="fn:exists($var12_high)">
														<xsl:attribute name="value" namespace="" select="fn:string($var12_high)"/>
													</xsl:if>
												</high>
											</effectiveTime>
										</xsl:for-each>
									</encounter>
								</entry>
								<entry>
									<act>
										<xsl:attribute name="classCode" namespace="" select="'ACT'"/>
										<xsl:attribute name="moodCode" namespace="" select="'RQO'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="'ÖM'"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
											<xsl:attribute name="displayName" namespace="" select="'Önskad mottagare'"/>
										</code>
										<xsl:for-each select="$var11_resultof_first/ns1:desiredRequestRecipient">
											<text>
												<xsl:sequence select="fn:string(.)"/>
											</text>
										</xsl:for-each>
									</act>
								</entry>
							</section>
						</xsl:for-each>
					</component>
					<component>
						<section>
							<code>
								<xsl:attribute name="code" namespace="" select="'AI'"/>
								<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
								<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
								<xsl:attribute name="displayName" namespace="" select="'Administrativ information'"/>
							</code>
							<title>Administrativ information</title>
							<xsl:for-each select="$var1_request/ns1:additionalInformation/ns1:administrativeInformation">
								<text>
									<xsl:sequence select="fn:string(.)"/>
								</text>
							</xsl:for-each>
						</section>
					</component>
					<component>
						<section>
							<code>
								<xsl:attribute name="code" namespace="" select="'TB'"/>
								<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
								<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
								<xsl:attribute name="displayName" namespace="" select="'Tolkbehov'"/>
							</code>
							<title>Tolkbehov</title>
							<xsl:for-each select="$var1_request/ns1:additionalInformation/ns1:interpreterRequirement">
								<text>
									<xsl:sequence select="fn:string(.)"/>
								</text>
							</xsl:for-each>
						</section>
					</component>
					<xsl:for-each select="$var1_request/ns1:awarenessInformation">
						<component>
							<section>
								<code>
									<xsl:attribute name="code" namespace="" select="'UI'"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
									<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
									<xsl:attribute name="displayName" namespace="" select="'Uppmärksamhetsinformation'"/>
								</code>
								<title>Uppmärksamhetsinformation</title>
								<text>
									<xsl:sequence select="fn:string(ns1:text)"/>
								</text>
							</section>
						</component>
					</xsl:for-each>
					<xsl:for-each select="$var1_request">
						<xsl:variable name="var14_resultof_first" as="node()" select="ns1:questionFormulation"/>
						<xsl:variable name="var15_resultof_first" as="node()" select="$var14_resultof_first/ns1:clinicalInformation"/>
						<component>
							<section>
								<id>
									<xsl:attribute name="root" namespace="" select="'1.2.752.129.2.1.2.1'"/>
									<xsl:attribute name="extension" namespace="" select="fn:string(ns1:requestId/@extension)"/>
								</id>
								<code>
									<xsl:attribute name="code" namespace="" select="'FS'"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
									<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
									<xsl:attribute name="displayName" namespace="" select="'Frågeställning'"/>
								</code>
								<title>Frågeställning</title>
								<text>
									<xsl:sequence select="fn:string($var14_resultof_first/ns1:text)"/>
								</text>
								<xsl:for-each select="$var14_resultof_first/ns1:desiredActivity">
									<xsl:variable name="var16_resultof_first" as="node()" select="ns1:code"/>
									<xsl:variable name="var17_resultof_first" as="node()" select="ns1:id"/>
									<entry>
										<act>
											<xsl:attribute name="classCode" namespace="" select="'PCPR'"/>
											<xsl:attribute name="moodCode" namespace="" select="'RQO'"/>
											<id>
												<xsl:attribute name="root" namespace="" select="fn:string($var17_resultof_first/@root)"/>
												<xsl:attribute name="extension" namespace="" select="fn:string($var17_resultof_first/@extension)"/>
											</id>
											<code>
												<xsl:attribute name="code" namespace="" select="fn:string($var16_resultof_first/@extension)"/>
												<xsl:attribute name="codeSystem" namespace="" select="fn:string($var16_resultof_first/@root)"/>
											</code>
											<text>
												<xsl:sequence select="fn:string(ns1:text)"/>
											</text>
										</act>
									</entry>
								</xsl:for-each>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<xsl:for-each select="$var15_resultof_first/ns1:code">
											<code>
												<xsl:attribute name="code" namespace="" select="fn:string(@code)"/>
												<xsl:attribute name="codeSystem" namespace="" select="fn:string(@codeSystem)"/>
											</code>
										</xsl:for-each>
										<xsl:for-each select="$var15_resultof_first/ns1:text">
											<text>
												<xsl:sequence select="fn:string(.)"/>
											</text>
										</xsl:for-each>
									</observation>
								</entry>
								<xsl:for-each select="$var14_resultof_first/ns1:condition">
									<xsl:variable name="var18_resultof_first" as="node()" select="ns1:id"/>
									<entry>
										<observation>
											<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
											<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
											<id>
												<xsl:attribute name="root" namespace="" select="fn:string($var18_resultof_first/@root)"/>
												<xsl:attribute name="extension" namespace="" select="fn:string($var18_resultof_first/@extension)"/>
											</id>
											<xsl:for-each select="ns1:code">
												<code>
													<xsl:attribute name="code" namespace="" select="fn:string(@code)"/>
													<xsl:attribute name="codeSystem" namespace="" select="fn:string(@codeSystem)"/>
												</code>
											</xsl:for-each>
											<xsl:for-each select="ns1:text">
												<text>
													<xsl:sequence select="fn:string(.)"/>
												</text>
											</xsl:for-each>
										</observation>
									</entry>
								</xsl:for-each>
							</section>
						</component>
					</xsl:for-each>
					<xsl:for-each select="$var1_request/ns1:paymentCommitment">
						<xsl:variable name="var19_resultof_first" as="node()" select="ns1:validity"/>
						<xsl:variable name="var20_low" as="node()?" select="$var19_resultof_first/@low"/>
						<xsl:variable name="var21_high" as="node()?" select="$var19_resultof_first/@high"/>
						<component>
							<section>
								<id>
									<xsl:attribute name="root" namespace="" select="'1.2.752.97.3.1.11'"/>
									<xsl:attribute name="extension" namespace="" select="fn:string(ns1:paymentCommitmentId/@extension)"/>
								</id>
								<code>
									<xsl:attribute name="code" namespace="" select="'BF'"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
									<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
									<xsl:attribute name="displayName" namespace="" select="'Betalningsförbindelse'"/>
								</code>
								<title>Betalningsförbindelse</title>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns1:commitmentType/@code)))"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.129.2.2.2.44'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'kv_betalningsförbindelsetyp_avtal'"/>
										</code>
									</observation>
								</entry>
								<xsl:for-each select="ns1:commitmentTypeChapter">
									<entry>
										<observation>
											<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
											<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
											<code>
												<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(@code)))"/>
												<xsl:attribute name="codeSystemName" namespace="" select="'kv_betalningsförbindelsetyp_kapitel'"/>
											</code>
										</observation>
									</entry>
								</xsl:for-each>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="'GT'"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
											<xsl:attribute name="displayName" namespace="" select="'giltighetstid'"/>
										</code>
										<value>
											<xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('IVL_PPD_TS')"/>
											<low>
												<xsl:if test="fn:exists($var20_low)">
													<xsl:attribute name="value" namespace="" select="fn:string($var20_low)"/>
												</xsl:if>
											</low>
											<high>
												<xsl:if test="fn:exists($var21_high)">
													<xsl:attribute name="value" namespace="" select="fn:string($var21_high)"/>
												</xsl:if>
											</high>
										</value>
									</observation>
								</entry>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="'KA'"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
											<xsl:attribute name="displayName" namespace="" select="'klinisk ansvarsbeskrivning'"/>
										</code>
										<xsl:for-each select="ns1:clinicalResponsibilityDescription">
											<xsl:variable name="var22_resultof_cast" as="xs:string" select="fn:string(.)"/>
											<text>
												<xsl:sequence select="$var22_resultof_cast"/>
											</text>
										</xsl:for-each>
									</observation>
								</entry>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="'AA'"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
											<xsl:attribute name="displayName" namespace="" select="'administrativ ansvarsbeskrivning'"/>
										</code>
										<xsl:for-each select="ns1:administrativeResponsibilityDescription">
											<xsl:variable name="var23_resultof_cast" as="xs:string" select="fn:string(.)"/>
											<text>
												<xsl:sequence select="$var23_resultof_cast"/>
											</text>
										</xsl:for-each>
									</observation>
								</entry>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="'EÖ'"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
											<xsl:attribute name="displayName" namespace="" select="'gäller endast öppenvård'"/>
										</code>
										<value>
											<xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('BL')"/>
											<xsl:attribute name="value" namespace="" select="xs:string(xs:boolean(fn:string(ns1:validOnlyForOutpatientCare)))"/>
										</value>
									</observation>
								</entry>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns1:liableCountyCouncil/@code)))"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.2.2.1.18'"/>
										</code>
									</observation>
								</entry>
								<xsl:for-each select="ns1:dateOfApproval">
									<entry>
										<observation>
											<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
											<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
											<code>
												<xsl:attribute name="code" namespace="" select="'DG'"/>
												<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
												<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
												<xsl:attribute name="displayName" namespace="" select="'datum för godkännande'"/>
											</code>
											<value>
												<xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('TS')"/>
												<xsl:attribute name="value" namespace="" select="fn:string(@value)"/>
											</value>
										</observation>
									</entry>
								</xsl:for-each>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="'UM'"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
											<xsl:attribute name="displayName" namespace="" select="'utfärdat i samråd med'"/>
										</code>
										<value>
											<xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('ST')"/>
											<xsl:for-each select="ns1:issuedInConsultationWith">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</value>
									</observation>
								</entry>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="'KS'"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
											<xsl:attribute name="displayName" namespace="" select="'kostnadsställe'"/>
										</code>
										<value>
											<xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('ST')"/>
											<xsl:for-each select="ns1:costCenter">
												<xsl:sequence select="fn:string(.)"/>
											</xsl:for-each>
										</value>
									</observation>
								</entry>
								<xsl:for-each select="ns1:reimbursementInformation">
									<component>
										<section>
											<code>
												<xsl:attribute name="code" namespace="" select="'EI'"/>
												<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
												<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
												<xsl:attribute name="displayName" namespace="" select="'Ersättningsinformation'"/>
											</code>
											<title>Ersättningsinformation</title>
											<entry>
												<observation>
													<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
													<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
													<code>
														<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns1:reimbursementType/@code)))"/>
													</code>
												</observation>
											</entry>
											<entry>
												<observation>
													<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
													<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
													<code>
														<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns1:ownerOfInvokedContract/@code)))"/>
														<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.2.2.1.18'"/>
													</code>
												</observation>
											</entry>
										</section>
									</component>
								</xsl:for-each>
							</section>
						</component>
					</xsl:for-each>
				</structuredBody>
			</component>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
