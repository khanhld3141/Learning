<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (request.getAttribute("courses") != null) {

%>
<c:forEach var="course" items="${courses}">
    <div class="item__card-courses">
        <div class="card-courses" id="card-courses">
            <div class="card-courses__thumb">
                <a href="/detail-course?id=${course.id}" > <img src="/images/${course.image}" alt="" class="card-courses__img"></a>
                <p class="price__courses">${course.price}$</p>
            </div>

            <div class="card-courses__content">
                <a href="/detail-course?id=${course.id}" class="card-courses__heading">${course.name}</a>
                <h3 class="card-courses__desc">${course.introduce}</h3>
                <div class="card-courses__enroll">
                    <div class="enroll__left">
                        <p class="total-student"><i class="fa-regular fa-user"></i>${course.students.size()}
                            Students</p>
                        <div class="total-star">
                            <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                            <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                            <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                            <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                            <i class="fa-regular fa-star" style="color: #FFD43B;"></i>
                        </div>
                    </div>
                    <a href="/learning?courseid=${course.id}" class="btn btn--enroll">ENROLL NOW</a>
                </div>
            </div>
        </div>
    </div>
</c:forEach>
<%
    }
%>