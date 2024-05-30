<%@ page import="model.Voucher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp"%>
<div class="content-admin">
    <div class="manage-voucher">
        <div class="manage-voucher-title manage-block">
            <h1 class="manage-voucher__title title">Update Voucher</h1>
        </div>
        <div class="update-voucher update-block">
            <form action="/dashboard/update-voucher" method="post" class="update-voucher__form update-form" id="updateVoucherForm">
                <%
                    if(request.getAttribute("voucher")!=null){
                        Voucher v=(Voucher)request.getAttribute("voucher");
                        System.out.println(v.getStartDay());
                        System.out.println(v.getEndDay());
                %>
                <div class="update-form__content">
                    <input name="Id" hidden="hidden" value="<%=v.getId()%>"/>
                    <div class="code">
                        <label for="Code">Code</label>
                        <input value="<%=v.getCode()%>" type="text" name="Code" id="Code" placeholder="Enter code" required>
                        <span class="error-message" id="codeError"></span>
                    </div>
                    <div class="start-end-day">
                        <div class="start-day">
                            <label for="Start-day">Start day</label>
                            <input value="<%=v.getStartDay()%>" type="datetime-local" name="Startday" id="Start-day"
                                   placeholder="Enter start day" required>
                            <span class="error-message" id="startDayError"></span>
                        </div>
                        <div class="end-day">
                            <label for="End-day">End day</label>
                            <input type="datetime-local" value="<%=v.getEndDay()%>" name="Endday" id="End-day"
                                   placeholder="Enter end day"
                                   required>
                            <span class="error-message" id="endDayError"></span>
                        </div>
                    </div>
                    <div class="quantity-used-discount">
                        <div class="quantity">
                            <label for="Quantity">Quantity</label>
                            <input type="number" value="<%=v.getQuantity()%>" name="Quantity" id="Quantity"
                                   placeholder="Enter quantity voucher"
                                   required>
                            <span class="error-message" id="quantityError"></span>
                        </div>
                        <div class="used">
                            <label for="Used">Used</label>
                            <input type="number" value="<%=v.getUsed()%>" readonly name="Used" id="Used"
                                   placeholder="Enter quantity used voucher"
                                   required>
                        </div>
                        <div class="used">
                            <label for="Used1">Discount</label>
                            <input type="number" value="<%=v.getDiscount()%>" name="Discount" id="Used1"
                                   placeholder="Enter discount voucher"
                                   required>
                            <span class="error-message" id="discountError"></span>
                        </div>
                    </div>
                    <div class="submit">
                        <input type="submit" value="Confirm">
                        <a href="/dashboard/vouchers" class="btn__back">Back</a>
                    </div>
                </div>
                <%
                    }
                %>
            </form>
            <script>
                document.addEventListener('DOMContentLoaded', function() {
                    const form = document.getElementById('updateVoucherForm');

                    const codeInput = document.getElementById('Code');
                    const startDayInput = document.getElementById('Start-day');
                    const endDayInput = document.getElementById('End-day');
                    const quantityInput = document.getElementById('Quantity');
                    const discountInput = document.getElementById('Used1');

                    // Validate on input and change events
                    codeInput.addEventListener('input', function() {
                        validateCode(codeInput);
                    });

                    startDayInput.addEventListener('change', function() {
                        validateDate(startDayInput, endDayInput);
                    });

                    endDayInput.addEventListener('change', function() {
                        validateDate(startDayInput, endDayInput);
                    });

                    quantityInput.addEventListener('input', function() {
                        validateQuantity(quantityInput);
                    });

                    discountInput.addEventListener('input', function() {
                        validateDiscount(discountInput);
                    });

                    form.addEventListener('submit', function(event) {
                        let isValid = true;

                        if (!validateCode(codeInput)) {
                            isValid = false;
                        }

                        if (!validateDate(startDayInput, endDayInput)) {
                            isValid = false;
                        }

                        if (!validateQuantity(quantityInput)) {
                            isValid = false;
                        }

                        if (!validateDiscount(discountInput)) {
                            isValid = false;
                        }

                        if (!isValid) {
                            event.preventDefault();
                            console.log('Form submission prevented due to validation errors.');
                        }
                    });

                    function validateCode(input) {
                        const value = input.value;
                        const errorElement = document.getElementById('codeError');

                        if (value === '') {
                            errorElement.textContent = "Code cannot be empty.";
                            return false;
                        } else if (/\s/.test(value)) {
                            errorElement.textContent = "Code cannot contain whitespace characters.";
                            return false;
                        } else {
                            errorElement.textContent = "";
                            return true;
                        }
                    }

                    function validateDate(startInput, endInput) {
                        const startDate = new Date(startInput.value);
                        const endDate = new Date(endInput.value);
                        const currentDate = new Date();
                        const startErrorElement = document.getElementById('startDayError');
                        const endErrorElement = document.getElementById('endDayError');

                        if (startDate <= currentDate) {
                            startErrorElement.textContent = "Start day must be in the future.";
                            return false;
                        } else if (endDate <= startDate) {
                            startErrorElement.textContent = "";
                            endErrorElement.textContent = "End day must be later than start day.";
                            return false;
                        } else {
                            startErrorElement.textContent = "";
                            endErrorElement.textContent = "";
                            return true;
                        }
                    }

                    function validateQuantity(input) {
                        const value = parseInt(input.value);
                        const errorElement = document.getElementById('quantityError');

                        if (isNaN(value) || value <= 0) {
                            errorElement.textContent = "Quantity must be a positive number greater than 0.";
                            return false;
                        } else {
                            errorElement.textContent = "";
                            return true;
                        }
                    }

                    function validateDiscount(input) {
                        const value = parseFloat(input.value);
                        const errorElement = document.getElementById('discountError');

                        if (isNaN(value) || value <= 0) {
                            errorElement.textContent = "Discount must be a positive number.";
                            return false;
                        } else {
                            errorElement.textContent = "";
                            return true;
                        }
                    }
                });

            </script>
        </div>
    </div>
</div>
</body>
</html>