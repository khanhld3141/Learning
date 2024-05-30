<%@ page import="java.util.List" %>
<%@ page import="model.Post" %>
<%@ page import="model.Course" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <div class="main-content">
        <div class="profile-block">
            <%@include file="../Component/sidebar-profile.jsp" %>
            <div class="profile-right">
                <div class="profile-box">
                    <div class="courses-participated">
                        <h2 class="profile-right__title">My courses</h2>
                        <div class="table">
                            <table class="courses-participated-table" id="table-sort">
                                <thead>
                                <tr>
                                    <th onclick="sortTable(0)">ID Course</th>
                                    <th onclick="sortTable(1)">Name course</th>
                                    <th onclick="sortTable(2)">Category</th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    if (request.getAttribute("courses") != null) {
                                        List<Course> courses = (List<Course>) request.getAttribute("courses");
                                        for (Course c : courses) {

                                %>
                                <tr style="align-items: center" onclick="redirectToAnchor(this)">
                                    <%-- bỏ link của mỗi bài viết ở thẻ a dưới đây (nằm trong thẻ td chứa id) là được--%>
                                    <td><a href="/learning?courseid=<%=c.getId()%>"><%=c.getId()%>
                                    </a></td>
                                    <td><%=c.getName()%>
                                    </td>
                                    <td>
                                        <img style="width: 100px;height: 40px ;object-fit: cover; border-radius: 4px" src="/images/<%=c.getImage()%>">
                                    </td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                                </tbody>
                                <script>
                                    function redirectToAnchor(row) {
                                        var anchor = row.querySelector('a');
                                        if (anchor) {
                                            window.location.href = anchor.href;
                                        }
                                    }
                                </script>
                                <script src="../assets/js/Sort_table/sort-table.js"></script>
                            </table>
                        </div>
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