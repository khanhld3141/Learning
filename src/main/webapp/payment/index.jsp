<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp"%>
<main>
    <div class="payment">
        <div class="payment-content">
<%--            <div class="side-bar">--%>
<%--                <div class="course-name-box">--%>
<%--                    <h2>Course's name:</h2>--%>
<%--                    <span class="course-name">HTML CSS Pro</span>--%>
<%--                </div>--%>
<%--                <div class="course-id-box">--%>
<%--                    <h2>Course's ID:</h2>--%>
<%--                    <span class="course-id">F8C1FHP8</span>--%>
<%--                </div>--%>
<%--                <hr class="payment-divider">--%>
<%--                <div class="voucher-input">--%>
<%--                    <form action="" class="voucher-input-typeID">--%>
<%--                        <input type="text" name="" id="" placeholder="Type voucher's ID here">--%>
<%--                        <button class="btn-apply-voucherID"><span>APPLY</span></button>--%>
<%--                    </form>--%>
<%--                </div>--%>
<%--                <div class="payment-detail">--%>
<%--                    <div class="payment-detail-subtitle">--%>
<%--                        <h2>Payment details:</h2>--%>
<%--                    </div>--%>
<%--                    <div class="payment-detail-wrapper">--%>
<%--                        <div class="price-box">--%>
<%--                            <span class="price-desc">Price:</span>--%>
<%--                            <span class="price-detail">1.299.000 vnd</span>--%>
<%--                        </div>--%>
<%--                        <hr class="payment-divider">--%>
<%--                        <div class="price-box price-reduced">--%>
<%--                            <span class="price-desc">Reduced price:</span>--%>
<%--                            <span class="price-detail">0 vnd</span>--%>
<%--                        </div>--%>
<%--                        <hr class="payment-divider">--%>
<%--                        <div class="price-box total-price-box">--%>
<%--                            <span class="price-desc">Total price:</span>--%>
<%--                            <span class="price-detail">1.299.000 vnd</span>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
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
                            <p>Maximum 5 minutes after the transfer time, if the system does not respond, please contact NGB support immediately.</p>
                        </div>
                        <div class="contact-info">
                            <li class="contact-info-item phone"><i class="fa-solid fa-phone"></i><a href="tel:+84396322234">0396322234</a></li>
                            <li class="contact-info-item email"><i class="fa-solid fa-envelope"></i><a href="mailto:giabao7112004@gmail.com">giabao7112004@gmail.com</a></li>
                            <li class="contact-info-item location"><i class="fa-solid fa-location-dot"></i>H4/6 Bui Chat Street, Lien Chieu district, Da Nang city, Vietnam country.</li>
                        </div>
                    </div>
                </div>
                <div class="body-bottom"></div>
            </div>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp"%>
