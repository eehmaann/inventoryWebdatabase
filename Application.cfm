<!--- ########## Oracle Variables ########## --->

<cfparam name="Request.DSN" default="cscie60">
<cfparam name="Request.username" default="eehmann">
<cfparam name="Request.password" default="0851">

<cfquery name="GetPartDesc" datasource="cscie60"
          username="eehmann"
          password="0851"> 
SELECT partNo, partDesc
FROM tbPart 
</cfquery>


<cfquery name="getproductDesc" datasource="cscie60"
          username="eehmann"
          password="0851"> 
SELECT prodNo, productDesc
FROM tbProduct
</cfquery>



