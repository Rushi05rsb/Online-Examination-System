<%@page import="java.sql.ResultSet"%>
<%@ include file="../header.jsp"%>

<%
String data=session.getAttribute("topicid")+"";
String arr[]=data.split(":");
String topicid=arr[0];
String topicname=arr[1];
String nq=arr[2];

if(request.getParameter("btn")!=null){
	int correct = 0;
	int nQ=10;
	if(!nq.equals("")){
		nQ=Integer.parseInt(nq);
	}
    for (int i = 1; i <= nQ; i++) {
        int ques_id = Integer.parseInt(request.getParameter("question" + i + "_id"));
        int option = Integer.parseInt(request.getParameter("question" + i + "_option"));

        ResultSet correct_ans = db.getRows("select correct_answer from questions where id='" + ques_id + "'");
        if (correct_ans.next()) {
            request.setAttribute("question" + i + "_option", option);
            request.setAttribute("question" + i + "_id", ques_id);
            request.setAttribute("question" + i + "_correct_ans", correct_ans.getInt(1));
            if (option == correct_ans.getInt(1)) {
                correct++;
                request.setAttribute("question" + i + "_correct", "true");
            } else {
                request.setAttribute("question" + i + "_correct", "false");
            }
        }
    }
    String emailid=session.getAttribute("user")+"";
    
    db.executeSql("Insert into Result (EmailID,TopicId,NoOfQuestions,CorrectQuestions) values(?,?,?,?)", emailid,topicid,nQ,correct);
	response.sendRedirect("/exam/user/results.jsp");
	return;

}
%>
<div class="row">
<div class="col-9 offset-1">
<br>
<h1>Exam - <%=topicname %> </h1>
<strong><span id="timeleft" class="text-right"></span></strong>
<hr/>
<form method="post" id="form1">
<%
ResultSet rs=db.getRows("select * from QuestionView where TopicId=?", topicid);
int i=1;
while(rs.next()){
%>
<div class="form-group">
<label class="col-2 control-label"><strong>Question <%=i %></strong></label>
                <div class="col-10 text-left">
                    <input type="hidden" value="<%=i %>" name="question<%=i %>_id">
                    <h5><%=rs.getString(5) %></h5>
                    <label>
                        <input type="radio" name="question<%=i%>_option" required="required" value="1">
                            <%=rs.getString(6) %>                    </label><br>
                    <label>
                        <input type="radio" name="question<%=i%>_option" required="required" value="2">
                            <%=rs.getString(7) %>                    </label><br>
                    <label>
                        <input type="radio" name="question<%=i%>_option" required="required" value="3">
                            <%=rs.getString(8) %>                    </label><br>
                    <label>
                        <input type="radio" name="question<%=i%>_option" required="required" value="4">
                            <%=rs.getString(9) %>                    </label>
                </div>
</div>
<hr/>
<%
i++;
}
%>
 <div class="form-group">
                <div class="col-lg-10 col-lg-offset-5">
                    <button type="reset" class="btn btn-info">Reset</button>
                    <button type="submit" name="btn" class="btn btn-primary">Submit</button>
                </div>
            </div>
</form>
<br/>
<br/>
</div>


</div>
</div>
<%@ include file="../footer.jsp"%>

<script>    
    var myVar = setInterval(function () {
        myTimer()
    }, 1000);
    var d = 600;
    var min, sec;

    function myTimer() {
        d--;
        min = parseInt(d / 60);
        sec = parseInt((d / 60 - min) * 59);
        document.getElementById("timeleft").innerHTML = min + " miunte " + sec + " second left";
    }
</script>