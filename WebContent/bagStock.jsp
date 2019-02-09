<%@include file="header.jsp" %>

<div class="mycontainer">

<script>

function validate(){
if(document.bagStockforms.b_bname.value==""){
  alert("Bag  Name required");
  return false;
}

return true;
}
</script>

<center>               
<fieldset>
<legend>Stock Entry</legend>    

<form  name="bagStockforms" action="BagStockControler" method="post">
<table>
  <tr>
  <td>bag_name </td><td><input type="text"  name="b_name"></td>
  </tr>
  
 <tr>
 <td>brand_name</td> <td><input type="text"  name="b_bname"></td>
 
 </tr>
     <td>model_no</td> <td><input type="text"  name="b_mmodelNo"></td>
 </tr>
 
 <tr>
 <td>price</td> <td><input type="text"  name="b_price"></td>
 </tr>
 
 <tr>
 <td>bagtype</td> <td><input type="text"  name="b_type"></td>
 </tr>
 
<tr>
 <td>Bagsize</td><td><input type="text"  name="b_size"></td>
 </tr>
 
 <tr>
 <td><input type="submit" value="add" onclick="return validate();"></td>
 
</tr>
 
</table>

</form>
</fieldset>
</center>


</div>

<%@include file="footer.jsp" %>