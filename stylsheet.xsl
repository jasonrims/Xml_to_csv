<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="text" />

  <xsl:variable name="delimiter" select="','" />

  <!-- define an array containing the fields we are interested in -->
  <xsl:variable name="fieldArray">
    <field>name</field>
    <field>phone</field>
    <field>address</field>
    <field>closing</field>
    <field>rates</field>
    <field>specials</field>
  </xsl:variable>
  <xsl:param name="fields" select="document('')/*/xsl:variable[@name='fieldArray']/*" />

  <xsl:template match="/">

    <!-- output the header row -->
    <xsl:for-each select="$fields">
      <xsl:if test="position() != 1">
        <xsl:value-of select="$delimiter"/>
      </xsl:if>
      <xsl:value-of select="." />
    </xsl:for-each>

    <!-- output newline -->
    <xsl:text>&#xa;</xsl:text>

    <xsl:apply-templates select="museums/museum"/>
  </xsl:template>

  <xsl:template match="name">
    <xsl:variable name="currNode" select="." />

    <!-- output the data row -->
    <!-- loop over the field names and find the value of each one in the xml -->
   <!-- output the data row -->
    <!-- loop over the field names and find the value of each one in the xml -->
    <xsl:for-each select="$fields">
      <xsl:if test="position() != 1">
        <xsl:value-of select="$delimiter"/>
      </xsl:if>
      <xsl:text>"</xsl:text>
        <xsl:value-of select="$currNode/*[name() = current()]" />
      <xsl:text>"</xsl:text>
    </xsl:for-each>

    <!-- output newline -->
    <xsl:text>&#xa;</xsl:text>
  </xsl:template>
</xsl:stylesheet>