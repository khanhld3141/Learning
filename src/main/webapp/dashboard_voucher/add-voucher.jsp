<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp"%>
<div class="content-admin">
    <div class="manage-voucher">
        <div class="manage-voucher-title manage-block">
            <h1 class="manage-voucher__title title">Add New Voucher</h1>
        </div>
        <div class="add-voucher add-block">
            <form class="add-voucher__form add-form">
                <div class="add-form__content">
                    <div class="code">
                        <label for="Code">Code</label>
                        <input type="text" name="Code" id="Code" placeholder="Enter code">
                    </div>
                    <div class="start-end-day">
                        <div class="start-day">
                            <label for="Start-day">Start day</label>
                            <input type="date" name="Start-day" id="Start-day" placeholder="Enter start day">
                        </div>
                        <div class="end-day">
                            <label for="End-day">End day</label>
                            <input type="date" name="End-day" id="End-day" placeholder="Enter end day">
                        </div>
                    </div>
                    <div class="quantity-used-discount">
                        <div class="quantity">
                            <label for="Quantity">Quantity</label>
                            <input type="number" name="Quantity" id="Quantity" placeholder="Enter quantity voucher">
                        </div>
                        <div class="used">
                            <label for="Used">Used</label>
                            <input type="number" name="Used" id="Used" placeholder="Enter used voucher">
                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="../dashboard_voucher" class="btn__back">Back</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>