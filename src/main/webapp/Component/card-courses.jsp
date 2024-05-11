<%@ page import="model.UserCourse" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (request.getAttribute("courses") != null) {
        List<Course> courses = (List<Course>) request.getAttribute("courses");
        for (Course c : courses) {
%>
<div class="item__card-courses">
    <div class="card-courses" id="card-courses">
        <div class="card-courses__thumb">
            <a href="/detail-course?id=<%=c.getId()%>"> <img src="/images/<%=c.getImage()%>" alt=""
                                                             class="card-courses__img"></a>
            <p class="price__courses"><%=c.getPrice()%>$</p>
        </div>

        <div class="card-courses__content">
            <a href="/detail-course?id=<%=c.getId()%>" class="card-courses__heading"><%=c.getName()%>
            </a>
            <h3 class="card-courses__desc"><%=c.getIntroduce()%>
            </h3>
            <div class="card-courses__enroll">
                <div class="enroll__left">
                    <p class="total-student"><i class="fa-regular fa-user"></i><%=c.getStudents().size()%>
                        Students</p>
                    <div class="total-star">
                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                        <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                    </div>
                </div>

                <%
                    if (session.getAttribute("user") != null) {
                        if (request.getAttribute("usercourse") != null) {
                            List<UserCourse> userCourses = (List<UserCourse>) request.getAttribute("usercourse");
                            boolean check = false;
                            for (UserCourse userCourse : userCourses) {
                                if (userCourse.getCourseId() == c.getId()) {
                                    check = true;
                                    break;
                                }
                            }
                            if (check) {

                %>
                <a style="background: #1ed085;color: #FFFFFF" href="/learning?courseid=<%=c.getId()%>"
                   class="btn btn--enroll">LEARN NOW</a>
                <%
                } else {
                %>
                <a href="/learning?courseid=<%=c.getId()%>" class="btn btn--enroll">ENROLL NOW</a>
                <%
                        }
                    }

                } else {
                %>
                <a href="/learning?courseid=<%=c.getId()%>" class="btn btn--enroll">ENROLL NOW</a>
                <%
                    }
                %>

            </div>
        </div>
    </div>
</div>
<%
        }
    }
%>