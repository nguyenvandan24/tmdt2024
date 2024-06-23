document.addEventListener('DOMContentLoaded', function() {
    const fullnameInput = document.getElementById('fullname');
    const usernameInput = document.getElementById('username');
    const emailInput = document.getElementById('email');
    const phoneInput = document.getElementById('phone');
    const addressInput = document.getElementById('address');
    const passwordInput = document.getElementById('password');
    const repasswordInput = document.getElementById('repassword');

    fullnameInput.addEventListener('input', validateFullname);
    usernameInput.addEventListener('input', validateUsername);
    emailInput.addEventListener('input', validateEmail);
    phoneInput.addEventListener('input', validatePhone);
    addressInput.addEventListener('input', validateAddress);
    passwordInput.addEventListener('input', validatePassword);
    repasswordInput.addEventListener('input', validateRepassword);

    function validateFullname() {
        const fullnameError = document.getElementById('fullnameError');
        if (fullnameInput.value.trim() === '') {
            fullnameError.textContent = 'Full Name is required.';
        } else {
            fullnameError.textContent = '';
        }
    }

    function validateUsername() {
        const usernameError = document.getElementById('usernameError');
        if (usernameInput.value.trim() === '') {
            usernameError.textContent = 'Username is required.';
        } else {
            usernameError.textContent = '';
        }
    }

    function validateEmail() {
        const emailError = document.getElementById('emailError');
        const emailPattern = /^(.+)@(.+)$/;
        if (!emailPattern.test(emailInput.value)) {
            emailError.textContent = 'Invalid email format.';
        } else {
            emailError.textContent = '';
        }
    }

    function validatePhone() {
        const phoneError = document.getElementById('phoneError');
        const phoneValue = phoneInput.value.trim();
        const phonePattern = /^\d{10}$/;

        if (phoneValue === '') {
            phoneError.textContent = 'Phone number cannot be empty.';
        } else if (!/^\d+$/.test(phoneValue)) {
            phoneError.textContent = 'Phone number must not contain letters or spaces.';
        } else if (phoneValue.length !== 10) {
            phoneError.textContent = 'Phone number must be exactly 10 digits.';
        } else {
            phoneError.textContent = '';
        }
    }

    function validateAddress() {
        const addressError = document.getElementById('addressError');
        if (addressInput.value.trim() === '') {
            addressError.textContent = 'Address is required.';
        } else {
            addressError.textContent = '';
        }
    }

    function validatePassword() {
        const passwordError = document.getElementById('passwordError');
        const passwordValue = passwordInput.value.trim();
        const minLength = 8;
        const digitPattern = /[0-9]/;
        const specialCharPattern = /[!@#$%^&*(),.?":{}|<>]/;

        if (passwordValue === '') {
            passwordError.textContent = 'Password is required.';
        } else if (passwordValue.length < minLength) {
            passwordError.textContent = 'Password must be at least 8 characters long.';
        } else if (!digitPattern.test(passwordValue)) {
            passwordError.textContent = 'Password must contain at least one digit.';
        } else if (!specialCharPattern.test(passwordValue)) {
            passwordError.textContent = 'Password must contain at least one special character.';
        } else {
            passwordError.textContent = '';
        }
    }

    function validateRepassword() {
        const repasswordError = document.getElementById('repasswordError');
        if (repasswordInput.value !== passwordInput.value) {
            repasswordError.textContent = 'Passwords do not match.';
        } else {
            repasswordError.textContent = '';
        }
    }
});