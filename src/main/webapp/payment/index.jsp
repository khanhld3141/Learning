<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <div class="payment">
        <div class="payment-content">
            <div class="body">
                <div class="body-middle">


                    <div class="attention">
                        <h1>Attention</h1>
                        <div class="attention-content">
                            <p>Maximum 5 minutes after the transfer time, if the system does not respond, please contact
                                NGB support immediately.</p>
                        </div>
                        <div class="contact-info">
                            <li class="contact-info-item phone"><i class="fa-solid fa-phone"></i><a
                                    href="tel:+84396322234">0396322234</a></li>
                            <li class="contact-info-item email"><i class="fa-solid fa-envelope"></i><a
                                    href="mailto:giabao7112004@gmail.com">giabao7112004@gmail.com</a></li>
                            <li class="contact-info-item location"><i class="fa-solid fa-location-dot"></i>H4/6 Bui Chat
                                Street, Lien Chieu district, Da Nang city, Vietnam country.
                            </li>
                        </div>
                    </div>
                    <div class="payment-detail">
                        <h1 class="payment-detail-title">
                            Payment guide
                        </h1>
                        <div class="enter-money">
                            <div class="tutorial">
                                <ul>
                                    <li>Step 1: Enter amount of money</li>
                                    <li>Step 2: Read the "Attention" section below</li>
                                    <li>Step 3: Click on the "CONFIRM PAYMENT" button </li>
                                </ul>
                            </div>
                            <form action="/vnpayajax" method="post" style="flex-basis: 50%">
                                <div class="form-payment-block">
                                    <input name="amount" class="money-input" type="number"
                                           placeholder="Enter amount of money">
                                    <button type="submit" class="btn" style="max-width: 40%; margin-bottom: 0; padding: 14px">Confirm payment</button>
                                </div>
                            </form>
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
