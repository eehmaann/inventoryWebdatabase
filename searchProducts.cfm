<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">

  <head>
    <title>Search Products</title>
    <cfinclude template = "general.css">
  </head>

  <body>
<!-- This page will allow the user choose a product description and send a request to see what parts are in it.-->
    <cfinclude template = "header.cfm">


      <cfform action="showandsearchComp.cfm" method="post" scriptSrc="http://cscie60.dce.harvard.edu:8500/CFIDE/scripts/">


        <table>
         <tr>
          <td>Products</td>
          <td>
       	<select name="prodNo">
                <cfoutput query="getproductDesc">
                  <option value="#prodNo#">#productDesc#</option>
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
