<%@page import="prasad.com.User"%>
<html>
<head>
<style>
	.site-container { 
	 -webkit-box-sizing: content-box; 
	 -moz-box-sizing: content-box; 
	 box-sizing: content-box; 
	 background: rgba(255, 255, 255, 0.8); 
	 box-shadow: 0 100px 100px #000000; 
	 margin: 10px auto 60px; 
	 width: 1350px; 
 }  
</style>
<link rel="stylesheet" id="megalithe-css" href="css/style.css" type="text/css" media="all">

</head>
<body>
<div class="site-container">

<div class="sisHeader" style="float: right width: 100%;">
  <div style="float: center; background-color: white; ">
  <table>
  <tr>
  <td>
  <img alt="" src="imgs/logo1.jpg" style="width: 160px;height: 100px;">
  
  <td><h1 style="font-family:Times New Roman;">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;SMART SHOPPING</h1>
     <% if(session.getAttribute("userkey")==null){%>
        <a href="login.jsp"> 
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;
        <button class="button">    
            login</button> </a><br>
     <%}else { 
      User uobj = (User)session.getAttribute("userkey");
      %>
      Welcome User :<%=uobj.getUserName() %>
        &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp;
   &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
     &nbsp; 
     
      <a href="logout">
      
      <button class="button">    
             LOGOUT</button>
     </a>
     <%} %></td>
  </tr>
  </table>
 
  <div style="float: right;">
	
	  </div>
  </div>
  
</div>

<ul id="menu-navigation" class="menu genesis-nav-menu menu-primary">
	<li id="menu-item-6" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-6">
		<a href="homepage.jsp" ><span>Home</span></a>
	</li>
<% if(session.getAttribute("userkey")!=null){%>
    

	<li id="menu-item-88" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-has-children menu-item-88">
	      <a href="services.jsp" ><span>SERVICES</span></a>
			<ul class="sub-menu">
				
				<li id="menu-item-392" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-392">
					 <a href="ReadyBagsList.jsp" ><span>BAG STOCK</span></a>
				</li>
				<li id="menu-item-392" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-392">
					 <a href="stock_list.jsp" ><span>RAW_MATERIAL STOCK</span></a>
				</li>
				
				<li id="menu-item-393" class="menu-item menu-item-type-post_type menu-item-object-page menu-item-393">
					 <a href="branch.jsp" ><span>BRANCH </span></a>
				</li>
				
			</ul>
	</li>
	
	 <%}//end if%>
	
	
	<li id="menu-item-6" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-6">
		<a href="contact.jsp" ><span>CONTACT</span></a>
	</li>
	
	<li id="menu-item-611" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-611">
		<a href="about.jsp" ><span>ABOUT</span></a>
	</li>
	
	<li id="menu-item-622" class="menu-item menu-item-type-custom menu-item-object-custom menu-item-home menu-item-622">
		<a href="help.jsp" ><span>HELP</span></a>
	</li>
</ul>

</div>