<%@page import="com.util.db.DataAccess"%>
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
<html lang="en">

<head>
    <meta charset="utf-8">
    <title>ECOURSES - Online Courses HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="Free HTML Templates" name="keywords">
    <meta content="Free HTML Templates" name="description">

    <!-- Favicon -->
    <link href="/exam/img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/exam/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="/exam/css/style.css" rel="stylesheet">
</head>

<body>
    <!-- Topbar Start -->
    <div class="container-fluid d-none d-lg-block">
        <div class="row align-items-center py-4 px-xl-5">
            <div class="col-lg-3" style="display: flex;">
            <img src="/exam/images/logo1.jpg" style="width:30%" >
                <a href="" class="text-decoration-none">
                    <h1 class="m-0"><span class="text-primary">Exam</span>Portal</h1>
                </a>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-map-marker-alt text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Our Office</h6>
                        <small>Kothrud, Pune</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-envelope text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Email Us</h6>
                        <small>onlineexam@gmail.com</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 text-right">
                <div class="d-inline-flex align-items-center">
                    <i class="fa fa-2x fa-phone text-primary mr-3"></i>
                    <div class="text-left">
                        <h6 class="font-weight-semi-bold mb-1">Call Us</h6>
                        <small>+91 9370760075</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid">
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="d-flex align-items-center justify-content-between bg-secondary w-100 text-decoration-none" data-toggle="collapse" href="#navbar-vertical" style="height: 67px; padding: 0 30px;">
                    <h5 class="text-primary m-0"><i class="fa fa-book-open mr-2"></i>Subjects</h5>
                    <i class="fa fa-angle-down text-primary"></i>
                </a>
                <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 9;">
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link" data-toggle="dropdown">Web Design <i class="fa fa-angle-down float-right mt-1"></i></a>
                            <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                <a href="" class="dropdown-item">HTML</a>
                                <a href="" class="dropdown-item">CSS</a>
                                <a href="" class="dropdown-item">jQuery</a>
                            </div>
                        </div>
                        <a href="" class="nav-item nav-link">Apps Design</a>
                        <a href="" class="nav-item nav-link">Marketing</a>
                        <a href="" class="nav-item nav-link">Research</a>
                        <a href="" class="nav-item nav-link">SEO</a>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0"><span class="text-primary">E</span>COURSES</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav py-0">
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
            </div>
        </div>
    </div>
    <!-- Navbar End -->

