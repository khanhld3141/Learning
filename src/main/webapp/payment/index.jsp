<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <div class="payment">
        <div class="payment-content">
            <div class="body">
                <div class="body-middle">
                    <div class="bank-qr">
                        <h1>Make payment by QR code</h1>
                        <div class="bank-qr-detail">
                            <div class="qr-code">
                                <img src="../img/payment-img/qr_code_samp.jpeg" alt="QR CODE">
                            </div>
                            <div class="instruction">
                                <li>Step 1: Open the banking app and scan the QR code.</li>
                                <li>Step 2: Make sure the transfer content is RECHARGE.</li>
                                <li>Step 3: Make payment.</li>
                            </div>
                        </div>
                    </div>
                    <div class="bank-manual">
                        <h1>Manual transfer</h1>
                        <div class="bank-manual-detail">
                            <li class="bank-manual-box">
                                <div class="box-label">Account number</div>
                                <div class="box-content">1111111111</div>
                            </li>
                            <li class="bank-manual-box">
                                <div class="box-label">Account name</div>
                                <div class="box-content">NGUYEN GIA BAO</div>
                            </li>
                            <li class="bank-manual-box">
                                <div class="box-label">Account content</div>
                                <div class="box-content"><span class="course-id">RECHARGE</span></div>
                            </li>
                            <li class="bank-manual-box">
                                <div class="box-label">Branch</div>
                                <div class="box-content">BIDV</div>
                            </li>
                        </div>
                    </div>
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
                    <div class="enter-money">
                        <form action="/vnpayajax" method="post">
                            <div class="form-payment-block">
                                <input name="amount" class="money-input" type="number"
                                       placeholder="Enter amount of money">
                                <button type="submit" class="btn" style="max-width: 20%; margin-bottom: 0">Confirm payment</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>
