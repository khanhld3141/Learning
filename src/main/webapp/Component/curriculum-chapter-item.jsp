<%@ page import="model.Chapter" %>
<%@ page import="model.Lession" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- boc trong khoi <div class="accordion" id="accordionCurriculum"></div> de su dung bootstrap--%>
<%
    if (request.getAttribute("course") != null) {
        for (Chapter chapter : course.getChapters()) {

%>
<div class="accordion-item">
    <h2 class="accordion-header" id="heading<%=chapter.getId()%>">
        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapse<%=chapter.getId()%>" aria-expanded="true"
                aria-controls="collapse<%=chapter.getId()%>">
            <span class="curriculum__title"><%=chapter.getName()%></span>
            <span class="curriculum__total-lecture"><%=chapter.getLessions().size()%> Lectures</span>
        </button>
    </h2>
    <%-- neu muon tu dong mo dropdown thi them show vao line 12--%>
    <div id="collapse<%=chapter.getId()%>" class="accordion-collapse collapse"
         aria-labelledby="heading<%=chapter.getId()%>" data-bs-parent="#accordionCurriculum">
        <div class="accordion-body">
            <ul>
               <%
                    for(Lession lession:chapter.getLessions()){
               %>
                <li><a href="#"><i class="fa-solid fa-play"></i><%=lession.getName()%></a></li>
                <%
                    }
                %>

            </ul>
        </div>
    </div>
</div>

<%
        }
    }
%>