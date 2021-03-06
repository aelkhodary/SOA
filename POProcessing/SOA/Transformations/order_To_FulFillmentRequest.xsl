<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:ns0="http://www.example.org/ns/intorder"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:tns="http://www.example.org/ns/fulfillment" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:ns1="http://xmlns.oracle.com/POApplication/POProcessing/EnrichPO"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype"
                xmlns:client="http://xmlns.oracle.com/POApplication/POProcessing/FulfillmentPr"
                xmlns:ns2="/orderssdo/common/types/" xmlns:ns3="/customersdo/common/types/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/EnrichPO.wsdl"/>
        <oracle-xsl-mapper:rootElement name="order" namespace="http://www.example.org/ns/intorder"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/FulfillmentPr.wsdl"/>
        <oracle-xsl-mapper:rootElement name="FulFillmentRequest" namespace="http://www.example.org/ns/fulfillment"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [TUE JUN 05 11:16:32 GST 2018].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:FulFillmentRequest>
      <ns0:customerId>
        <xsl:value-of select="/ns0:order/ns0:customerId"/>
      </ns0:customerId>
      <ns0:orderId>
        <xsl:value-of select="/ns0:order/ns0:orderId"/>
      </ns0:orderId>
      <ns0:payMethod>
        <xsl:value-of select="/ns0:order/ns0:payMethod"/>
      </ns0:payMethod>
      <ns0:shipMethod>
        <xsl:value-of select="/ns0:order/ns0:shipMethod"/>
      </ns0:shipMethod>
      <ns0:orderTotal>
        <xsl:value-of select="sum (/ns0:order/ns0:items/ns0:item/ns0:itemTotal )"/>
      </ns0:orderTotal>
      <ns0:status>
        <xsl:value-of select="/ns0:order/ns0:status"/>
      </ns0:status>
      <xsl:if test="/ns0:order/ns0:creditCard">
        <ns0:creditCard>
          <ns0:cardType>
            <xsl:value-of select="/ns0:order/ns0:creditCard/ns0:cardType"/>
          </ns0:cardType>
          <ns0:cardNumber>
            <xsl:value-of select="/ns0:order/ns0:creditCard/ns0:cardNumber"/>
          </ns0:cardNumber>
        </ns0:creditCard>
      </xsl:if>
      <ns0:items>
        <ns0:inStock>
          <xsl:value-of select="/ns0:order/ns0:items/ns0:inStock"/>
        </ns0:inStock>
        <xsl:for-each select="/ns0:order/ns0:items/ns0:item">
          <ns0:item>
            <ns0:prodId>
              <xsl:value-of select="ns0:prodId"/>
            </ns0:prodId>
            <ns0:prodName>
              <xsl:value-of select="ns0:prodName"/>
            </ns0:prodName>
            <ns0:price>
              <xsl:value-of select="ns0:price"/>
            </ns0:price>
            <ns0:qty>
              <xsl:value-of select="ns0:qty"/>
            </ns0:qty>
            <ns0:itemTotal>
              <xsl:value-of select="ns0:itemTotal"/>
            </ns0:itemTotal>
          </ns0:item>
        </xsl:for-each>
      </ns0:items>
    </tns:FulFillmentRequest>
  </xsl:template>
</xsl:stylesheet>
