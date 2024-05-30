<%@ page import="java.util.List" %>
<%@ page import="java.io.Writer" %>
<%@ page import="controller.Ulti.CommentUtils" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<!-- main -->
<main>
    <link rel="stylesheet" href="../assets/css/dashboard-user/add-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-chapter/manage-chapter.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/update-user.css">
    <link rel="stylesheet" href="../assets/css/dashboard-user/manage-user.css">
    <!-- feature header -->
    <div class="feature-header">
        <div class="main-content">
            <div class="feature-header__text-center">
                <h1 class="title feature-header__title">Post Details</h1>
                <div class="feature-header__link">
                    <a href="/home" class="home">Home</a>
                    <span>/</span>
                    <a href="" class="blog-details">Post Details</a>
                </div>
            </div>
        </div>
    </div>
    <div class="blog-details">
        <div class="main-content">
            <div class="blog-details__content">
                <!-- BLOG-DETAILS LEFT -->
                <div class="blog-details__left">
                    <%
                        if (request.getAttribute("post") != null) {
                            Post post = (Post) request.getAttribute("post");
                    %>
                    <div class="blog-details__single-post">
                        <figure class="single-post__img">
                            <img src="/images/<%=post.getImage()%>" alt="picture post">
                        </figure>
                        <div class=" single-post__content">
                            <div class="single-post__meta-tags">
                                <a href="" class="post-meta"><i
                                        class="fa-regular fa-clock"></i><%=post.getCreatedAt().getDate()%>
                                    / <%=post.getCreatedAt().getMonth()%> / <%=post.getCreatedAt().getYear() + 1900%>
                                </a>
                                <a href=""
                                   class="post-meta"><i class="fa-regular fa-user"></i><%=post.getAuthor().getName()%></a>
<%--                                <a href="" class="post-meta"><i class="fa-solid fa-cube"></i>Women Fashion</a>--%>
                                <a href="#comments" class="post-meta"><i
                                        class="fa-regular fa-comment"></i><%=post.getComments().size()%>
                                </a>
                            </div>
                            <h3><%=post.getTitle()%>
                            </h3>
                            <%=post.getContent()%>
                        </div>
                        <div class="hashtag">
                            <%
                                List<Hashtag> hashtags=post.getHashtags();
                                for(Hashtag tag : hashtags){
                            %>
                            <a href="/blogs?hashtag=<%=tag.getTag()%>" class="hashtag-button">#<%=tag.getTag()%></a>
                            <%
                                }
                            %>
                        </div>
                        <!--  comment-->
                        <div id="comments" class="comment">
                            <h3 class="title">Comments</h3>
                            <div>
                                <%@include file="../Component/comment_item.jsp" %>
                            </div>
                        </div>
                        <!-- form comment -->
                        <div class="comment-form">
                            <h4 class="comment-title">Leave a comment</h4>
                            <form action="/comment-blog" method="post">
                                <textarea id="comment" placeholder="Write Comments" name="comment"></textarea>
                                <input hidden="hidden" name="postid" id="idcourse" value="<%=post.getId()%>">
                                <button id="btnComment" class="btn submit-comment__btn">SUBMIT</button>
                            </form>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
                <!-- BLOG DETAILS RIGHT -->
                <div class="blog-details__right">
                    <!-- list categories -->
                    <div class="widget list-categories">
                        <h3 class="widget__title list-categories__title">Categories</h3>
                        <ul>
                            <%
                                if (request.getAttribute("categories") != null) {
                                    List<Category> categories = (List<Category>) request.getAttribute("categories");
                                    for (Category category : categories) {
                            %>
                            <li><a href="/courses?category=<%=category.getId()%>"><%=category.getName()%> <span>(<%=category.getTotalCourse()%>)</span></a>
                            </li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div>
                    <!-- recent-posts -->
                    <div class="widget recent-posts">
                        <h3 class="widget__title">recent posts</h3>
                        <ul>
                            <%
                                if(request.getAttribute("posts")!=null) {

                            %>
                            <%@include file="../Component/recent-posts__item.jsp" %>
                            <%
                                }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/toastify-js"></script>
<script type="text/javascript">
    function showToast(message, type) {
        let backgroundColor, className;
        if (type === "1") {
            backgroundColor = "linear-gradient(to right, #00b09b, #96c93d)";
            className = "success"
        } else if (type === "0") {
            backgroundColor = "linear-gradient(to right, #ff5f6d, #ffc371)";
            className = "error"
        }

        Toastify({
            text: message,
            duration: 3000,
            close: true,
            gravity: "bottom",
            position: "right",
            backgroundColor: backgroundColor,
            stopOnFocus: true,
            className: className,

        }).showToast();
    }
    window.addEventListener('pageshow', function(event) {
        if (event.persisted) {
            window.location.reload();
        }
    });
    <%
        if (session.getAttribute("success")!=null) {
    %>
    showToast("<%= session.getAttribute("success") %>", "1");
    <%
    session.setAttribute("success",null);
      }
    %>

    <%

      if (session.getAttribute("error")!=null) {
  %>
    showToast("<%= session.getAttribute("error") %>", "0");
    <%
    session.setAttribute("error",null);
      }
    %>
</script>
<%@include file="../Component/footer.jsp" %>