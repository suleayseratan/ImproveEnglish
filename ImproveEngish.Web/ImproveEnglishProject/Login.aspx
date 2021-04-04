<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.Login" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="assets/css/login.css">



    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
    <link href="assets/vendor/aos/aos.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

</head>

<body>
    <div class="login-block">
        <section class="login-block">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 banner-sec">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active">
                                    <img class="d-block img-fluid" src="https://images.pexels.com/photos/872957/pexels-photo-872957.jpeg" alt="First slide">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div class="banner-text">
                                            <h2>This is Heaven</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="https://images.pexels.com/photos/872957/pexels-photo-872957.jpeg" alt="First slide">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div class="banner-text">
                                            <h2>This is Heaven</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="carousel-item">
                                    <img class="d-block img-fluid" src="https://images.pexels.com/photos/872957/pexels-photo-872957.jpeg" alt="First slide">
                                    <div class="carousel-caption d-none d-md-block">
                                        <div class="banner-text">
                                            <h2>This is Heaven</h2>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation</p>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                    <div class="col-md-6 login-sec">
                        <h2 class=" text-center ">Login</h2>
                        <form runat="server" ID="formLogin" class="login-form ">
                            <div class="form-group mt-3">
                                <label for="txtEmail " class="text-uppercase "><strong>E-Mail</strong></label>
                                <input runat="server" ID="txtEmail" type="email" class="form-control " placeholder=" "/>
                            </div>
                            <div class="form-group mt-3">
                                <label for="txtPassword " class="text-uppercase "><strong>Password</strong></label>
                                <input runat="server" ID="txtPassword" type="password " class="form-control " placeholder=" "/>
                            </div>
                            <div class="form-group mt-3">
                                <div class="form-check form-check-inline">
                                    <input type="checkbox" class="form-check-input" id="rememberMe">
                                    <label class="form-check-label ms-4 " for="rememberMe">
                                        Check Me Out
                                </label>
                                </div>
                                <a href="ForgotPassword.aspx" style="margin-left: 35%;"><strong><i>Forgot password?</i></strong></a>
                            </div>
                            <div class="d-grid gap-2 col-6 mx-auto mt-3 ">
                                <button runat="server" ID="btnSignIn" class="btn btn-primary" type="button" OnServerClick="btnSignIn_OnServerClick">Sign in</button>
                            </div>
                            <div runat="server" ID="divMessage" class="alert alert-danger mt-4" Visible="False" role="alert">
                            </div>
                            <a href="#" runat="server" ID="aLink" OnServerClick="aLink_OnServerClick" style="margin-left: 35%;" Visible="False"><strong><i>Send activation link again.</i></strong></a>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
</body>

</html>

<script src="assets/js/myscript.js"></script>
