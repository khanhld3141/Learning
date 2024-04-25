<%@ page import="model.Voucher" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/sidebar__dashboard.jsp"%>
<div class="content-admin">
    <div class="manage-voucher">
        <div class="manage-voucher-title manage-block">
            <h1 class="manage-voucher__title title">Update Voucher</h1>
        </div>
        <div class="update-voucher update-block">
            <form action="/dashboard/update-voucher" method="post" class="update-voucher__form update-form">
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
                    </div>
                    <div class="start-end-day">
                        <div class="start-day">
                            <label for="Start-day">Start day</label>
                            <input value="<%=v.getStartDay()%>" type="datetime-local" name="Startday" id="Start-day"
                                   placeholder="Enter start day" required>
                        </div>
                        <div class="end-day">
                            <label for="End-day">End day</label>
                            <input type="datetime-local" value="<%=v.getEndDay()%>" name="Endday" id="End-day"
                                   placeholder="Enter end day"
                                   required>
                        </div>
                    </div>
                    <div class="quantity-used-discount">
                        <div class="quantity">
                            <label for="Quantity">Quantity</label>
                            <input type="number" value="<%=v.getQuantity()%>" name="Quantity" id="Quantity"
                                   placeholder="Enter quantity voucher"
                                   required>
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
        </div>
    </div>
</div>
</body>
</html>