<%@include file="header.jsp" %>	
<div class="mycontainer">

<form>
<table border="2" bgcolor="#444" align="centre" width="50%" height="50%">
<h1 style="color:red;">Send me a message..!</h1>
	 
	 <tr>
	 
			<td>Name</td>
			<td><input type="text"  Name="userName"></td>
	 </tr>
	
	 <tr>
			<td>Address</td>
			<td><input type="text"  Name="userAddress"></td>

	 </tr>
	 
	 <tr>
			<td>Mobile_No.</td>
			<td><input type="string"  Name="userMob"></td>

	 </tr>
	
	<tr>
			<td>Email_Id</td>
			<td>
			<input type="email" name="mailId">
			</td>
	</tr>
	
	<tr>
			<td>Your Country</td>
			<td><input type="text" name="Country"></td>
	</tr>
	
		<tr>
			<td>Your Country</td>
			<td><input type="text" name="Country"></td>
	</tr>
	<tr>
		<td height=100><textarea rows="4" cols="50">
		
		</textarea>
		
	</tr>
	
	
	<tr>
		<td><input type="reset"  value="Clear All"></td>
		<td>
		<input type="submit" value="Submit">
		</td>
	</tr>
</table>

</form>

</div>


<%@include file="footer.jsp" %>
