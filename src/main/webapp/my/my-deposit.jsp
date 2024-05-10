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
                                    <th onclick="sortTable(1)">Name user</th>
                                    <th onclick="sortTable(2)">Amount of money ($)</th>
                                    <th onclick="sortTable(3)">Status</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr style="align-items: center">
                                    <td>1</td>
                                    <td>Dang Khanh</td>
                                    <td>200</td>
                                    <td>Success</td>
                                </tr>
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