<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:WC="http://www.exchangenetwork.net/schema/WaDE/0.2">
<xsl:decimal-format name="num" decimal-separator="." grouping-separator=","/>
<xsl:template match="WC:WaDECatalog">
<html>
     <head>
     	 <meta name="description" content="WSWC - WaDE Catalog" />
         <title>WSWC - WaDE Catalog</title>
         <link rel="stylesheet" href="../styles/vendor.css" />
         <link rel="stylesheet" href="../styles/main.css" />
         <link rel="stylesheet" href="../styles/usgsHeader.css" />
         <link rel="stylesheet" href="../styles/custom.css" />
         <script>
         	(function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
         	(i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
         	m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
         	})(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

         	ga('create', '***GoogleAnalyticsIDHere***', 'auto');
         	ga('send', 'pageview');
         </script>
    </head>
<body>

<!-- BEGIN USGS Header Template -->

<div id="usgscolorband">

  <div id="usgsheader">

    <div id="usgsidentifier">
  	   <a href="https://www.usgs.gov/" target="_blank"><img src="../images/usgslogo.jpg" alt="USGS - science for a changing world" title="U.S. Geological Survey Home Page"/></a>
  	</div><!--usgsidentifier-->

  	<img src="../images/banner.jpg" alt="banner"/>

  	<div id="usgsccsabox">

  	   <div id="usgsccsa">
  		     <a href="https://www.usgs.gov/">USGS Home</a>
  				 <br /><a href="https://answers.usgs.gov/cgi-bin/gsanswers?tmplt=2">Contact USGS</a>
  				 <br /><a href="https://search.usgs.gov/">Search USGS</a>
  				<br />
  		</div><!--usgsccsa-->

  	</div><!--usgsccsabox-->

  </div><!--usgsheader-->
</div><!--colorband-->

<!-- END USGS Header Template -->

<div class="container">
  <div class="header">
		<ul class="nav nav-pills">
			<li>
			<a title="USGS Water Mission Area" href="https://www.usgs.gov/water/" target="_blank">USGS Water Mission Area</a>
			</li>
			<li class=" ">
			<a target="_blank" title="Water Availability and Use Science Program" href="https://water.usgs.gov/wausp/">Water Availability and Use Science Program</a>
			</li>
			<li class=" ">
			<a target="_blank" title="Water Use in the United States" href="https://water.usgs.gov/watuse/">Water Use in the United States</a>
			</li>
		</ul>
  </div>

       <div class="row">
        <div class="col-md-10">
          <div class="callout-note callout ng-isolate-scope" closeable="true">
            <p>
                Data shared within WaDE are organized by "reports,"
                which are yearly encapsulations of the data, either a water year
                (Oct. 1st - Sep. 30th), an irrigation year (Nov. 1st - Oct. 31st),
                or a calendar year. There may be multiple reports for any given
                year based on the methods used to generate that report.</p>
            <p>
                **NOTICE** For all data provided, please review the associated
                methodology information thoroughly to discover data provenance
                and quality before using, especially when comparing data between
                states or organizations.
             </p>
          </div>
        </div>
       </div>

     <xsl:apply-templates select="WC:Organization"/>

   </div>
 </body>
 </html>

</xsl:template>

<xsl:template match="WC:Organization">

	<hr></hr>
    <p><b><h4>Organization: <xsl:value-of select="WC:OrganizationName"/></h4></b></p>
    <p><h4>Location Information: <xsl:value-of select="WC:Report/WC:Location/WC:LocationName"/> -
    <xsl:value-of select="WC:Report/WC:Location/WC:LocationType"/> -
    <xsl:value-of select="WC:Report/WC:Location/WC:LocationText"/></h4></p>

       <div class="row">
        <div class="col-md-10">
          <div class="callout-note callout ng-isolate-scope" closeable="true">
            <p>
                For a listing of methods used by <xsl:value-of select="WC:OrganizationName"/>
                and shared within WaDE, <a><xsl:attribute name="href">
			<xsl:value-of select="WC:WaDEURLAddress"/>
			<xsl:text disable-output-escaping="yes">/WADE/v0.2/GetMethod/GetMethod.php?methodid=</xsl:text>
			<xsl:value-of select="WC:OrganizationIdentifier"/>
			<xsl:text disable-output-escaping="yes">&amp;methodname=ALL</xsl:text>
			</xsl:attribute>
			<xsl:attribute name="TARGET">
			<xsl:text disable-output-escaping="yes">_blank</xsl:text>
			</xsl:attribute>click here</a>.
             </p>
          </div>
        </div>
       </div>

<!--Test for any summary-level data -->

<xsl:if test="WC:Report/WC:Location/WC:DataAvailable/WC:DataCategory='SUMMARY'">

	<p>ALL SUMMARIZED DATA BY REPORT: To retrieve a report that contains all summary-level datatypes within
	a watershed/HUC/County by <xsl:value-of select="WC:OrganizationName"/>: </p>
<table style="width:700px">
	<tr>
	<td>
	<table>
	<tr>
		<th style="width:100px">Report</th>
		<th style="width:150px">Data Category</th>
		<th style="width:200px">View This Report</th>
	</tr>

<xsl:apply-templates select="WC:Report/WC:Location/WC:DataAvailable/WC:DataCategory"/>

</table>
</td>
</tr>
</table>
</xsl:if>

<!--Start of non-all requests -->
<p></p>
	<p>DATA BY DATATYPE: To retrieve both summaries and site-specific/detailed data by report and by data type:</p>
        <p><h6>*Note: Requests for DETAILED DATA may have more
        extensive data-retrieval times. Please be patient while the query is retrieved to your browser.
        The query retrieval could take several minutes depending on website traffic and your network speeds.
        Use the table below to access detailed datasets by report, data category, and data type.</h6></p>

<table style="width:750px">
	<tr>
	<td>
	<table>
	<tr>
		<th style="width:100px">Report</th>
		<th style="width:150px">Data Category*</th>
		<th style="width:200px">Datatype</th>
		<th style="width:300px">View Report by Data Type</th>
	</tr>

<xsl:apply-templates select="WC:Report/WC:Location/WC:DataAvailable"/>

</table>
</td>
</tr>
</table>
</xsl:template>

<xsl:template match="WC:Report/WC:Location/WC:DataAvailable/WC:DataCategory">
	<xsl:for-each select=".">
	<xsl:sort select="." order="descending"/>
		<tr>
	<xsl:choose>
		<xsl:when test=".='SUMMARY'">
			<td><xsl:value-of select="../../../WC:ReportIdentifier"/></td>
			<td><xsl:value-of select="."/></td>
			<td><a><xsl:attribute name="href">
				<xsl:value-of select="../../../../WC:WaDEURLAddress"/>
				<xsl:text disable-output-escaping="yes">/WADE/v0.2/GetSummary/GetSummary.php?loctype=</xsl:text>
				<xsl:value-of select="../../WC:LocationType"/>
				<xsl:text disable-output-escaping="yes">&amp;loctxt=</xsl:text>
				<xsl:value-of select="../../WC:LocationText"/>
				<xsl:text disable-output-escaping="yes">&amp;orgid=</xsl:text>
				<xsl:value-of select="../../../../WC:OrganizationIdentifier"/>
				<xsl:text disable-output-escaping="yes">&amp;reportid=</xsl:text>
				<xsl:value-of select="../../../WC:ReportIdentifier"/>
				<xsl:text disable-output-escaping="yes">&amp;datatype=ALL</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="TARGET">
				<xsl:text disable-output-escaping="yes">_blank</xsl:text>
				</xsl:attribute>
				View Data</a></td>
		</xsl:when>

<!--	Uncomment these lines if the "ALL" retrieval speeds for Detailed Data get faster...

<xsl:otherwise>
			<td><xsl:value-of select="../../../WC:ReportIdentifier"/></td>
			<td><xsl:value-of select="."/></td>
			<td><a><xsl:attribute name="href">
				<xsl:value-of select="../../../../WC:WaDEURLAddress"/>
				<xsl:text disable-output-escaping="yes">/WADE/v0.2/GetDetail/GetDetail.php?reportid=</xsl:text>
				<xsl:value-of select="../../../WC:ReportIdentifier"/>
				<xsl:text disable-output-escaping="yes">&amp;loctype=</xsl:text>
				<xsl:value-of select="../../WC:LocationType"/>
				<xsl:text disable-output-escaping="yes">&amp;loctxt=</xsl:text>
				<xsl:value-of select="../../WC:LocationText"/>
				<xsl:text disable-output-escaping="yes">&amp;datatype=ALL</xsl:text>
				</xsl:attribute>
				<xsl:attribute name="TARGET">
				<xsl:text disable-output-escaping="yes">_blank</xsl:text>
				</xsl:attribute>
				All Detailed Data</a></td>
		</xsl:otherwise>
-->
	</xsl:choose>
	</tr>
	</xsl:for-each>
</xsl:template>

<xsl:template match="WC:Report/WC:Location/WC:DataAvailable">
	<xsl:for-each select="WC:DataTypes/WC:DataType">
	<xsl:sort select="." order="ascending"/>

		<tr>
		<td><xsl:value-of select="../../../../WC:ReportIdentifier"/></td>
		<td><xsl:value-of select="../../WC:DataCategory"/></td>
		<td><xsl:value-of select="."/></td>

	<xsl:choose>
		<xsl:when test="../../WC:DataCategory='SUMMARY'">
			<td><a><xsl:attribute name="href">
			<xsl:value-of select="../../../../../WC:WaDEURLAddress"/>
				<xsl:text disable-output-escaping="yes">/WADE/v0.2/GetSummary/GetSummary.php?loctype=</xsl:text>
						<xsl:value-of select="../../../WC:LocationType"/>
						<xsl:text disable-output-escaping="yes">&amp;loctxt=</xsl:text>
						<xsl:value-of select="../../../WC:LocationText"/>
						<xsl:text disable-output-escaping="yes">&amp;orgid=</xsl:text>
						<xsl:value-of select="../../../../../WC:OrganizationIdentifier"/>
						<xsl:text disable-output-escaping="yes">&amp;reportid=</xsl:text>
						<xsl:value-of select="../../../../WC:ReportIdentifier"/>
						<xsl:text disable-output-escaping="yes">&amp;datatype=</xsl:text>
						<xsl:value-of select="."/>
						</xsl:attribute>
						<xsl:attribute name="TARGET">
						<xsl:text disable-output-escaping="yes">
						_blank</xsl:text>
						</xsl:attribute>
						View Data</a></td>
				</xsl:when>
				<xsl:otherwise>
					<td><a><xsl:attribute name="href">
					<xsl:value-of select="../../../../../WC:WaDEURLAddress"/>
						<xsl:text disable-output-escaping="yes">/WADE/v0.2/GetDetail/GetDetail.php?reportid=</xsl:text>
						<xsl:value-of select="../../../../WC:ReportIdentifier"/>
						<xsl:text disable-output-escaping="yes">&amp;loctype=</xsl:text>
						<xsl:value-of select="../../../WC:LocationType"/>
						<xsl:text disable-output-escaping="yes">&amp;loctxt=</xsl:text>
						<xsl:value-of select="../../../WC:LocationText"/>
						<xsl:text disable-output-escaping="yes">&amp;datatype=</xsl:text>
						<xsl:value-of select="."/>
						</xsl:attribute>
						<xsl:attribute name="TARGET">
						<xsl:text disable-output-escaping="yes">
						_blank</xsl:text>
						</xsl:attribute>
						View Data</a></td>
				</xsl:otherwise>
	</xsl:choose>
	</tr>

</xsl:for-each>
</xsl:template>
</xsl:stylesheet>
