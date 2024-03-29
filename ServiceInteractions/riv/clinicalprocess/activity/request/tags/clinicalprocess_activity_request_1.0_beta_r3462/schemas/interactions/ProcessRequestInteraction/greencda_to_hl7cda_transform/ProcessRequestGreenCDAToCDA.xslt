<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2013sp1

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ns0="urn:riv:clinicalprocess:activity:request:1" xmlns:ns1="urn:riv:clinicalprocess:activity:request:ProcessRequestResponder:1" xmlns:ns2="urn:riv:clinicalprocess:activity:request:request:1" exclude-result-prefixes="xs fn ns0 ns1 ns2">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<ClinicalDocument xmlns="urn:hl7-org:v3">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'urn:hl7-org:v3 C:/Users/vije/Documents/Resources/HL7CDA~1/infrastructure/cda/CDA.xsd'"/>
			<xsl:for-each select="ns1:ProcessRequest/ns0:request">
				<xsl:variable name="var1_resultof_first" as="node()" select="ns2:additionalInformation"/>
				<xsl:variable name="var2_resultof_first" as="node()" select="ns2:questionFormulation"/>
				<xsl:variable name="var3_resultof_first" as="node()" select="ns2:author"/>
				<xsl:variable name="var4_resultof_first" as="node()" select="ns2:patient"/>
				<xsl:variable name="var5_resultof_first" as="node()" select="ns2:requestId"/>
				<xsl:variable name="var6_resultof_first" as="node()" select="$var3_resultof_first/ns2:healthcareProfessional"/>
				<xsl:variable name="var7_resultof_first" as="node()" select="$var4_resultof_first/ns2:personId"/>
				<xsl:variable name="var8_resultof_cast" as="xs:string" select="fn:string($var5_resultof_first/@extension)"/>
				<xsl:variable name="var9_resultof_first" as="node()" select="ns2:recipient/ns2:organisation/ns2:careUnitId"/>
				<xsl:variable name="var10_resultof_first" as="node()" select="$var3_resultof_first/ns2:healthcareProfessionalOrganisation/ns2:careUnitId"/>
				<typeId>
					<xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.1.3'"/>
					<xsl:attribute name="extension" namespace="" select="'POCD_HD000040'"/>
				</typeId>
				<id>
					<xsl:attribute name="root" namespace="" select="'1.2.752.129.2.1.2.1'"/>
				</id>
				<code>
					<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns2:typeOfRequest/@code)))"/>
					<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.129.2.2.2.24'"/>
					<xsl:attribute name="displayName" namespace="" select="'allmänremiss'"/>
				</code>
				<title>Allmänremiss</title>
				<effectiveTime>
					<xsl:attribute name="value" namespace="" select="fn:string(ns2:versionTimeStamp/@value)"/>
				</effectiveTime>
				<confidentialityCode>
					<xsl:attribute name="code" namespace="" select="'N'"/>
					<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.5.25'"/>
				</confidentialityCode>
				<setId>
					<xsl:attribute name="root" namespace="" select="fn:string($var5_resultof_first/@root)"/>
					<xsl:attribute name="extension" namespace="" select="$var8_resultof_cast"/>
				</setId>
				<versionNumber>
					<xsl:attribute name="value" namespace="" select="xs:string(xs:integer(fn:string(ns2:versionNumber)))"/>
				</versionNumber>
				<recordTarget>
					<patientRole>
						<id>
							<xsl:attribute name="root" namespace="" select="fn:string($var7_resultof_first/@root)"/>
							<xsl:attribute name="extension" namespace="" select="fn:string($var7_resultof_first/@extension)"/>
						</id>
						<xsl:for-each select="$var4_resultof_first/ns2:address">
							<addr>
								<xsl:attribute name="use" namespace="" select="'TMP'"/>
								<city>
									<xsl:sequence select="fn:string(ns2:postalCity)"/>
								</city>
								<postalCode>
									<xsl:sequence select="fn:string(ns2:postalCode)"/>
								</postalCode>
								<streetAddressLine>
									<xsl:sequence select="fn:string(ns2:streetName1)"/>
								</streetAddressLine>
								<xsl:for-each select="ns2:streetName2">
									<xsl:variable name="var11_resultof_cast" as="xs:string" select="fn:string(.)"/>
									<streetAddressLine>
										<xsl:sequence select="$var11_resultof_cast"/>
									</streetAddressLine>
								</xsl:for-each>
								<xsl:for-each select="ns2:streetName3">
									<xsl:variable name="var12_resultof_cast" as="xs:string" select="fn:string(.)"/>
									<streetAddressLine>
										<xsl:sequence select="$var12_resultof_cast"/>
									</streetAddressLine>
								</xsl:for-each>
								<xsl:for-each select="ns2:careOf">
									<careOf>
										<xsl:sequence select="fn:string(.)"/>
									</careOf>
								</xsl:for-each>
								<xsl:for-each select="ns2:postBox">
									<postBox>
										<xsl:sequence select="fn:string(.)"/>
									</postBox>
								</xsl:for-each>
							</addr>
						</xsl:for-each>
						<xsl:for-each select="$var4_resultof_first/ns2:telecom">
							<telecom>
								<xsl:attribute name="value" namespace="" select="xs:string(xs:anyURI(fn:string(ns2:number)))"/>
								<xsl:attribute name="use" namespace="" select="fn:string(ns2:typeOfTelecom/@code)"/>
							</telecom>
						</xsl:for-each>
						<patient>
							<xsl:for-each select="$var4_resultof_first/ns2:name">
								<name>
									<xsl:sequence select="fn:string(.)"/>
								</name>
							</xsl:for-each>
							<xsl:for-each select="$var4_resultof_first/ns2:gender">
								<administrativeGenderCode>
									<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(@code)))"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.129.2.2.1.1'"/>
								</administrativeGenderCode>
							</xsl:for-each>
							<xsl:for-each select="$var4_resultof_first/ns2:dateOfBirth">
								<birthTime>
									<xsl:attribute name="value" namespace="" select="fn:string(@value)"/>
								</birthTime>
							</xsl:for-each>
						</patient>
					</patientRole>
				</recordTarget>
				<author>
					<time>
						<xsl:attribute name="value" namespace="" select="fn:string($var3_resultof_first/ns2:dateOfRequest/@value)"/>
					</time>
					<assignedAuthor>
						<xsl:for-each select="$var6_resultof_first/ns2:id">
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string(@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string(@extension)"/>
							</id>
						</xsl:for-each>
						<code>
							<xsl:attribute name="code" namespace="" select="fn:string($var3_resultof_first/ns2:typeOfHealthcareProfessional/@code)"/>
							<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.2.8.8'"/>
						</code>
						<assignedPerson>
							<name>
								<xsl:sequence select="fn:string($var6_resultof_first/ns2:name)"/>
							</name>
						</assignedPerson>
					</assignedAuthor>
				</author>
				<custodian>
					<assignedCustodian>
						<representedCustodianOrganization>
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string($var10_resultof_first/@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string($var10_resultof_first/@extension)"/>
							</id>
						</representedCustodianOrganization>
					</assignedCustodian>
				</custodian>
				<informationRecipient>
					<intendedRecipient>
						<receivedOrganization>
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string($var9_resultof_first/@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string($var9_resultof_first/@extension)"/>
							</id>
						</receivedOrganization>
					</intendedRecipient>
				</informationRecipient>
				<component>
					<structuredBody>
						<component>
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
											<xsl:attribute name="code" namespace="" select="fn:string(ns2:reasonForVersion/ns2:typeOfReason/@code)"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.2.8.5'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'kv_e-remiss_versionsorsak'"/>
										</code>
									</act>
								</entry>
								<entry>
									<encounter>
										<xsl:attribute name="classCode" namespace="" select="'ENC'"/>
										<xsl:attribute name="moodCode" namespace="" select="'RQO'"/>
										<xsl:for-each select="$var1_resultof_first/ns2:desiredDateForPerformance">
											<xsl:variable name="var13_high" as="node()?" select="@high"/>
											<xsl:variable name="var14_low" as="node()?" select="@low"/>
											<effectiveTime>
												<low>
													<xsl:if test="fn:exists($var14_low)">
														<xsl:attribute name="value" namespace="" select="fn:string($var14_low)"/>
													</xsl:if>
												</low>
												<high>
													<xsl:if test="fn:exists($var13_high)">
														<xsl:attribute name="value" namespace="" select="fn:string($var13_high)"/>
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
										<xsl:for-each select="$var1_resultof_first/ns2:desiredRequestRecipient">
											<xsl:variable name="var15_resultof_cast" as="xs:string" select="fn:string(.)"/>
											<text>
												<xsl:sequence select="$var15_resultof_cast"/>
											</text>
										</xsl:for-each>
									</act>
								</entry>
							</section>
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
								<xsl:for-each select="$var1_resultof_first/ns2:administrativeInformation">
									<xsl:variable name="var16_resultof_cast" as="xs:string" select="fn:string(.)"/>
									<text>
										<xsl:sequence select="$var16_resultof_cast"/>
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
								<xsl:for-each select="$var1_resultof_first/ns2:interpreterRequirement">
									<xsl:variable name="var17_resultof_cast" as="xs:string" select="fn:string(.)"/>
									<text>
										<xsl:sequence select="$var17_resultof_cast"/>
									</text>
								</xsl:for-each>
							</section>
						</component>
						<component>
							<section>
								<code>
									<xsl:attribute name="code" namespace="" select="'UI'"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
									<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
									<xsl:attribute name="displayName" namespace="" select="'Uppmärksamhetsinformation'"/>
								</code>
								<title>Uppmärksamhetsinformation</title>
								<xsl:for-each select="ns2:awarenessInformation">
									<text>
										<xsl:sequence select="fn:string(ns2:text)"/>
									</text>
								</xsl:for-each>
							</section>
						</component>
						<component>
							<section>
								<id>
									<xsl:attribute name="root" namespace="" select="'1.2.752.129.2.1.2.1'"/>
									<xsl:attribute name="extension" namespace="" select="$var8_resultof_cast"/>
								</id>
								<code>
									<xsl:attribute name="code" namespace="" select="'FS'"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
									<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
									<xsl:attribute name="displayName" namespace="" select="'Frågeställning'"/>
								</code>
								<title>Frågeställning</title>
								<text>
									<xsl:sequence select="fn:string($var2_resultof_first/ns2:text)"/>
								</text>
								<xsl:for-each select="$var2_resultof_first/ns2:desiredActivity">
									<xsl:variable name="var18_resultof_first" as="node()" select="ns2:code"/>
									<xsl:variable name="var19_resultof_first" as="node()" select="ns2:id"/>
									<entry>
										<act>
											<xsl:attribute name="classCode" namespace="" select="'PCPR'"/>
											<xsl:attribute name="moodCode" namespace="" select="'RQO'"/>
											<id>
												<xsl:attribute name="root" namespace="" select="fn:string($var19_resultof_first/@root)"/>
												<xsl:attribute name="extension" namespace="" select="fn:string($var19_resultof_first/@extension)"/>
											</id>
											<code>
												<xsl:attribute name="code" namespace="" select="fn:string($var18_resultof_first/@code)"/>
												<xsl:attribute name="codeSystem" namespace="" select="fn:string($var18_resultof_first/@codeSystem)"/>
											</code>
											<text>
												<xsl:sequence select="fn:string(ns2:text)"/>
											</text>
										</act>
									</entry>
								</xsl:for-each>
								<xsl:for-each select="$var2_resultof_first/ns2:condition">
									<xsl:variable name="var20_resultof_first" as="node()" select="ns2:id"/>
									<entry>
										<observation>
											<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
											<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
											<id>
												<xsl:attribute name="root" namespace="" select="fn:string($var20_resultof_first/@root)"/>
												<xsl:attribute name="extension" namespace="" select="fn:string($var20_resultof_first/@extension)"/>
											</id>
											<xsl:for-each select="ns2:code">
												<code>
													<xsl:attribute name="code" namespace="" select="fn:string(@code)"/>
													<xsl:attribute name="codeSystem" namespace="" select="fn:string(@codeSystem)"/>
												</code>
											</xsl:for-each>
											<xsl:for-each select="ns2:text">
												<text>
													<xsl:sequence select="fn:string(.)"/>
												</text>
											</xsl:for-each>
										</observation>
									</entry>
								</xsl:for-each>
								<entry>
									<observation>
										<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
										<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
										<code>
											<xsl:attribute name="code" namespace="" select="'AN'"/>
											<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
											<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
											<xsl:attribute name="displayName" namespace="" select="'Anamnes'"/>
										</code>
										<text>
											<xsl:sequence select="fn:string($var2_resultof_first/ns2:clinicalInformation/ns2:text)"/>
										</text>
									</observation>
								</entry>
							</section>
						</component>
						<xsl:for-each select="ns2:paymentCommitment">
							<xsl:variable name="var21_resultof_first" as="node()" select="ns2:validity"/>
							<xsl:variable name="var22_low" as="node()?" select="$var21_resultof_first/@low"/>
							<xsl:variable name="var23_high" as="node()?" select="$var21_resultof_first/@high"/>
							<component>
								<section>
									<id>
										<xsl:attribute name="root" namespace="" select="'1.2.752.97.3.1.11'"/>
										<xsl:attribute name="extension" namespace="" select="fn:string(ns2:paymentCommitmentId/@extension)"/>
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
												<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns2:commitmentType/@code)))"/>
												<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.129.2.2.2.44'"/>
												<xsl:attribute name="codeSystemName" namespace="" select="'kv_betalningsförbindelsetyp_avtal'"/>
											</code>
										</observation>
									</entry>
									<entry>
										<observation>
											<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
											<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
											<xsl:for-each select="ns2:commitmentTypeChapter">
												<code>
													<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(@code)))"/>
													<xsl:attribute name="codeSystemName" namespace="" select="'kv_betalningsförbindelsetyp_kapitel'"/>
												</code>
											</xsl:for-each>
										</observation>
									</entry>
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
													<xsl:if test="fn:exists($var22_low)">
														<xsl:attribute name="value" namespace="" select="fn:string($var22_low)"/>
													</xsl:if>
												</low>
												<high>
													<xsl:if test="fn:exists($var23_high)">
														<xsl:attribute name="value" namespace="" select="fn:string($var23_high)"/>
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
											<xsl:for-each select="ns2:clinicalResponsibilityDescription">
												<xsl:variable name="var24_resultof_cast" as="xs:string" select="fn:string(.)"/>
												<text>
													<xsl:sequence select="$var24_resultof_cast"/>
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
											<xsl:for-each select="ns2:administrativeResponsibilityDescription">
												<xsl:variable name="var25_resultof_cast" as="xs:string" select="fn:string(.)"/>
												<text>
													<xsl:sequence select="$var25_resultof_cast"/>
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
												<xsl:attribute name="value" namespace="" select="xs:string(xs:boolean(fn:string(ns2:validOnlyForOutpatientCare)))"/>
											</value>
										</observation>
									</entry>
									<entry>
										<observation>
											<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
											<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
											<code>
												<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns2:liableCountyCouncil/@code)))"/>
												<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.2.2.1.18'"/>
											</code>
										</observation>
									</entry>
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
											<xsl:for-each select="ns2:dateOfApproval">
												<value>
													<xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('TS')"/>
													<xsl:attribute name="value" namespace="" select="fn:string(@value)"/>
												</value>
											</xsl:for-each>
										</observation>
									</entry>
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
											<xsl:for-each select="ns2:issuedInConsultationWith">
												<xsl:variable name="var26_val" as="item()+">
													<xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('ST')"/>
													<xsl:sequence select="fn:string(.)"/>
												</xsl:variable>
												<value>
													<xsl:sequence select="$var26_val"/>
												</value>
											</xsl:for-each>
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
											<xsl:for-each select="ns2:costCenter">
												<xsl:variable name="var27_val" as="item()+">
													<xsl:attribute name="xsi:type" namespace="http://www.w3.org/2001/XMLSchema-instance" select="xs:QName('ST')"/>
													<xsl:sequence select="fn:string(.)"/>
												</xsl:variable>
												<value>
													<xsl:sequence select="$var27_val"/>
												</value>
											</xsl:for-each>
										</observation>
									</entry>
									<xsl:for-each select="ns2:reimbursementInformation">
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
															<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns2:reimbursementType/@code)))"/>
															<xsl:attribute name="codeSystem" namespace="" select="'1.2.3.4'"/>
														</code>
													</observation>
												</entry>
												<entry>
													<observation>
														<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
														<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
														<code>
															<xsl:attribute name="code" namespace="" select="xs:string(xs:integer(fn:string(ns2:ownerOfInvokedContract/@code)))"/>
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
			</xsl:for-each>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
