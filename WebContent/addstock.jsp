
<%@page import="parasad.com.bo.BagRequiredRawItem"%>
<%@page import="java.util.List"%>
<%@page import="parasad.com.Dao.StockDao"%>

<%@include file="header.jsp" %>

<div class="mycontainer">
	<%
List<BagRequiredRawItem> itemList = StockDao.getAllBagRequiredRawItem();
%>
<hr>
<a href="stock_list.jsp" ><span>Back Raw Stocks</span></a>
<hr>

<fieldset>
<legend>Add stock</legend>
<center>
<form method="post" action="addstock" name="stockform">
   Select raw item
  <table>
  	<tr>
  		<td><select name="rawitemId">
			<%for(BagRequiredRawItem item:itemList) {%>
			<option value="<%=item.getId()%>"><%=item.getItemName() %></option>
			<%} %>
   			</select> 
   		</td>
   		</tr>	
   	<tr>
   		<td> Total Unit <input type="text" name="totalUnit" > </td>
  	</tr>
  	
  	<tr>
   		<td> Price per unit <input type="text" name="unitprice" ></td>
  	</tr>
  	
  	<tr>
   		<td> <input type="submit" value="Add Stock"> </td>
  	</tr>
  </table>

</form>
</center>
</fieldset>
	
</div>


<%@include file="footer.jsp" %>