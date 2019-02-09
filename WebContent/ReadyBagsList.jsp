<%@include file="header.jsp" %>
<%@page import="java.sql.Connection"%>
<%@page import="parasad.com.util.PrasadDatabaseUtil"%>
<%@page import="java.sql.PreparedStatement"%>                                                                                                                                  
<%@page import="java.sql.ResultSet"%>
<div class="mycontainer">

<%if(request.getAttribute("msg")!=null){ %>
   <center><h1 style="color:red;font-size: 20px;"><%=request.getAttribute("msg").toString()%></h1></center>
<%} %>


<a href="bagStock.jsp"> Add new BAG</a>
<%

Connection con = PrasadDatabaseUtil.getConnection();
String sql  = "SELECT * FROM PRASAD_BAG"; 
PreparedStatement stmt  =  con.prepareStatement(sql);
ResultSet rs  = stmt.executeQuery();
/*INSERT INTO PRASAD_BAG
(ID,BAG_NAME,BRAND_NAME,MODEL_NO,PRICE,BAG_TYPE,BAG_SIZE)
VALUES(1,'AMERICON_TUR','AMRCN','A123',200,'MEN','800');
 	*/
%>
 


<table  border="1" width="100%">
<tr>
	<th>ID</th>
	<th>BAG_NAME</th>
	<th>BRAND_NAME</th>
	<th>MODEL_NO</th>
	<th>PRICE</th>
	<th>BAG_TYPE</th>
	<th>BAG_SIZE</th>
	<th>Action</th>
</tr>


<% while(rs.next()){ %>
<tr>
	<td><%=rs.getLong("ID")%></td>
	<td><%=rs.getString("BAG_NAME") %></td>
	<td><%=rs.getString("BRAND_NAME") %></td>
	<td><%=rs.getString("MODEL_NO")%></td>
	<td><%=rs.getFloat("PRICE") %></td>
	<td><%=rs.getString("BAG_TYPE") %></td>
	<td><%=rs.getString("BAG_SIZE") %></td>
	<td><a href="updatebag.jsp?readyBagId=<%=rs.getLong("ID")%>">Update</a> 
	&nbsp;&nbsp;<a href="deleteReadyBag?readyBagId=<%=rs.getLong("ID")%>">Delete</a> 
	</td>
</tr>
<%} %>


</table>



</div>

<%@include file="footer.jsp" %>