<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String id="",name="",nq="",btntext="Save";

if(request.getParameter("btnsave")!=null){	

if(request.getParameter("btnsave").equals("Save")){
	name=request.getParameter("txtname");
	nq=request.getParameter("txtnq");
	db.executeSql("Insert into Topics (TopicName,NoofQuestions) values(?,?)", name,nq);
	msg="Topic is saved successfully...";
}else{
	id=request.getParameter("txtid");
	name=request.getParameter("txtname");
	nq=request.getParameter("txtnq");
	db.executeSql("Update Topics set TopicName=?,NoofQuestions=? where Id=?", name,nq,id);
	msg="Topic is updated successfully...";
}
}else{
	
	if(request.getParameter("eid")!=null){
		id=request.getParameter("eid");
		ResultSet rs=db.getRows("select * from Topics where Id=?", id);
		if(rs.next()){
			name=rs.getString(2);
			nq=rs.getString(3);
			btntext="Update";
		}
	}else if(request.getParameter("did")!=null){
		id=request.getParameter("did");
		db.executeSql("Delete from Topics Where Id=?", id);
		msg="Topic is deleted successfully....";
	}
	
}

%>
<div class="col-7 offset-2">
<br/>
<h1>Manage Exam Topics::</h1>
<form method="post" id="form1">
<input type="hidden" name="txtid" value="<%=id%>"/>
<div class="form-group">
Topic Name
<input name="txtname" class="form-control" placeholder="Topic Name" value="<%=name%>" autofocus/>
</div>
<div class="form-group">
No. of Questions
<input name="txtnq" type="number" class="form-control" placeholder="No. of Questions" value="<%=nq%>"/>
</div>
<br/>
<input type="submit" name="btnsave" value="<%=btntext%>" class="btn btn-primary"/>
<a href="topics.jsp" class="btn btn-secondary">Clear</a>
</form>
<br/>
<br/>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr>
<th>Topic Id</th>
<th>Topic Name</th>
<th>No. of Questions</th>
<th>Actions</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Topics");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td>
<a href="?eid=<%=rs.getString(1) %>" class="btn btn-info">Edit</a>
<a href="?did=<%=rs.getString(1) %>" onclick="return confirm('Do you want to delete this record?');"  class="btn btn-danger">Delete</a>
</td>
</tr>

<%
}
%>

</tbody>
</table>
</div>

<%@ include file="../footer.jsp"%>
<script>
$(function(){
	$("#table1").DataTable(); //Apply DataTable library on Table whose ID is table1
});
</script>