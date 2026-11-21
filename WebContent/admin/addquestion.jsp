<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>
<%
String id="",topicid="",text="",op1="",op2="",op3="",op4="",ans="",btntext="Save";
String fname="";
String title="Add Questions";

if(request.getParameter("btnsave")!=null){
	topicid=request.getParameter("txttopic");
	text=request.getParameter("txttext");
	op1=request.getParameter("txtop1");
	op2=request.getParameter("txtop2");
	op3=request.getParameter("txtop3");
	op4=request.getParameter("txtop4");
	ans=request.getParameter("txtans");
	
	if(request.getParameter("btnsave").equals("Save")){
		db.executeSql("Insert into Questions (TopicId,Text,Option1,Option2,Option3,Option4,Correct_Answer) values(?,?,?,?,?,?,?)", topicid,text,op1,op2,op3,op4,ans);
		msg="Question is saved successfully...";
	}else{
		db.executeSql("Update Questions set TopicId=?,Text=?,Option1=?,Option2=?,Option3=?,Option4=?,Correct_Answer=? where Id=?", topicid,text,op1,op2,op3,op4,ans,id);
		msg="Question is updated successfully...";
	}
}else{
	if(request.getParameter("eid")!=null){
		ResultSet rs=db.getRows("select * from Questions where Id=?",request.getParameter("eid"));
		if(rs.next()){
			id=rs.getString(1);
			topicid=rs.getString(2);
			text=rs.getString(3);
			op1=rs.getString(4);
			op2=rs.getString(5);
			op3=rs.getString(6);
			op4=rs.getString(7);
			ans=rs.getString(8);
			title="Edit Questions";
			btntext="Update";
		}
	}
}

%>
<div class="col-7 offset-2">
<br/>
<h3><%=title%>::</h3>
<form method="post" id="form1">
<input type="hidden" name="txtid" value="<%=id%>"/>
<div class="form-group">
Topic
<select name="txttopic" id="txttopic" class="form-select">
<option value="">-- Select Exam Topic --</option>
<%
ResultSet rs=db.getRows("select * from Topics");
while(rs.next()){
%>
<option value="<%=rs.getString(1)%>" <%=topicid.equals(rs.getString(1))?"selected":"" %>><%=rs.getString(2)%></option>
<%
}
%>
</select>
</div>

<div class="form-group">
Question
<input name="txttext" id="txttext" class="form-control" placeholder="Question" value="<%=text%>"/>
</div>
<div class="form-group">
Choice 1
<input name="txtop1" id="txtop1" class="form-control" value="<%=op1%>"/>
</div>
<div class="form-group">
Choice 2
<input name="txtop2" id="txtop2" class="form-control" value="<%=op2%>"/>
</div>
<div class="form-group">
Choice 3
<input name="txtop3" id="txtop3" class="form-control" value="<%=op3%>"/>
</div>
<div class="form-group">
Choice 4
<input name="txtop4" id="txtop4" class="form-control" value="<%=op4%>"/>
</div>
<div class="form-group">
Correct Answer (1,2,3,4)
<input name="txtans" id="txtans" class="form-control" value="<%=ans%>"/>
</div>
<br/>
<input type="submit" name="btnsave" value="<%=btntext%>" class="btn btn-primary"/>
<a href="addquestion" class="btn btn-secondary">Clear</a>
<a href="questionlist.jsp" class="btn btn-info">Questions List</a>
</form>
<br/>
<br/>
</div>

<%@ include file="../footer.jsp"%>
<script>
 $(function(){
	$("#form1").validate({
		rules:{
			txttext:{
				required:true
			},
			txtop1:{
				required:true
			},
			txtop2:{
				required:true
			},
			txtop3:{
				required:true
			},
			txtop4:{
				required:true
			},
			txtans:{
				required:true,
				digit:true 
			}
		},
		messages:{
			txttext:{
				required:"Question Text required"
			},
			txtop1:{
				required:"Please enter choice 1"
			},
			txtop2:{
				required:"Please enter choice 2"
			},
			txtop3:{
				required:"Please enter choice 3"
			},
			txtop4:{
				required:"Please enter choice 4"
			},
			txtans:{
				required:"Please enter answer",
				digit: "Answer must be integer"
			}
		}
		
	}); 
 });
 
 </script>
