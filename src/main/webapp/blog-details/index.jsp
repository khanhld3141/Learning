<%@ page import="java.util.List" %>
<%@ page import="java.io.Writer" %>
<%@ page import="controller.Ulti.CommentUtils" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="model.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<!-- main -->
<main>
    <!-- feature header -->
    <div class="feature-header">
        <div class="main-content">
            <div class="feature-header__text-center">
                <h1 class="title feature-header__title">Blog Details</h1>
                <div class="feature-header__link">
                    <a href="/home" class="home">Home</a>
                    <span>/</span>
                    <a href="" class="blog-details">Blog Details</a>
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
                            <button><%=tag.getTag()%></button>

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
                            <%
                                List<PostComment> comments = post.getComments();
                                PrintWriter out1 = response.getWriter();  // Get the JSP output writer
                                CommentUtils.displayComments(comments, 0, 0, out1);
                            %>
                        </div>
                        <!-- form comment -->
                        <div class="comment-form">
                            <h4 class="comment-title">Leave a comment</h4>
                            <form action="#">
                                <textarea placeholder="Write Comments"></textarea>
                                <button class="btn submit-comment__btn">SUBMIT</button>
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
                            <li><a href="#"><%=category.getName()%> <span>(<%=category.getTotalCourse()%>)</span></a>
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
<%@include file="../Component/footer.jsp" %>