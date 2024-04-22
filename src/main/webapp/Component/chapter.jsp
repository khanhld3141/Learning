<div class="accordion-item chapter">
    <h2 class="accordion-header" id="heading${param.number_chapter}">
        <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${param.number_chapter}" aria-expanded="true" aria-controls="collapse${param.number_chapter}">
            <p class="id">${param.number_chapter}.</p>
            ${param.title_chapter}
        </button>
    </h2>
    <div id="collapse${param.number_chapter}" class="accordion-collapse collapse" aria-labelledby="heading${param.number_chapter}" data-bs-parent="#accordionExample">

        <%
            int numberOfLessons = 10;
        %>
        <div class="accordion-body videos">
            <%for(int j = 1; j <= numberOfLessons; j++){%>
            <jsp:include page="../Component/video.jsp">
                <jsp:param name="number_video" value="<%=j%>" />
                <jsp:param name="name_video" value="R6plN3FvzFY" />
                <jsp:param name="title_video" value="Lesson's Name" />
                <jsp:param name="time_video" value="1:00" />
                <jsp:param name="text_video" value="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electroni" />
            </jsp:include>
            <%}%>
        </div>
    </div>
</div>
