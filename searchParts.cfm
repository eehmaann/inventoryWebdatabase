<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

  <head>
    <title>Parts</title>
    <cfinclude template = "general.css">
  </head>

  <body>

    <cfinclude template = "header.cfm">
<!-- Query is in applications as this query could be used multiple times in other pages without losing anything -->
      <cfform action="ShowQuotes.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/">


        <table>
         <tr>
          <td>Part</td>
          <td>
       	<select name="partNo">
                <cfoutput query="getPartDesc">
                  <option value="#partNo#">#partDesc#</option>
                </cfoutput>
              </select>
          </td>
         </tr>
         <tr>
          <td>&nbsp;</td>
          <td>
           <input type="submit" value="Submit" />
          </td>
        </tr>
         
       </table>
      </cfform>
     
    <cfinclude template = "footer.cfm">

    </body>
</html>
