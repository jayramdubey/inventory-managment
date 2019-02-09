<%@include file="header.jsp" %>


<script>

function validate(){
if(document.addforms.mname.value==""){
  alert("user  Name required");
  return false;
}

return true;
}
</script>
<div class="mycontainer">

<center>
<fieldset>
<legend>Add user</legend>

<form  name="adduser" action="addnewuser" method="post">
<table>
  <tr>
  <td>Enter user id</td>
  <td><input type="text"  name="userId"></td>
 </tr>
 
 <tr>
	 <td>Enter name</td> <td><input type="text"  name="userName"></td>
 </tr>
 
 <tr>
     <td>Enter password</td> <td><input type="text"  name="upass"></td>
 </tr>
 <tr>
<td>type</td> <td>
<select name="user_type">
<option value="manager">Manager</option>
<option value="admin">admin</option>
</select>
</td>
 </tr>
 
 <tr>
     <td><input type="submit" value="add"></td>
 </tr>
 
 </table>
 </form> </fieldset>
 </center>
 </div>

<%@include file="footer.jsp" %>