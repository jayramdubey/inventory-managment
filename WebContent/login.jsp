<%@include file="header.jsp" %>

<script>
function validate(){
if(document.lforms.u_name.value==""){
  alert("user Name required");
  return false;
}

if(document.lforms.u_pass.value==""){
  alert("user Name required");
  return false;
}


return true;
}
</script>


<div class="mycontainer">

<center>
<fieldset>
<legend>User Login</legend>
	<form  name="lforms" action="loginurl"  method="post">
		<font color="red" size="20">
	  <table>
	  		<tr>
	  			<td> Enter user id<input type="text" name="u_name"></td>
	  		</tr>
	  		
	  		<tr>
	  			<td>Enter password<input type="password" name="u_pass"></td>
	  			
	  		</tr>
	  		
	  		<tr>
	  			<td><input type="submit" value="login" onclick="return validate();"></td>
	  			<td><a href="signup.jsp">signup</a></td>
	  		</tr>

	  </table>
			
		
		
	</font>	
	</form>
</fieldset>
</center>

</div>

<%@include file="footer.jsp" %>