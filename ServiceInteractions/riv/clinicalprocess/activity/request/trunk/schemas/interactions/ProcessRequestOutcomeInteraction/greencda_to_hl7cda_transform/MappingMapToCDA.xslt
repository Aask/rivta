<?xml version="1.0" encoding="UTF-8"?>
<!--
This file was generated by Altova MapForce 2013sp1

YOU SHOULD NOT MODIFY THIS FILE, BECAUSE IT WILL BE
OVERWRITTEN WHEN YOU RE-RUN CODE GENERATION.

Refer to the Altova MapForce Documentation for further details.
http://www.altova.com/mapforce
-->
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions" xmlns:ns0="urn:riv:clinicalprocess:activity:request:1" xmlns:ns1="urn:riv:clinicalprocess:activity:request:request" exclude-result-prefixes="xs fn ns0 ns1">
	<xsl:output method="xml" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<ClinicalDocument xmlns="urn:hl7-org:v3">
			<xsl:attribute name="xsi:schemaLocation" namespace="http://www.w3.org/2001/XMLSchema-instance" select="'urn:hl7-org:v3 C:/Users/vije/Documents/Resources/HL7CDA~1/infrastructure/cda/CDA.xsd'"/>
			<xsl:for-each select="ns0:requestOutcome">
				<xsl:variable name="var1_requestOutcomeTime" as="node()?" select="ns1:requestOutcomeTime"/>
				<xsl:variable name="var2_resultof_first" as="node()" select="ns1:patient"/>
				<xsl:variable name="var3_resultof_first" as="node()" select="ns1:author"/>
				<xsl:variable name="var4_resultof_first" as="node()" select="ns1:requestOutcomeId"/>
				<xsl:variable name="var5_resultof_first" as="node()" select="ns1:outcome"/>
				<xsl:variable name="var6_resultof_first" as="node()" select="$var2_resultof_first/ns1:personId"/>
				<xsl:variable name="var7_resultof_first" as="node()" select="$var3_resultof_first/ns1:healthcareProfessional"/>
				<xsl:variable name="var8_resultof_first" as="node()" select="ns1:recipient/ns1:organisation/ns1:careUnitId"/>
				<xsl:variable name="var9_resultof_first" as="node()" select="$var3_resultof_first/ns1:healthcareProfessionalOrganisation/ns1:careUnitId"/>
				<xsl:attribute name="classCode" namespace="" select="'DOCCLIN'"/>
				<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
				<typeId>
					<xsl:attribute name="root" namespace="" select="'2.16.840.1.113883.1.3'"/>
					<xsl:attribute name="extension" namespace="" select="'POCD_HD000040'"/>
				</typeId>
				<id>
					<xsl:attribute name="root" namespace="" select="fn:string($var4_resultof_first/@root)"/>
					<xsl:attribute name="extension" namespace="" select="fn:string($var4_resultof_first/@extension)"/>
				</id>
				<code>
					<xsl:attribute name="code" namespace="" select="fn:string(ns1:typeOfRequestOutcome/@code)"/>
					<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.129.2.2.2.20'"/>
				</code>
				<title>Remissvar</title>
				<xsl:for-each select="$var1_requestOutcomeTime">
					<effectiveTime>
						<xsl:attribute name="value" namespace="" select="fn:string(@value)"/>
					</effectiveTime>
				</xsl:for-each>
				<confidentialityCode>
					<xsl:attribute name="code" namespace="" select="'N'"/>
					<xsl:attribute name="codeSystem" namespace="" select="'2.16.840.1.113883.5.25'"/>
				</confidentialityCode>
				<recordTarget>
					<patientRole>
						<id>
							<xsl:attribute name="root" namespace="" select="fn:string($var6_resultof_first/@root)"/>
							<xsl:attribute name="extension" namespace="" select="fn:string($var6_resultof_first/@extension)"/>
						</id>
						<patient>
							<name>
								<xsl:for-each select="$var2_resultof_first/ns1:name">
									<xsl:sequence select="fn:string(.)"/>
								</xsl:for-each>
							</name>
						</patient>
					</patientRole>
				</recordTarget>
				<author>
					<xsl:for-each select="$var1_requestOutcomeTime">
						<time>
							<xsl:attribute name="value" namespace="" select="fn:string(@value)"/>
						</time>
					</xsl:for-each>
					<assignedAuthor>
						<xsl:for-each select="$var7_resultof_first/ns1:id">
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string(@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string(@extension)"/>
							</id>
						</xsl:for-each>
						<code>
							<xsl:attribute name="code" namespace="" select="fn:string($var3_resultof_first/ns1:typeOfHealthcareProfessional/@code)"/>
							<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.2.8.8'"/>
						</code>
						<assignedPerson>
							<name>
								<xsl:sequence select="fn:string($var7_resultof_first/ns1:name)"/>
							</name>
						</assignedPerson>
					</assignedAuthor>
				</author>
				<custodian>
					<assignedCustodian>
						<representedCustodianOrganization>
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string($var9_resultof_first/@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string($var9_resultof_first/@extension)"/>
							</id>
						</representedCustodianOrganization>
					</assignedCustodian>
				</custodian>
				<informationRecipient>
					<intendedRecipient>
						<receivedOrganization>
							<id>
								<xsl:attribute name="root" namespace="" select="fn:string($var8_resultof_first/@root)"/>
								<xsl:attribute name="extension" namespace="" select="fn:string($var8_resultof_first/@extension)"/>
							</id>
						</receivedOrganization>
					</intendedRecipient>
				</informationRecipient>
				<component>
					<structuredBody>
						<component>
							<section>
								<code>
									<xsl:attribute name="code" namespace="" select="'SI'"/>
									<xsl:attribute name="codeSystem" namespace="" select="'1.2.752.97.3.1.11'"/>
									<xsl:attribute name="codeSystemName" namespace="" select="'SLL Informationskomponentkoder'"/>
									<xsl:attribute name="displayName" namespace="" select="'svarsinformation'"/>
								</code>
								<title>detaljerad remissvarsinformation</title>
								<text>
									<xsl:sequence select="fn:string($var5_resultof_first/ns1:outcomeText)"/>
								</text>
								<xsl:for-each select="$var5_resultof_first/ns1:accomplishedActivity">
									<xsl:variable name="var10_resultof_first" as="node()" select="ns1:code"/>
									<xsl:variable name="var11_resultof_first" as="node()" select="ns1:id"/>
									<entry>
										<act>
											<xsl:attribute name="classCode" namespace="" select="'PCPR'"/>
											<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
											<id>
												<xsl:attribute name="root" namespace="" select="fn:string($var11_resultof_first/@root)"/>
												<xsl:attribute name="extension" namespace="" select="fn:string($var11_resultof_first/@extension)"/>
											</id>
											<code>
												<xsl:attribute name="code" namespace="" select="fn:string($var10_resultof_first/@extension)"/>
												<xsl:attribute name="codeSystem" namespace="" select="fn:string($var10_resultof_first/@root)"/>
											</code>
											<text>
												<xsl:sequence select="fn:string(ns1:text)"/>
											</text>
										</act>
									</entry>
								</xsl:for-each>
								<xsl:for-each select="$var5_resultof_first/ns1:condition">
									<xsl:variable name="var12_resultof_first" as="node()" select="ns1:id"/>
									<entry>
										<observation>
											<xsl:attribute name="classCode" namespace="" select="'OBS'"/>
											<xsl:attribute name="moodCode" namespace="" select="'EVN'"/>
											<id>
												<xsl:attribute name="root" namespace="" select="fn:string($var12_resultof_first/@root)"/>
												<xsl:attribute name="extension" namespace="" select="fn:string($var12_resultof_first/@extension)"/>
											</id>
											<xsl:for-each select="ns1:code">
												<code>
													<xsl:attribute name="code" namespace="" select="fn:string(@code)"/>
													<xsl:attribute name="codeSystem" namespace="" select="fn:string(@codeSystem)"/>
												</code>
											</xsl:for-each>
											<text>
												<xsl:for-each select="ns1:text">
													<xsl:sequence select="fn:string(.)"/>
												</xsl:for-each>
											</text>
										</observation>
									</entry>
								</xsl:for-each>
							</section>
						</component>
					</structuredBody>
				</component>
			</xsl:for-each>
		</ClinicalDocument>
	</xsl:template>
</xsl:stylesheet>
