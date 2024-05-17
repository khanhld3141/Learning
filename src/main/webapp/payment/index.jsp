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
<%@include file="../Component/footer.jsp" %>
