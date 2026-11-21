<%@ include file="../header.jsp"%>
<div class="row">
<div class="col-7 offset-2">
<h1>Reports::</h1>
<div class="list-group">
  <a href="#" class="list-group-item list-group-item-action active">Exam Reports List</a>
  <a href="/exam/admin/report.jsp?page=student" target="_blank" class="list-group-item list-group-item-action">Registered Student List</a>
  <a href="/exam/admin/report.jsp?page=Topics" target="_blank" class="list-group-item list-group-item-action">Exam Topics</a>
  <a href="/exam/admin/report.jsp?page=result" target="_blank" class="list-group-item list-group-item-action">Student Result</a>
  <a href="/exam/admin/report.jsp?page=feedback" target="_blank" class="list-group-item list-group-item-action">Student Feedback</a>  
</div>
</div>
</div>
<%@ include file="../footer.jsp"%>