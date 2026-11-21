<%@page import="com.util.db.DataAccess"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
DataAccess db=new DataAccess();
String msg="",search="",icon="success";
if(request.getParameter("btnsearch")!=null){
	search=request.getParameter("txtsearch");
	session.setAttribute("search",search);
	response.sendRedirect("/exam/products.jsp?q="+search);
	//Redirects or moves from one page to another page (State lost)
}
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Online Exam Portal::</title>
<link href="/exam/css/bootstrap.css" rel="stylesheet"/>
<link href="/exam/js/DataTables/datatables.css" rel="stylesheet"/>

<style>
label.error{
color:red;
font-weight:bold;
}
</style>
</head>
<body>
<nav class="navbar navbar-expand-lg bg-primary" style="border-bottom:2px solid yellow" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="/exam/index.jsp">
    <img src="/exam/images/logo.jpg" class="rounded-circle" width="100px" height="60px' alt="NA"/>
    Online Exam Portal
    </a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
      <%
      if(session.getAttribute("user")==null) //if No login
      {      
      %>
        <li class="nav-item">
          <a class="nav-link active" href="/exam/index.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/about.jsp">About</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/contact.jsp">Contact</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/feedback.jsp">Feedback</a>
        </li>        
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("admin")){
       %> 
       <li class="nav-item">
          <a class="nav-link active" href="/exam/admin/admin.jsp">Admin
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/admin/topics.jsp">Topics</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/admin/questionlist.jsp">Questions</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/admin/userList.jsp">Users</a>
        </li>        
        <li class="nav-item">
          <a class="nav-link" href="/exam/admin/results.jsp">Result</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/admin/feedbacks.jsp">Feedbacks</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/admin/reportlist.jsp">Reports</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/admin/changepass.jsp">Change Password</a>
        </li>        
       <%
       }else if(session.getAttribute("user")!=null && session.getAttribute("type").equals("user")){
       %>
       <li class="nav-item">
          <a class="nav-link active" href="/exam/user/user.jsp">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/user/exam.jsp">Start Exam</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/user/results.jsp">Result</a>
        </li>                  
        <li class="nav-item">
          <a class="nav-link" href="/exam/changepass.jsp">Change Password</a>
        </li>
        
       <%
       }
       %>
      </ul>
      
      <%
      if(session.getAttribute("user")==null){
      %>
      <ul class="navbar-nav float-right">
      <li class="nav-item">
          <a class="nav-link" href="/exam/login.jsp">Login</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/signup.jsp">Signup</a>
        </li>
      </ul>
      <%
      }else{
      %>
      <ul class="navbar-nav float-right">
      <li class="nav-item">
          <a class="nav-link" href="#"><%=session.getAttribute("user")%></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="/exam/logout.jsp">Logout</a>
        </li>
      </ul>
      <%
      }
      %>
    </div>
  </div>
</nav>
