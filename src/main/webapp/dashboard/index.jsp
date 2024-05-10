<%@ page import="java.util.List" %>
<%@ page import="model.Category" %>
<%@ page import="com.oracle.wls.shaded.org.apache.xpath.operations.String" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.Comparator" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp"%>

<% if (session.getAttribute("user") != null) { %>
<div class="header-dashboard-overview">
    <figure>
        <a href="/home"><img src="../img/icons8-education-100.png" alt="" class="header-sidebar__logo"></a>
    </figure>
    <div class="avatar-profile-notification">
        <div class="notification">
            <ul>
                <li>
                    <a href="#!"><i class="fa-solid fa-bell"></i></a>
                </li>
                <li>
                    <a href="#!"><i class="fa-solid fa-circle-question"></i></a>
                </li>
                <li>
                    <a href="#!"><i class="fa-solid fa-envelope"></i></a>
                </li>
            </ul>
        </div>
        <div class="avatar-profile">
            <figure>
                <img src="/images/${sessionScope.user.avatar}" alt="" class="avatar-admin">
            </figure>
            <span class="name-admin">${sessionScope.user.name}<i class="fa-solid fa-chevron-down"></i></span>
            <div class="sub-menu display-none">
                <ul>
                    <li>
                        <a href="/my-profile">My profile</a>
                    </li>
                    <li>
                        <a href="#!">Help</a>
                    </li>
                    <li>
                        <a href="/logout">Log out <i class="fa-solid fa-right-from-bracket"></i></a>
                    </li>
                </ul>
            </div>
            <script>
                var avatarProfiles = document.querySelectorAll('.avatar-profile');

                avatarProfiles.forEach(function (avatarProfile) {
                    avatarProfile.addEventListener('click', function () {
                        var subMenu = this.querySelector('.sub-menu');

                        if (subMenu.classList.contains('display-none')) {
                            subMenu.classList.remove('display-none');
                        } else {
                            subMenu.classList.add('display-none');
                        }
                    });
                });
            </script>
        </div>
    </div>
</div>
<% } %>
<div class="content-admin-dashboard-overview">
    <div class="page-title-block">
        <div class="page-title">
            <h2>Dashboard</h2>
        </div>
    </div>
    <div class="list-statistics">
        <div class="statistics-1">
            <div class="card">
                <figure><i class="fa-solid fa-user"></i></figure>
                <div class="infor-card">
                    <div class="total">2500</div>
                    <div class="title-card">Welcome</div>
                </div>
            </div>
            <div class="card">
                <figure><i class="fa-regular fa-clock"></i></figure>
               <%
                if(request.getAttribute("categories") != null){
                    List<Category> categories=(List<Category>)request.getAttribute("categories");
               %>
                <div class="infor-card">
                    <div class="total"><%=categories.size()%></div>
                    <div class="title-card">Category</div>
                </div>
                <%
                    }
                %>
            </div>
            <div class="card">
                <figure><i class="fa-solid fa-cloud"></i></figure>
                <div class="infor-card">
                    <div class="total">100+</div>
                    <div class="title-card">Courses</div>
                </div>
            </div>
            <div class="card">
                <figure><i class="fa-brands fa-blogger"></i></figure>
                <div class="infor-card">
                    <div class="total">200+</div>
                    <div class="title-card">Posts</div>
                </div>
            </div>
        </div>
        <div class="statistics-2">
            <div class="list-student-block block-title">
                <h2>New Student List</h2>
            </div>
            <div class="table-list-student-block">
                <table class="table-list-student">
                    <thead>
                    <tr>
                        <th>No.</th>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Username</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td>01</td>
                        <td>2</td>
                        <td>Dang Khanh</td>
                        <td>dangkhanh@gmail.com</td>
                        <td>02942942423</td>
                        <td>dangkhanh2004</td>
                    </tr>
                    <tr>
                        <td>02</td>
                        <td>4</td>
                        <td>Tran Nam</td>
                        <td>dangkhanh@gmail.com</td>
                        <td>02942942423</td>
                        <td>dangkhanh2004</td>
                    </tr>
                    <tr>
                        <td>03</td>
                        <td>3</td>
                        <td>Nguyen An</td>
                        <td>dangkhanh@gmail.com</td>
                        <td>02942942423</td>
                        <td>dangkhanh2004</td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="statistics-3">
            <div class="chart-1-title block-title">
                <h2>User chart</h2>
            </div>
            <div class="chart-1-block">
                <canvas id="myChart-user" style="width:100%"></canvas>

                <script>
                    const xValues1 = ['January', 'February', 'March', 'April', 'May', 'Jun', 'July', 'August', 'September', 'October', 'November', 'December'];

                    new Chart("myChart-user", {
                        type: "line",
                        data: {
                            labels: xValues1,
                            datasets: [{
                                label: 'Total access times',
                                data: [860, 1140, 1060, 1060, 1070, 1110, 1330, 2210, 7830, 2478, 2412, 5262],
                                borderColor: "red",
                                fill: false
                            }, {
                                label: 'Number of new user',
                                data: [1600, 1700, 1700, 1900, 2000, 2700, 4000, 5000, 6000, 7000, 1252, 6431],
                                borderColor: "green",
                                fill: false
                            }]
                        },
                        options: {
                            legend: { display: true },
                            title: {
                                display: true,
                                text: "Statistics chart of traffic and new subscribers"
                            }
                        }
                    });
                </script>
            </div>
        </div>
        <div class="statistics-4">
            <div class="chart-1-title block-title">
                <h2>Courses and category chart</h2>
            </div>
            <%
                if(request.getAttribute("categories") != null){
                    List<Category> categories =(List<Category>) request.getAttribute("categories");
                    categories.sort(Comparator.comparingInt(Category::getTotalCourse).reversed());
                    List<java.lang.String> courseNames = new ArrayList<>();
                    List<Integer> courseCounts = new ArrayList<>();
                    int count = 0;
                    int totalOther = 0;
                    for (Category category : categories) {
                        if (count >= 4) {
                            totalOther+=category.getTotalCourse();
                        }else{
                            courseNames.add(category.getName());
                            courseCounts.add(category.getTotalCourse());

                        }

                        count++;
                    }
                    courseNames.add("Others");
                    courseCounts.add(totalOther);
            %>
            <div class="chart-1-block">
                <canvas id="courses-chart" style="max-width: 500px;"></canvas>
                <script>

                    var xValues = <%= new Gson().toJson(courseNames) %>;
                    var yValues = <%= new Gson().toJson(courseCounts) %>;
                    var barColors = [
                        "#ff9800",
                        "#2196f3",
                        "#ff5722",
                        "#e8c3b9",
                        "#1e7145"
                    ];

                    new Chart("courses-chart", {
                        type: "pie",
                        data: {
                            labels: xValues,
                            datasets: [{
                                backgroundColor: barColors,
                                data: yValues
                            }]
                        },
                        options: {
                            title: {
                                display: true,
                                text: "Category and course statistics chart"
                            }
                        }
                    });
                </script>
            </div>
            <%
                }
            %>
        </div>
        <div class="statistics-5">
            <div class="chart-1-title block-title">
                <h2>Revenue chart ($)</h2>
            </div>
            <div class="chart-1-block">
                <canvas id="revenueChart" style="width:100%"></canvas>

                <script>
                    var xValues2 = ['January', 'February', 'March', 'April', 'May', 'Jun', 'July', 'August',
                        'September', 'October', 'November', 'December'];
                    var yValues2 = [535, 449, 434, 242, 152, 124, 120, 264, 1240, 523, 123, 452];
                    var barColors2 = [
                        "#E74C3C",
                        "#2ECC71",
                        "#3498DB",
                        "#F39C12",
                        "#8E44AD",
                        "#C0392B",
                        "#27AE60",
                        "#2980B9",
                        "#E67E22",
                        "#9B59B6",
                        "#D35400",
                        "#16A085"
                    ];

                    new Chart("revenueChart", {
                        type: "bar",
                        data: {
                            labels: xValues2,
                            datasets: [{
                                backgroundColor: barColors2,
                                data: yValues2
                            }]
                        },
                        options: {
                            legend: { display: false },
                            title: {
                                display: true,
                                text: "Revenue chart"
                            }
                        }
                    });
                </script>
            </div>
        </div>
    </div>

</div>
</body>
</html>