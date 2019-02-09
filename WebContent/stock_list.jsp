<%@include file="header.jsp" %>
<%@page import="parasad.com.Dao.StockDao"%>
<%@page import="parasad.com.bo.RawStock"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="mycontainer">

<a href="addstock.jsp">Add Stock</a>

	<fieldset>
		<legend>All Stock</legend> 
		<table border="1">	
			<tr>
				    <th>stock Id</th>
					<th>BAG_REQUIRED_ROW_ITEM_ID</th>
					<th>item name(unitType)</th>
					<th>TOTAL__UNIT</th>
					<th>Per Unit Price</th>
					<th>Total Price</th>
					<th>Action</th>
					
			</tr>
		<%
 			List<RawStock> itemList = StockDao.getAllStock();
	 		for (RawStock stock : itemList) {
		%>
		
			<tr>
				<td><%=stock.getId()%></td>
				<td><%=stock.getBagRequiredRawItem().getId()%>
				<td><%=stock.getBagRequiredRawItem().getItemName()%>
				(<%=stock.getBagRequiredRawItem().getItemUnitType().getUnitType()%>)
				</td>
				
				<td> <%=stock.getTotalUnit() %> </td>
				<td><%=stock.getPricePerUnit() %></td>
				<td><%=stock.getPricePerUnit()*stock.getTotalUnit() %></td>
				<td>
				 <a href="updateRowStock?rowStockId=<%=stock.getId()%>">Update</a>
				 <a href="deleteStock?rowStockId=<%=stock.getId()%>">Delete</a>
				  </td>
				
			</tr>   
			
		<%} %>
		</table>
	</fieldset>
</div>

<%@include file="footer.jsp" %>