<%--
  Created by IntelliJ IDEA.
  User: rin
  Date: 19/04/2024
  Time: 00:18
  To change this template use File | Settings | File Templates.
--%>

<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@include  file="../Component/header.jsp"%>
<main>

    <div class="contact-section">
        <div class="main-content">
            <div class="row-contact-title">
                <div class="row-contact-title__tagline">CONTACT US</div>
                <h3 class="row-contact-title__title">If You Have Any Query,
                    <br> Drop a Message
                </h3>
            </div>
            <div class="row-contact-box">
                <form>
                    <div class="row-contact__formbox">

                        <div class="row-contact__row50">
                            <div class="row50__input">
                                <span class="row-contact__label">FULL NAME </span>
                                <input type="text" placeholder="FULL NAME">
                            </div>
                            <div class="row50__input">
                                <span class="row-contact__label">LAST NAME </span>
                                <input type="text" placeholder="LAST NAME">
                            </div>
                        </div>
                        <div class="row-contact__row50">
                            <div class="row50__input">
                                <span class="row-contact__label">EMAIL </span>
                                <input type="text" placeholder="EMAIL ADDRESS">
                            </div>
                            <div class="row50__input">
                                <span class="row-contact__label">PHONE NUMBER</span>
                                <input type="text" placeholder="PHONE NUMBER">
                            </div>
                        </div>
                        <div class="row-contact__message">
                            <span class="row-contact__label">YOUR MESSAGE</span>
                            <textarea name="row-contact__message--message" placeholder="YOUR MESSAGE" required style=" padding: 18px; box-sizing: border-box; outline: none; opacity: 0.8; border: 1px solid #e0e4e6; font-family: 'Poppins',sans-serif; font-weight: 450; font-size: 11px; line-height: 1;  min-height: 300px; width:100%;" ></textarea>
                        </div>
                        <div class="row-contact--button">
                            <button class="row-contact__button">
                                <span class="row-contact__button-label">SEND MESSAGE</span>
                            </button>
                        </div>

                    </div>
                </form>
                <div class="row-contact__infobox">
                    <div class="infobox--contact" >
                        <h3 class="infobox--contact__title">Contact Info</h3>
                        <p class="infobox--contact__des" style=" box-sizing: border-box;font-family: 'Poppins',sans-serif;font-weight: 400;color: #999999; line-height: 1.5; padding-bottom: 10px;font-size: 15px;">What we want is to bring the greatest experience to customers!. Remember to contact us to receive the fastest support.</p>
                        <div class="infobox--contact__loc">
                            <h4 class="infobox--contact--title">Location Info</h4>
                            <span class="infobox--contact--text">54 Nguyễn Lương Bằng, Liên Chiểu - Việt Nam</span>

                        </div>
                        <div class="infobox--contact__hot">
                            <h4 class="infobox--contact--title">Hotline Numbers</h4>
                            <a href="tel:+0362733421" >+0362733421</a>
                            </br>
                            <a href="tel:+0344733423" >+0344733423</a>

                        </div>
                        <div class="infobox--contact__email">
                            <h4 class="infobox--contact--title">Email Us</h4>
                            <a href="mailto:customerservice@gmail.com" >customerservice@gmail.com</a>
                            <a href="mailto:help@gmail.com" >help@gmail.com</a>

                        </div>


                    </div>

                </div>
            </div>


        </div>
    </div>
    <div class="location-section">
        <div class="container-map">
            <div class="row-contact-map">
                <div class="row-contact-map-heading">
                    <div class="row-contact-map__label">Location Map</div>
                </div>
                <div class="map-container">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d61342.88852131097!2d108.10561107193911!3d16.069094235075433!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x314218d68dff9545%3A0x714561e9f3a7292c!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBCw6FjaCBLaG9hIC0gxJDhuqFpIGjhu41jIMSQw6AgTuG6tW5n!5e0!3m2!1svi!2s!4v1713176277227!5m2!1svi!2s"
                            style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>

            </div>

        </div>
        <div>

        </div>
    </div>
</main>
<%@include  file="../Component/footer.jsp"%>
