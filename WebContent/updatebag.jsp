<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="parasad.com.util.PrasadDatabaseUtil"%>
<%@page import="java.sql.Connection"%>
<%@include file="header.jsp" %>

<%@page import="prasad.com.Bag"%>

<div class="mycontainer">

<%
String readyBagId = request.getParameter("readyBagId");
Bag  bag  = new Bag();

Connection con = PrasadDatabaseUtil.getConnection();
try{
String sql  = "SELECT * FROM PRASAD_BAG where id="+readyBagId; 
PreparedStatement stmt  =  con.prepareStatement(sql);
ResultSet rs  = stmt.executeQuery();
/*INSERT INTO PRASAD_BAG
(ID,BAG_NAME,BRAND_NAME,MODEL_NO,PRICE,BAG_TYPE,BAG_SIZE)
VALUES(1,'AMERICON_TUR','AMRCN','A123',200,'MEN','800');
 	*/
 	
 	if(rs.next()){
 		bag.setId(rs.getLong("id"));
 		bag.setBagName(rs.getString("BAG_NAME"));
 		bag.setBrandName(rs.getString("BRAND_NAME"));
 		bag.setModelNumber(rs.getString("MODEL_NO"));
 		bag.setPrice(rs.getFloat("PRICE"));
 		bag.setBagType(rs.getString("BAG_TYPE"));
 		bag.setBagSize(rs.getString("BAG_SIZE"));
 	}
}catch(Exception e){
	e.printStackTrace();
}	
%>


<center>
<fieldset>
<legend>udDate Monitor</legend>

<form action="updateBag" method="post">
<table>
  <tr>
  <td>ID </td><td><input type="text"  name="bagID"  value="<%=bag.getId()%>"  readonly="readonly"></td>
 </tr>
  <tr>
  <td>Bag Name </td><td><input type="text"  name="bagName" value="<%=bag.getBagName()%>"></td>
 </tr>
 
 <tr>
	 <td>brand_name</td> <td><input type="text"  name="brandName" value="<%=bag.getBrandName()%>"></td>
 </tr>
     <td>model_no</td> <td><input type="text"  name="bagModelNo" value="<%=bag.getModelNumber()%>"></td>
 </tr>
 
 <tr>
 <td>price</td> <td><input type="text"  name="bagPrice" value="<%=bag.getPrice()%>"></td>
 </tr>
 <tr>
 <td>Type</td> <td><input type="text"  name="bagType" value="<%=bag.getBagType()%>"></td>
 </tr>
 <tr>
 <td>Size</td> <td><input type="text"  name="bagSize" value="<%=bag.getBagSize()%>"></td>
 </tr>
  
<tr>
 <td>
<input type="submit"  value="Update"></td></tr>
</table>

</form>
</fieldset>
</center>


</div>

<%@include file="footer.jsp" %>