<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:msxsl="urn:schemas-microsoft-com:xslt" exclude-result-prefixes="msxsl">
    <xsl:output method="html" indent="yes"/>

    <xsl:template match="/"><!-- establishes a base template for the page to be used on startup-->
      <html>
        <head>
          <title>Student Listing</title>
        </head>
        <body>
          <h1>
            <font color="#a21c1c">Student Listing</font>
          </h1>
          <table border="1" bordercolor="purple" cellpadding="3" cellspacing="0" style="background-color:cyan">
            <xsl:apply-templates select="students/student"/><!-- calls the template to be used for the student structures 
            that is detailed later in the code-->
            <tr>
              <td colspan="2">Average GPA: </td>
              <td>
                <xsl:value-of select="sum(//gpa) div count(//gpa)"/><!-- gets the sum total of all the gpa values in the file and 
              divides it by their count-->
              </td>
              <td>&#160;</td>
            </tr>
          </table>
        </body>
        
        
      </html>
    </xsl:template>
  
  <xsl:template match="student"><!--establishes the template to be used for all student structures -->

    <tr>
      <td>
        <xsl:value-of select="@id"/><!--calls the value of id from student-->
      </td>
      <td>
        <xsl:value-of select="lastname"/>,<!--calls the value of lastname from student-->
        <xsl:value-of select="firstname"/><!--calls the value of firstname from student-->
      </td>
      <td>
        <xsl:value-of select="gpa"/><!--calls the value of gpa from student-->
      </td>
      <td>
        <xsl:choose><!--sets a condition in which either the first or second when is to be set off-->
          <xsl:when test="@type='grad'"><!--switch that only returns to contained commands if the student's type value is grad-->
            <b>Graduate Student</b>
         </xsl:when>
         <xsl:when test="@type='undergrad'"><!--switch that only returns to contained commands if the student's type value is undergrad-->
           <b>Undergraduate Student</b>
         </xsl:when>
        </xsl:choose>
      </td>
    </tr>
    <tr>
      <td colspan="4">
        <xsl:apply-templates select="charges"/><!-- calls the template to be used for the charges structures
            that is detailed later in the code-->
      </td>
    </tr>
    <tr>
      <td colspan="4" style="height:20px">&#160;</td>
    </tr>
  </xsl:template>
  
    
<xsl:template match="charges"> <!--establishes the template to be used for all charges structures -->
  <table>
    <tr>
      <td colspan="4">
        <b>Charges:</b>
      </td>
    </tr>
    <tr>
      <td>Tuition:</td>
      <td><xsl:value-of select="tuition"/></td><!--calls the value of tuition from charges-->
    </tr>
    <xsl:if test="self::node()[activity]"><!--checks if the structure has an activity value and only returns the contained code if it does-->
     <tr>
      <td>Activity:</td>
      <td><xsl:value-of select="activity"/></td><!--calls the value of activity from charges-->
    </tr>
    </xsl:if>
    <tr>
      <td>Parking:</td>
      <td><xsl:value-of select="parking"/></td><!--calls the value of parking from charges-->
    </tr>
    <tr>
      <td>Health:</td>
      <td><xsl:value-of select="health"/></td><!--calls the value of parking from charges-->
    </tr>
  
  </table>
</xsl:template>


</xsl:stylesheet>
