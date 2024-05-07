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
                <img src="../img/side-bar-admin/user_img.jpg" alt="" class="avatar-admin">
            </figure>
            <span class="name-admin">John David<i class="fa-solid fa-chevron-down"></i></span>
            <div class="sub-menu display-none">
                <ul>
                    <li>
                        <a href="../my">My profile</a>
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
<div class="content-admin">

</div>
</body>
</html>