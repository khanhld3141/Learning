<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    if(request.getAttribute("course")!=null){
        List<Course> courses=(List<Course>) request.getAttribute("courses");
        for(Course c : courses){
%>
<li>
    <a href="#">
        <img src="/images/<%=c.getImage()%>" alt="">
        <div>
            <h5><%=c.getName()%></h5>
            <span class="skills">English, Communication, Social</span>
            <span class="lectures">5 lectures</span>
        </div>
    </a>
</li>
<%
        }
    }
%>