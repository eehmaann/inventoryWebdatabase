<html>
   <head>
      <title>Component List</title>
          <cfinclude template = "general.css">
   </head>
   <body>
     <cfinclude template = "header.cfm">
   <!-- This assumes that the company is superstitious and would never use the number 666. -->
   <cfparam name="Form.prodNo" default="666" type="string">
    <cfquery name="getComp" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
		SELECT tbComponent.compNo, tbComponent.partNo, tbComponent.noPartsReq, item.partDesc, tbComponent.prodNo
        FROM tbComponent
        JOIN tbPart item on tbComponent.partNo =item.partNo
        WHERE tbComponent.prodNo=#Form.prodNo#
</cfquery>
  
      <cfif #Form.prodNo# EQ "666">
      <cflocation
url="http://cscie60.dce.harvard.edu/~eehmann/searchProducts.cfm"> 
       <cfelseif getComp.RecordCount is 0>
                  <p>Currently there are no parts for this product</p>
                  
              <cfelse>
               Part
         <form action="updateparts.cfm" method="get">
        
       	<select name="partNo">
        <cfoutput query="getComp">
                  <option value="#partNo#">#partDesc#</option>
                  </cfoutput>
              </select>
           
                <input type="submit" name="updateparts" value="Select part to edit">
              </form>
            <table>
              <tr> 
              <td>Component Number</td>
              <td>Part Number</td>
              <td> Part Desc</td>
              <td> Number of Parts Required</td>
              </tr>
              <cfoutput query="getComp">
             <tr>
              <td style="text-align: center">#compNo#</td
              ><td>#partNo#</td>
              <td>#partDesc#</td>
              <td>#noPartsReq#</td>
             </tr>
             </cfoutput>
             </table>
             </cfif>
                 <cfinclude template = "footer.cfm">
    </body>
</html>

        
     