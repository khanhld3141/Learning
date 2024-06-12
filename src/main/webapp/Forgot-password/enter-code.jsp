<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../Component/header.jsp" %>
<main>
    <link rel="stylesheet" href="../assets/css/forgot-password/enter-code.css">
    <div class="main-content">
        <div class="form-enter-code">
            <form class="form" action="/confirm-code" method="post">
                <div class="title">OTP</div>
                <div class="title">Verification Code</div>
                <p class="message">We have sent a verification code to your email</p>
                <div class="inputs">
                    <input name="code[]" id="input1" type="text" maxlength="1" oninput="moveToNext(this, 'input2')" onkeydown="moveToPrevious(event, this, 'input1', 'input2')" required>
                    <input name="code[]" id="input2" type="text" maxlength="1" oninput="moveToNext(this, 'input3')" onkeydown="moveToPrevious(event, this, 'input1', 'input3')" required>
                    <input name="code[]" id="input3" type="text" maxlength="1" oninput="moveToNext(this, 'input4')" onkeydown="moveToPrevious(event, this, 'input2', 'input4')" required>
                    <input name="code[]" id="input4" type="text" maxlength="1" oninput="moveToNext(this, 'input5')" onkeydown="moveToPrevious(event, this, 'input3', 'input5')" required>
                    <input name="code[]" id="input5" type="text" maxlength="1" oninput="moveToNext(this, 'input6')" onkeydown="moveToPrevious(event, this, 'input4', 'input6')" required>
                    <input name="code[]" id="input6" type="text" maxlength="1" oninput="moveToNext(this, '')" onkeydown="moveToPrevious(event, this, 'input5', 'input6')" required>
                </div>
                <button class="action" type="submit">Confirm</button>
            </form>

            <script>
                function moveToNext(current, nextFieldID) {
                    if (current.value.length >= current.maxLength) {
                        if (nextFieldID !== '') {
                            document.getElementById(nextFieldID).focus();
                        }
                    }
                }

                function moveToPrevious(event, current, previousFieldID, currentFieldID) {
                    if (event.key === 'Backspace' && current.value.length === 0) {
                        if (previousFieldID !== currentFieldID) {
                            document.getElementById(previousFieldID).focus();
                        }
                    }
                }

                document.querySelectorAll('.inputs input').forEach((input, index, inputs) => {
                    input.addEventListener('paste', (event) => {
                        const paste = (event.clipboardData || window.clipboardData).getData('text');
                        const pasteArray = paste.split('');
                        if (pasteArray.length === inputs.length) {
                            inputs.forEach((input, index) => {
                                input.value = pasteArray[index] || '';
                                if (index < inputs.length - 1) {
                                    inputs[index + 1].focus();
                                }
                            });
                            event.preventDefault();
                        }
                    });
                });
            </script>
        </div>
    </div>
</main>
<%@include file="../Component/footer.jsp" %>
