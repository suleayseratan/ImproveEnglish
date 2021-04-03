﻿<%@ Page Language="C#" AutoEventWireup="true" ClientIDMode="Static" CodeBehind="CreateAccount.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.CreateAccount" Debug="true" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Create Account</title>
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


    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <link href="assets/css/ajax.select2.min.css" rel="stylesheet" />
    <script src="assets/js/ajax.jquery.min.js"></script>
    <script src="assets/js/ajax.select2.min.js"></script>

    <!-- My Scrips -->
    <script src="assets/js/myscript.js"></script>

    <!-- My Scrips -->
    <style>
         /* The message box is shown when the user clicks on the password field */
        #myMessage {
            display: none;;
            color: #000;
            position: relative;
            padding: 20px;
            margin-top: 10px;
            border: 4px inset #2a9d8f;
        }

        #myMessage p {
            padding: 0 35px;
            font-size: 1rem;
            margin-bottom: 0;
        }

        /* Add a green text color and a checkmark when the requirements are right */
        .valid {
            color: white;
        }

        .valid:before {
            position: relative;
            left: -35px;
            content: "✔";
        }

        /* Add a red text color and an "x" when the requirements are wrong */
        .invalid {
            color: red;
        }

        .invalid:before {
            position: relative;
            left: -35px;
            content: "✖";
        }
    </style>

</head>

<body>
    <form runat="server" id="formCreateAccount">
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
                            <h2 class="text-center">Create Account</h2>
                            
                                <div class="form-group mt-2">
                                    <label for="txtName" class="text-uppercase"><strong>Name</strong></label>
                                    <input type="text" runat="server" id="txtName" class="form-control" placeholder="" />

                                </div>
                            <div class="form-group mt-2">
                                <label for="txtSurname" class="text-uppercase"><strong>Surname</strong></label>
                                <input type="text" runat="server" id="txtSurname" class="form-control" placeholder="" />
                            </div>
                            <div class="form-group mt-2">
                                <label for="" class="text-uppercase" style="display: block;"><strong>Gender</strong></label>
                                <div class="form-check form-check-inline ml-3">
                                    <input runat="server" id="flexRadioFmale" class="form-check-input" type="radio" name="flexRadioDefault" />
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Fmale
                                    </label>
                                </div>
                                <div class="form-check form-check-inline ml-5">
                                    <input runat="server" id="flexRadioMale" class="form-check-input" type="radio" name="flexRadioDefault" />
                                    <label class="form-check-label" for="flexRadioDefault1">
                                        Male
                                    </label>
                                </div>
                            </div>

                            <div class="form-group mt-2">
                                <label for="selectUniversity"
                                    class="text-uppercase">
                                    <strong>Nationality</strong></label>
                                <asp:DropDownList runat="server" ID="selectNationality" CssClass="form-control select2 w-100"></asp:DropDownList>
                            </div>
                            <asp:ScriptManager runat="server" ID="scriptManager1">
                                <%--<Scripts>
                                    <asp:ScriptReference Path="assets/js/ajax.jquery.min.js"/>
                                    <asp:ScriptReference Path="assets/js/ajax.select2.min.js"/>
                                    <asp:ScriptReference Path="assets/js/myscript.js"/>
                                </Scripts>--%>
                            </asp:ScriptManager>
                            <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <div class="form-group mt-2">
                                        <label for="selectUniversity"
                                            class="text-uppercase">
                                            <strong>University</strong></label>
                                        <asp:DropDownList runat="server" ID="selectUniversity" CssClass="form-control select2 w-100" OnSelectedIndexChanged="selectUniversity_OnSelectedIndexChanged" AutoPostBack="True" />
                                    </div>
                                    <div class="form-group mt-2">
                                        <label for="exampleInputPassword1"
                                            class="text-uppercase">
                                            <strong>Department</strong></label>
                                        <select runat="server" id="selectDeprtment" class="form-control select2">
                                        </select>
                                    </div>
                                    <div class="form-group mt-2">
                                        <label for="txtEmail" class="text-uppercase"><strong>E-mail</strong></label>
                                        <div class="input-group mb-2">
                                            <input runat="server" id="txtEmail" type="text" class="form-control" style="width: 60%;" placeholder="" />

                                            <div class="input-group-prepend" style="width: 40%;">
                                                <div runat="server" id="divEposta" class="input-group-text w-100">@posa.example.edu.tr</div>
                                            </div>
                                        </div>
                                    </div>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="selectUniversity" EventName="SelectedIndexChanged" runat="server" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <div class="form-group mt-2">
                                <label for="txtPassword" class="text-uppercase"><strong>Password</strong></label>
                                <input type="password" runat="server" id="txtPassword" class="form-control" placeholder="" />

                                <div class="mt-3">
                                    <input type="checkbox" class="form-check-input ms-1" style="height: .3;" onclick="myFunction()" id="showPassword">
                                    <label class="form-check-label ms-4" for="showPassword">
                                        Show Password
                                    </label>
                                </div>
                            </div>

                            <div class="form-group mt-2">
                                <label for="txtPasswordAgain" class="text-uppercase">Password Again</label>
                                <input type="password" runat="server" id="txtPasswordAgain" class="form-control" placeholder="" />
                            </div>

                            <div class="d-grid gap-2 col-6 mx-auto mt-2">
                                <button type="button" runat="server" id="btnCreateAccount" class="btn btn-primary" onserverclick="btnCreateAccount_OnServerClick">Create Account</button>
                            </div>
                        </div>
                    </div>

                </div>

            </section>

        </div>
    </form>
</body>
<script>
    $('.select2').select2();

    var myInput = document.getElementById("psw");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");

    // When the user clicks on the password field, show the message box
    myInput.onfocus = function () {
        document.getElementById("myMessage").style.display = "block";
    }

    // When the user clicks outside of the password field, hide the message box
    myInput.onblur = function () {
        document.getElementById("myMessage").style.display = "none";
    }

    // When the user starts to type something inside the password field
    myInput.onkeyup = function () {
        // Validate lowercase letters
        var lowerCaseLetters = /[a-z]/g;
        if (myInput.value.match(lowerCaseLetters)) {
            letter.classList.remove("invalid");
            letter.classList.add("valid");
        } else {
            letter.classList.remove("valid");
            letter.classList.add("invalid");
        }

        // Validate capital letters
        var upperCaseLetters = /[A-Z]/g;
        if (myInput.value.match(upperCaseLetters)) {
            capital.classList.remove("invalid");
            capital.classList.add("valid");
        } else {
            capital.classList.remove("valid");
            capital.classList.add("invalid");
        }

        // Validate numbers
        var numbers = /[0-9]/g;
        if (myInput.value.match(numbers)) {
            number.classList.remove("invalid");
            number.classList.add("valid");
        } else {
            number.classList.remove("valid");
            number.classList.add("invalid");
        }

        // Validate length
        if (myInput.value.length >= 8) {
            length.classList.remove("invalid");
            length.classList.add("valid");
        } else {
            length.classList.remove("valid");
            length.classList.add("invalid");
        }
    }
</script>
</html>