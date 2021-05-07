<%@ Page Title="" ClientIDMode="Static" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/settings.css" rel="stylesheet">
    <link href="assets/css/ajax.select2.min.css" rel="stylesheet" />
    <script src="assets/js/ajax.select2.min.js"></script>
    <style>
        /* The message box is shown when the user clicks on the password field */
        #myMessage {
            display: none;
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

        #myMessage2 {
            display: none;
            color: #000;
            position: relative;
            padding: 20px;
            margin-top: 10px;
            border: 4px inset #2a9d8f;
        }

        #myMessage2 p {
            padding: 0 35px;
            font-size: 1rem;
            margin-bottom: 0;
        }

        /* Add a green text color and a checkmark when the requirements are right */
        .valid {
            color: #006400;
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


        /* Radio Button Spaice */
        .spaced input[type="radio"]
        {
            margin-right: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main">
    <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
        <ContentTemplate>
        <section class="py-5 my-5">
            <div class="bg-white shadow rounded-lg d-block d-lg-flex">
                <div class="profile-tab-nav border-right">
                    <div class="p-4">
                        <div class="img-circle text-center mb-3">
                            <img src="assets/img/user2.jpg" alt="Image" class="shadow">
                        </div>
                        <h4 class="text-center">Kiran Acharya</h4>
                    </div>
                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active" id="account-tab" data-toggle="pill" href="#account" role="tab" aria-controls="account" aria-selected="true">
                            <i class="fa fa-home text-center mr-1"></i>
                            Account
                        </a>
                        <a class="nav-link" id="password-tab" data-toggle="pill" href="#password" role="tab" aria-controls="password" aria-selected="false">
                            <i class="fa fa-key text-center mr-1"></i>
                            Password
                        </a>
                    </div>
                </div>
                <div class="tab-content p-4 p-md-5"id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                        <h3 class="mb-4">Account Settings</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Image</label>
                                    <input type="file" runat="server" accept="image/*"
                                        class="form-control w-100"
                                        name="fileGroupImage"
                                        id="fileGroupImage" />
                                    <div class="invalid-feedback">Example invalid custom file feedback</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input runat="server" type="text" id="txtName" class="form-control" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvName" CssClass="text-danger font-weight-bold" ControlToValidate="txtName" ErrorMessage="Please Enter Name" ValidationGroup="UpdateAccount"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input runat="server" type="text" id="txtSurname" class="form-control" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSurname" CssClass="text-danger font-weight-bold" ControlToValidate="txtSurname" ErrorMessage="Please Enter Surname" ValidationGroup="UpdateAccount"></asp:RequiredFieldValidator>

                            </div>
                            
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>University</label>
                                                <asp:DropDownList runat="server" ID="ddlUniversity" CssClass="form-control select2 w-100" OnSelectedIndexChanged="ddlUniversity_OnSelectedIndexChanged" AutoPostBack="True" />
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label>Department</label>
                                                <asp:DropDownList runat="server" ID="ddlDeprtment" CssClass="form-control select2"></asp:DropDownList>
                                            </div>
                                        </div>
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>Email</label>
                                                <div class="input-group mb-2">
                                                    <input runat="server" id="txtEmail" type="text" class="form-control" style="width: 60%;" placeholder="" />
                                                    <div class="input-group-prepend" style="width: 40%;">
                                                        <div runat="server" id="divEposta" class="input-group-text w-100">@posta.example.edu.tr</div>
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvEposta" CssClass="text-danger font-weight-bold" ControlToValidate="txtEmail" ErrorMessage="Please Enter Email" ValidationGroup="UpdateAccount"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                
                        </div>
                        <div>
                            <button runat="server" id="btnUpdateAccount" class="btn btn-primary" onserverclick="btnUpdateAccount_OnServerClick" validationgroup="UpdateAccount">Update</button>
                            <div runat="server" id="divUpdateAccountMessage" class="alert alert-danger mt-4" visible="False" role="alert">
                            </div>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                        <h3 class="mb-4">Password Settings</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Old password</label>
                                    <input runat="server" type="password" id="txtOldPassword" class="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvOldPassword" CssClass="text-danger font-weight-bold" ControlToValidate="txtOldPassword" ErrorMessage="Please Enter Old Password" ValidationGroup="UpdatePassword"></asp:RequiredFieldValidator>

                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>New password</label>
                                    <input runat="server" type="password" id="txtNewPassword" class="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNewPassword" CssClass="text-danger font-weight-bold" ControlToValidate="txtNewPassword" ErrorMessage="Please Enter New Password" ValidationGroup="UpdatePassword"></asp:RequiredFieldValidator>
                                </div>
                                <div id="myMessage">
                                    <h5>Password must contain the following:</h5>
                                    <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
                                    <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
                                    <p id="number" class="invalid">A <b>number</b></p>
                                    <p id="length" class="invalid">Minimum <b>8 characters</b></p>
                                    <p id="maxlength" class="invalid">Maximum <b>15 characters</b></p>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Confirm new password</label>
                                    <input runat="server" type="password" id="txtConfirmPassword" class="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvConfirmPassword" CssClass="text-danger font-weight-bold" ControlToValidate="txtConfirmPassword" ErrorMessage="Please Enter Confirm Password" ValidationGroup="UpdatePassword"></asp:RequiredFieldValidator>
                                </div>
                                <div id="myMessage2">
                                    <p id="confirmPwd" class="invalid">Matched <b>passwords</b> </p>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button runat="server" id="btnUpdatePassword" class="btn btn-primary" onserverclick="btnUpdatePassword_OnServerClick" ValidationGroup="UpdatePassword">Update</button>
                            <div runat="server" id="divUpdatePasswordMessage" class="alert alert-danger mt-4" visible="False" role="alert">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </ContentTemplate>
    <Triggers>
        <asp:AsyncPostBackTrigger runat="server" EventName="SelectedIndexChanged" ControlID="ddlUniversity" />
        <asp:AsyncPostBackTrigger runat="server" EventName="serverclick" ControlID="btnUpdatePassword"/>
    </Triggers>
    </asp:UpdatePanel>
    </main>
    <!-- End #main -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script>
        var myInput = document.getElementById("txtNewPassword");
        var myAgainInput = document.getElementById("txtConfirmPassword");
        var confirm = document.getElementById("confirmPwd");
        var letter = document.getElementById("letter");
        var capital = document.getElementById("capital");
        var number = document.getElementById("number");
        var length = document.getElementById("length");
        var maxlength = document.getElementById("maxlength");

        var btnCreateAccount = document.getElementById("btnCreateAccount");

        // When the user clicks on the password field, show the message box
        myInput.onfocus = function () {
            document.getElementById("myMessage").style.display = "block";
        }

        // When the user clicks outside of the password field, hide the message box
        myInput.onblur = function () {
            document.getElementById("myMessage").style.display = "none";
        }

        myAgainInput.onfocus = function () {
            document.getElementById("myMessage2").style.display = "block";
        }

        // When the user clicks outside of the confirm password field, hide the message box
        myAgainInput.onblur = function () {
            document.getElementById("myMessage2").style.display = "none";
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

            // Validate minimum length
            if (myInput.value.length >= 8) {
                length.classList.remove("invalid");
                length.classList.add("valid");
            } else {
                length.classList.remove("valid");
                length.classList.add("invalid");
            }

            // Validate maximum length
            if (myInput.value.length <= 15 && myInput.value.length >= 8) {
                maxlength.classList.remove("invalid");
                maxlength.classList.add("valid");
            } else {
                maxlength.classList.remove("valid");
                maxlength.classList.add("invalid");
            }
        }

        myAgainInput.onkeyup = function () {
            if (myAgainInput.value.match(myInput.value)) {
                confirm.classList.remove("invalid");
                confirm.classList.add("valid");
            } else {
                confirm.classList.remove("valid");
                confirm.classList.add("invalid");
            }
        }
    </script>
</asp:Content>
