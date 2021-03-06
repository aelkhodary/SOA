<?xml version="1.0" encoding="UTF-8" ?>
<xsl:stylesheet version="1.0" xmlns:oraxsl="http://www.oracle.com/XSL/Transform/java"
                xmlns:xp20="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.Xpath20"
                xmlns:xref="http://www.oracle.com/XSL/Transform/java/oracle.tip.xref.xpath.XRefXPathFunctions"
                xmlns:mhdr="http://www.oracle.com/XSL/Transform/java/oracle.tip.mediator.service.common.functions.MediatorExtnFunction"
                xmlns:oraext="http://www.oracle.com/XSL/Transform/java/oracle.tip.pc.services.functions.ExtFunc"
                xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
                xmlns:dvm="http://www.oracle.com/XSL/Transform/java/oracle.tip.dvm.LookupValue"
                xmlns:oracle-xsl-mapper="http://www.oracle.com/xsl/mapper/schemas"
                xmlns:socket="http://www.oracle.com/XSL/Transform/java/oracle.tip.adapter.socket.ProtocolTranslator"
                xmlns:ns0="http://www.example.org/ns/fulfillment" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:tns="/orderssdo/common/"
                exclude-result-prefixes="xsd xsi oracle-xsl-mapper xsl ns0 tns oraxsl xp20 xref mhdr oraext dvm socket"
                xmlns:ns5="commonj.sdo/xml" xmlns:ns6="http://xmlns.oracle.com/adf/svc/types/"
                xmlns:plnk="http://docs.oasis-open.org/wsbpel/2.0/plnktype" xmlns:ns8="commonj.sdo/java"
                xmlns:ns2="/orderssdo/common/types/" xmlns:ns1="http://www.example.org/ns/intorder"
                xmlns:ns4="commonj.sdo" xmlns:ns3="/customersdo/common/types/"
                xmlns:client="http://xmlns.oracle.com/POApplication/POProcessing/FulfillmentPr"
                xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/" xmlns:ns7="http://xmlns.oracle.com/adf/svc/errors/">
  <oracle-xsl-mapper:schema>
    <!--SPECIFICATION OF MAP SOURCES AND TARGETS, DO NOT MODIFY.-->
    <oracle-xsl-mapper:mapSources>
      <oracle-xsl-mapper:source type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/FulfillmentPr.wsdl"/>
        <oracle-xsl-mapper:rootElement name="FulFillmentRequest" namespace="http://www.example.org/ns/fulfillment"/>
      </oracle-xsl-mapper:source>
    </oracle-xsl-mapper:mapSources>
    <oracle-xsl-mapper:mapTargets>
      <oracle-xsl-mapper:target type="WSDL">
        <oracle-xsl-mapper:schema location="../WSDLs/FulfillmentPr.wsdl"/>
        <oracle-xsl-mapper:rootElement name="ordersViewSDO" namespace="/orderssdo/common/"/>
      </oracle-xsl-mapper:target>
    </oracle-xsl-mapper:mapTargets>
    <!--GENERATED BY ORACLE XSL MAPPER 12.1.3.0.0(XSLT Build 140529.0700.0211) AT [WED JUN 20 01:52:57 GST 2018].-->
  </oracle-xsl-mapper:schema>
  <!--User Editing allowed BELOW this line - DO NOT DELETE THIS LINE-->
  <xsl:template match="/">
    <tns:ordersViewSDO>
      <tns:OrdId>
        <xsl:value-of select="/ns0:FulFillmentRequest/ns1:orderId"/>
      </tns:OrdId>
      <tns:CustId>
        <xsl:value-of select="/ns0:FulFillmentRequest/ns1:customerId"/>
      </tns:CustId>
      <tns:TotalPrice>
        <xsl:value-of select="/ns0:FulFillmentRequest/ns1:orderTotal"/>
      </tns:TotalPrice>
      <tns:DateOrdered>
        <xsl:value-of select="xp20:current-dateTime ( )"/>
      </tns:DateOrdered>
      <tns:DateShipped>' ''</tns:DateShipped>
      <tns:Status>
        <xsl:value-of select="/ns0:FulFillmentRequest/ns1:status"/>
      </tns:Status>
      <xsl:for-each select="/ns0:FulFillmentRequest/ns1:items/ns1:item">
        <tns:ItemsView>
          <tns:ItemId>
            <xsl:value-of select="position ( )"/>
          </tns:ItemId>
          <tns:OrdId>
            <xsl:value-of select="/ns0:FulFillmentRequest/ns1:orderId"/>
          </tns:OrdId>
          <tns:ProdId>
            <xsl:value-of select="ns1:prodId"/>
          </tns:ProdId>
          <tns:Price>
            <xsl:value-of select="ns1:price"/>
          </tns:Price>
          <tns:Quantity>
            <xsl:value-of select="ns1:qty"/>
          </tns:Quantity>
        </tns:ItemsView>
      </xsl:for-each>
    </tns:ordersViewSDO>
  </xsl:template>
</xsl:stylesheet>
