const container = document.getElementById('container');
const showSignUpButton = document.getElementById('showSignUp');
const showSignInButton = document.getElementById('showSignIn');
const showSignInLink = document.getElementById('showSignInForm');
const showForgotPasswordLink = document.getElementById('showForgotPassword');
const signUpForm = document.querySelector('.form-container.sign-up');
const signInForm = document.querySelector('.form-container.sign-in');
const forgotPasswordForm = document.querySelector('.form-container.forgot-password');

showSignUpButton.addEventListener('click', () => {
    container.classList.add("active");
    signInForm.style.display = 'none';
    forgotPasswordForm.style.display = 'none';
    signUpForm.style.display = 'block';
});

showSignInButton.addEventListener('click', () => {
    container.classList.remove("active");
    signUpForm.style.display = 'none';
    forgotPasswordForm.style.display = 'none';
    signInForm.style.display = 'block';
});

showForgotPasswordLink.addEventListener('click', (event) => {
    // event.preventDefault();
    container.classList.remove("active");
    signUpForm.style.display = 'none';
    signInForm.style.display = 'none';
    forgotPasswordForm.style.display = 'block';
});
showSignInLink.addEventListener('click', (event) => {
    // event.preventDefault();
    container.classList.remove("active");
    forgotPasswordForm.style.display = 'none';
    forgotPasswordForm.style.display = 'none';
    signInForm.style.display = 'block';
});
