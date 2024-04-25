<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- boc trong khoi <div class="accordion" id="accordionCurriculum"></div> de su dung bootstrap--%>
<div class="accordion-item">
    <h2 class="accordion-header" id="heading<%=i%>">
        <button class="accordion-button" type="button" data-bs-toggle="collapse"
                data-bs-target="#collapse<%=i%>" aria-expanded="true"
                aria-controls="collapse<%=i%>">
            <span class="curriculum__title">Introduction to basic HTML</span>
            <span class="curriculum__total-lecture">8 Lectures</span>
        </button>
    </h2>
    <%-- neu muon tu dong mo dropdown thi them show vao line 12--%>
    <div id="collapse<%=i%>" class="accordion-collapse collapse"
         aria-labelledby="heading<%=i%>" data-bs-parent="#accordionCurriculum">
        <div class="accordion-body">
            <ul>
                <li><a href="#"><i class="fa-solid fa-play"></i>Nested HTML
                    Elements</a></li>
                <li><a href="#"><i class="fa-solid fa-play"></i>HTML
                    Attributes</a></li>
                <li><a href="#"><i class="fa-solid fa-play"></i>Headings Are
                    Important</a></li>
                <li><a href="#"><i class="fa-solid fa-play"></i>Don't Forget the
                    End Tag</a></li>
                <li><a href="#"><i class="fa-solid fa-play"></i>The Poem
                    Problem</a></li>
                <li><a href="#"><i class="fa-solid fa-play"></i>HTML Formatting
                    Elements</a></li>
                <li><a href="#"><i class="fa-solid fa-file"></i>Source code</a></li>
            </ul>
        </div>
    </div>
</div>