<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
if(request.getParameter("btnsave")!=null){
	String topicid=request.getParameter("txttopic");
	session.setAttribute("topicid",topicid);
	response.sendRedirect("/exam/user/start.jsp");
}
%>
<div class="row">
<div class="col-7 offset-2">
<br>
<h1>Start Exam - </h1>
<form method="post" id="form1">
<div class="form-group">
Select Topic
<select name="txttopic" id="txttopic" class="form-select">
<option value="">-- Select Exam Topic --</option>
<%
ResultSet rs=db.getRows("select * from Topics");
while(rs.next()){
%>
<option value="<%=rs.getString(1)%>:<%=rs.getString(2)%>:<%=rs.getString(3)%>"><%=rs.getString(2)%></option>
<%
}
%>
</select>
</div>
<div class="form-group">
 <h5>Terms and Conditions:</h5>
 <ul>
     <li>The exam must be taken within the scheduled time and date provided by the institution.</li>
     <li>Students should ensure they have a stable internet connection before starting the exam.</li>
     <li>Once the exam begins, the timer will not pause, and the exam must be completed within the allotted time.</li>
     <li>Students are not allowed to open other tabs, applications, or websites during the exam.</li>
     <li>Any form of cheating, copying, or unfair means is strictly prohibited.</li>
     <li>Students must not share exam questions or answers with others during or after the exam.</li>
     <li>The use of mobile phones, books, notes, or external help is not allowed unless permitted.</li>
     <li>Students must submit the exam before the time limit ends; otherwise, answers may not be recorded.</li>
     <li>Once submitted, the exam cannot be reopened or edited.</li>
     <li>The institution reserves the right to cancel the exam if any malpractice is detected.</li>
 </ul>

</div>
<br/>
<input type="submit" name="btnsave" value="Start Exam" class="btn btn-primary"/>
</form>
<br/>
<br/>
</div>


</div>
</div>
<%@ include file="../footer.jsp"%>