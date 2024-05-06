<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:forEach var="post" items="${posts}">
    <li>
        <a href="#">
            <img src="./images/${post.image}" alt="img-posts">
            <div class="posts__infor">
                <h5>${post.title}</h5>
                <span class="posts__cate">CREATIVE</span>
                <span>|</span>
                <span class="posts__date">
                    ${post.createdAt.date}/ ${post.createdAt.month} / ${post.createdAt.year+1900}
                </span>
            </div>
        </a>
    </li>

</c:forEach>
