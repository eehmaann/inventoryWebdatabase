<html>
   <head>
       <title>Quotes</title>
    <cfinclude template = "general.css">
   </head>
   <body>
    <cfinclude template = "header.cfm">
      <table>
      <!--Query is based on information from Showparts.  With ways to adjust for bad numbers being forced in, even though select form would prevent it from happening.  This is a superstitious company partNo 13 will not be used for anything-->
      <cfparam name="Form.partNo" default="13" type="string">
     <cfquery name="getQuote" datasource="#Request.DSN#"
          username="#Request.username#"
          password="#Request.password#"> 
          select tbVendor.vendorNo, tbVendor.vendorName, tbQuote.priceQuote, tbQuote.partNo, COUNT(tbQuote.priceQuote)
             from tbVendor, tbQuote
             where tbQuote.vendorNo=tbVendor.vendorNo
             and tbQuote.partNo=#Form.partNo#
             Group By tbQuote.partNo, tbVendor.vendorNo, tbVendor.vendorName, tbQuote.priceQuote
        </cfquery>
        <cfif Form.partNo EQ "13">
        <p> You did not perform a valid query.  There is no part 13</p>
       <cfelseif getQuote.RecordCount is 0>
       
                  <p>Currently there are no quotes for this part</p>
                  
              <cfelseif getQuote.RecordCount IS 1>
                  <p>There is 1 quote for this part.  Two Quote minimum rule is being violated.</p>
              <cfelse>
              <tr> 
              <td>Vendor ID</td>
              <td>Vendor Name</td>
              <td> Quote</td>
              <td> Quote Count</td>
              </tr>
               <cfoutput query="getQuote">
             <tr>
              <td style="text-align: center">#vendorNo#</td
              ><td>#vendorName#</td>
              <td>#priceQuote#</td>
              <td>#RecordCount#</td>
             </tr>
             </cfoutput>
             </cfif>
		</table>
            <cfinclude template = "footer.cfm">
    </body>
</html>

        
     