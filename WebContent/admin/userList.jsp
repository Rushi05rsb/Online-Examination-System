<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<div class="col-7 offset-2">
<br/>
<h1>Registered Users List</h1>
<table id="table1" class="table table-bordered">
<thead class="table-dark">
<tr class="bg-primary">
<th>CustomerId</th>
<th>Email ID/UserName</th>
<th>Mobile No</th>
<th>Password</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getRows("select * from Signup");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1) %></td>
<td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getString(4) %></td>
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