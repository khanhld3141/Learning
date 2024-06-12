<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <div class="main-content">
        <div class="profile-block">
            <%@include file="../Component/sidebar-profile.jsp" %>
            <div class="profile-right">
                <div class="profile-box">
                    <div class="personal-infor">
                        <h2 class="profile-right__title">Personal information</h2>
                        <div class="profile-right__content">
                            <%
                                if (request.getAttribute("user") != null) {
                                    User user = (User) request.getAttribute("user");
                            %>
                            <div class="change-avt-box">
                                <form class="change-avt__form">
                                    <figure>
                                        <img src="/images/<%=user.getAvatar()%>" alt="" class="personal-infor__avt"
                                             id="personal-infor__avt">
                                    </figure>
                                    <input name="image" id="imageUpload" type="file"
                                           class="btn__profile btn__change-avt">
                                </form>
                            </div>
                            <div class="personal-infor-box">

                                <form action="/my-profile" method="post" class="personal-infor__form">
                                    <div class="name">
                                        <label for="Name"><i class="fa-solid fa-user-tie"></i>Your Name</label>
                                        <input value="<%=user.getName()%>" type="text" id="Name"
                                               placeholder="Enter your name"
                                               name="name" required>
                                    </div>
                                    <span class="error-message" id="nameError"></span>
                                    <div class="email">
                                        <label for="Email"><i class="fa-solid fa-envelope"></i>Your Email</label>
                                        <input readonly value="<%=user.getEmail()%>" type="email" id="Email"
                                               placeholder="Enter your email"
                                               name="email" required>
                                    </div>
                                    <span class="error-message" id="emailError"></span>
                                    <div class="phone">
                                        <label for="Phone"><i class="fa-solid fa-phone"></i>Your Number
                                            Phone</label>
                                        <input value="<%=user.getPhone()%>" type="text" id="Phone"
                                               placeholder="Enter your number phone"
                                               name="phone" required>
                                    </div>
                                    <span class="error-message" id="phoneError"></span>
                                    <button type="submit"
                                            class="btn__profile btn__submit-personal-infor">Update
                                    </button>
                                </form>
                                <script>
                                    $(document).ready(function () {
                                        // Hàm kiểm tra lỗi khi nhập vào trường input
                                        function validateInput() {
                                            var isValid = true;

                                            // Kiểm tra tên
                                            var nameInput = $('#Name').val().trim();
                                            if (!/^[a-zA-ZÀ-Ỹà-ỹ\s]+$/.test(nameInput)) {
                                                $('#nameError').text("Name must contain only letters and cannot be empty.");
                                                isValid = false;
                                            } else {
                                                $('#nameError').text("");
                                            }

                                            var emailInput = $('#Email').val().trim();
                                            if (!isValidEmail(emailInput)) {
                                                $('#emailError').text("Please enter a valid email address.");
                                                isValid = false;
                                            } else {
                                                $('#emailError').text("");
                                            }

                                            var phoneInput = $('#Phone').val().trim();
                                            if (!/^(0\d{9})$/.test(phoneInput)) {
                                                $('#phoneError').text("Phone number must start with 0 and contain exactly 10 digits.");
                                                isValid = false;
                                            } else {
                                                $('#phoneError').text("");
                                            }

                                            return isValid;
                                        }

                                        // Sự kiện input để kiểm tra lỗi khi nhập vào trường input
                                        $('#Name, #Email, #Phone').on('input', function () {
                                            validateInput();
                                        });

                                        // Hàm kiểm tra định dạng email
                                        function isValidEmail(email) {
                                            var emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                                            return emailPattern.test(email);
                                        }

                                        // Sự kiện submit để kiểm tra lại trước khi submit
                                        $('.personal-infor__form').submit(function (event) {
                                            if (!validateInput()) {
                                                event.preventDefault();
                                            }
                                        });
                                    });
                                </script>


                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        $('#imageUpload').change(function () {
            var formData = new FormData();
            formData.append('image', $('#imageUpload')[0].files[0]);
            $.ajax({
                url: '/upload-user-image',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,

                success: function (response) {
                    location.reload();
                }
            });
        });
    });
</script>
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

    window.addEventListener('pageshow', function (event) {
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