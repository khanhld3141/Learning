<%@ page import="java.util.List" %>
<%@ page import="model.Deposit" %>
<%@include file="../Component/header.jsp" %>
<main>
    <div class="main-content">
        <div class="profile-block">
            <%@include file="../Component/sidebar-profile.jsp" %>
            <div class="profile-right">
                <div class="profile-box">
                    <div class="courses-participated">
                        <div class="block-1">
                            <h2 class="profile-right__title">My deposits</h2>
                            <a href="/deposits" class="btn btn__add-new-post-profile"
                               style="background: #0c2e60; width: 150px; margin-bottom: 0">Top up balance</a>
                        </div>
                        <div class="table">
                            <table class="courses-participated-table" id="table-sort">
                                <thead>
                                <tr>
                                    <th onclick="sortTable(0)">ID Deposits</th>
                                    <th onclick="sortTable(1)">Amount of money ($)</th>
                                    <th onclick="sortTable(2)">Status</th>
                                </tr>
                                </thead>
                                <tbody>

                                <%
                                    if (request.getAttribute("deposits") != null) {
                                        List<Deposit> deposits = (List<Deposit>) request.getAttribute("deposits");
                                        for (Deposit deposit : deposits) {
                                %>
                                <tr style="align-items: center">
                                    <td><%=deposit.getId()%></td>
                                    <td>$<%=deposit.getAmountOfMoney()%></td>
<%--                                    <td><%=deposit.getStatus().getName()%></td>--%>
                                    <%
                                        String ms = deposit.getStatus().getName();
                                        if (ms.equals("Cancelled")) { %>
                                            <td style="color: red; font-weight: 500"><%=ms%></td>
                                    <% } else if(ms.equals("Waiting")) { %>
                                            <td style="color: #f2980b; font-weight: 500"><%=ms%></td>
                                    <% } else if(ms.equals("Successful")) { %>
                                             <td style="color: green; font-weight: 500"><%=ms%></td>
                                    <% } %>
                                </tr>
                                <%
                                        }
                                    }
                                %>


                                </tbody>
                                <script src="../assets/js/Sort_table/sort-table.js"></script>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

<%@include file="../Component/footer.jsp" %>