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
                    for (Lession lession : chapter.getLessions()) {

                %>
                <li><a data-bs-toggle="modal" data-bs-target="#modal__preview-lesson_<%=lession.getId()%>" style="cursor:
                pointer"><i
                        class="fa-solid fa-play"></i><%=lession.getName()%>
                </a></li>
                <%
                    if ( lession.getLink() != "") {
                %>
                <div class="modal fade" id="modal__preview-lesson_<%=lession.getId()%>" role="dialog">
                    <div class="modal-dialog modal-lg">
                        <!-- Modal content-->
                        <div class="modal-content">
                            <div class="modal-header" style="display: flex; justify-content: space-between">
                                <h4 class="modal-title" style="font-weight: 500;color: #454545;">Preview lesson</h4>
                                <button type="button" class="close" data-dismiss="modal" style="
                                     border-radius: 6px;
                                     border: none;
                                     background: #f42626;
                                     color: white;
                                     ">&times;
                                </button>

                            </div>
                            <div class="modal-body">
                                <p style="font-weight: 500;color: #454545; font-size: 19px; text-transform: uppercase"><%=lession.getName()%>
                                </p>
                                <figure style="width: 100%; height: 100%">
                                    <video autoplay id="myVideo<%=lession.getId()%>" style="width: 100%; height: 100%; margin-top: 20px" controls>
                                        <source src="/images/<%=lession.getLink()%>">
                                    </video>
                                    <script>
                                        document.addEventListener('DOMContentLoaded', (event) => {
                                            const video = document.getElementById('myVideo<%=lession.getId()%>');
                                            const maxTime = 120;

                                            video.addEventListener('timeupdate', () => {
                                                if (video.currentTime >= maxTime) {
                                                    video.pause();
                                                    video.currentTime = 0;
                                                    alert('Videos can only be viewed for a maximum of 2 minutes');
                                                }
                                            });
                                        });
                                    </script>
                                </figure>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                        }
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