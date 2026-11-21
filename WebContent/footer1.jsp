<%@page import="java.time.LocalDate"%>
<br/>
<br/>
<br/>
<nav class="navbar navbar-expand-lg bg-primary fixed-bottom" style="marigin-top:200px" data-bs-theme="dark">
  <div class="container-fluid">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="#">&copy; <%=LocalDate.now().getYear() %> All rights reserved by Students            
          </a>
        </li>        
        </ul>
        </div>
        </nav>

<script src="/exam/js/sweetalert.min.js"></script>
<script src="/exam/js/jquery-3.6.0.js"></script>
<script src="/exam/js/DataTables/datatables.js"></script>
<script src="/exam/js/bootstrap.js"></script>
<script src="/exam/js/jquery.validate.js"></script>
<script src="/exam/js/additional-methods.js"></script>
<%
if(!msg.equals(""))
{
%>
<script>
swal("Exam Portal","<%=msg%>","<%=icon%>");
</script>
<%
}
%>
</body>
</html>