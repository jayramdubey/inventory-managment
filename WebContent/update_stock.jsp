
<%@page import="parasad.com.bo.RawStock"%>
<%@page import="parasad.com.bo.BagRequiredRawItem"%>
<%@page import="java.util.List"%>
<%@page import="parasad.com.Dao.StockDao"%>

<%@include file="header.jsp" %>

<div class="mycontainer">

<%
RawStock stock = (RawStock)request.getAttribute("stock");
%>
	
<fieldset>
<legend>Update stock</legend>
<center>

<hr>
<a href="stock_list.jsp" ><span>Back Raw Stocks</span></a>
<hr>

<form method="post" action="updateRowStock" name="stockupdateform">
   <input type="hidden" name="stockID" value="<%=stock.getId()%>">
  <table>
  	<tr>
  		<td>ID</td>
  		<td><%=stock.getId()%></td>
   	</tr>
   	
  	<tr>
  		<td>Item Name</td>
  		<td><%=stock.getBagRequiredRawItem().getItemName()%></td>
   	</tr>
   		
   	<tr>
   		<td> Total Unit(<%=stock.getBagRequiredRawItem().getItemUnitType().getUnitType() %>)
   		 <input type="text" name="totalUnit" value="<%=stock.getTotalUnit()%>"> </td>
  	</tr>
  	
  	<tr>
   		<td> Price per unit</td> 
   		<td>
   		<input type="text" name="unitprice" value="<%=stock.getPricePerUnit()%>"></td>
  	</tr>
  	
  	<tr>
  	    <td></td>
   		<td> <input type="submit" value="update stock"> </td>
  	</tr>
  </table>

</form>
</center>
</fieldset>
	
</div>


<%@include file="footer.jsp" %>