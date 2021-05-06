﻿<%@ Page Title="" ClientIDMode="Static" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="Setting.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.Setting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/settings.css" rel="stylesheet">
    <link href="assets/css/ajax.select2.min.css" rel="stylesheet"/>
    <script src="assets/js/ajax.select2.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main">
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
                        <a class="nav-link" id="security-tab" data-toggle="pill" href="#security" role="tab" aria-controls="security" aria-selected="false">
                            <i class="fa fa-user text-center mr-1"></i>
                            Security
                        </a>
                        <a class="nav-link" id="application-tab" data-toggle="pill" href="#application" role="tab" aria-controls="application" aria-selected="false">
                            <i class="fa fa-tv text-center mr-1"></i>
                            Application
                        </a>
                        <a class="nav-link" id="notification-tab" data-toggle="pill" href="#notification" role="tab" aria-controls="notification" aria-selected="false">
                            <i class="fa fa-bell text-center mr-1"></i>
                            Notification
                        </a>
                    </div>
                </div>
                <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                    <div class="tab-pane fade show active" id="account" role="tabpanel" aria-labelledby="account-tab">
                        <h3 class="mb-4">Account Settings</h3>
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Image</label>
                                    <input type="file" runat="server" accept="image/*"
                                        class="form-control w-100"
                                        name="fileGroupImage"
                                        id="fileGroupImage"/>
                                    <div class="invalid-feedback">Example invalid custom file feedback</div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>First Name</label>
                                    <input runat="server" type="text" id="txtName" class="form-control" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvName" CssClass="text-danger font-weight-bold" ControlToValidate="txtName" ErrorMessage="Please Select End Time" ValidationGroup="UpdateAccount"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Last Name</label>
                                    <input runat="server" type="text" id="txtSurname" class="form-control" />
                                </div>
                                <asp:RequiredFieldValidator runat="server" ID="rfvSurname" CssClass="text-danger font-weight-bold" ControlToValidate="txtSurname" ErrorMessage="Please Select End Time" ValidationGroup="UpdateAccount"></asp:RequiredFieldValidator>

                            </div>
                            <asp:ScriptManager runat="server"></asp:ScriptManager>
                            <asp:UpdatePanel runat="server"><ContentTemplate>
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
                                                    <asp:RequiredFieldValidator runat="server" ID="rfvEposta" CssClass="text-danger font-weight-bold" ControlToValidate="txtEmail" ErrorMessage="Please Select End Time" ValidationGroup="UpdateAccount"></asp:RequiredFieldValidator>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                            </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger runat="server" EventName="SelectedIndexChanged" ControlID="ddlUniversity"/>
                                </Triggers>
                            </asp:UpdatePanel>
                        </div>
                        <div>
                            <button runat="server" ID="btnUpdateAccount" class="btn btn-primary" OnServerClick="btnUpdateAccount_OnServerClick" ValidationGroup="UpdateAccount">Update</button>
                            <button class="btn btn-light">Cancel</button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="password" role="tabpanel" aria-labelledby="password-tab">
                        <h3 class="mb-4">Password Settings</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Old password</label>
                                    <input type="password" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>New password</label>
                                    <input type="password" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Confirm new password</label>
                                    <input type="password" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div>
                            <button class="btn btn-primary">Update</button>
                            <button class="btn btn-light">Cancel</button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="security" role="tabpanel" aria-labelledby="security-tab">
                        <h3 class="mb-4">Security Settings</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Login</label>
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Two-factor auth</label>
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="recovery">
                                        <label class="form-check-label" for="recovery">
                                            Recovery
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button class="btn btn-primary">Update</button>
                            <button class="btn btn-light">Cancel</button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="application" role="tabpanel" aria-labelledby="application-tab">
                        <h3 class="mb-4">Application Settings</h3>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="app-check">
                                        <label class="form-check-label" for="app-check">
                                            App check
                                        </label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="defaultCheck2">
                                        <label class="form-check-label" for="defaultCheck2">
                                            Lorem ipsum dolor sit.
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div>
                            <button class="btn btn-primary">Update</button>
                            <button class="btn btn-light">Cancel</button>
                        </div>
                    </div>
                    <div class="tab-pane fade" id="notification" role="tabpanel" aria-labelledby="notification-tab">
                        <h3 class="mb-4">Notification Settings</h3>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="notification1">
                                <label class="form-check-label" for="notification1">
                                    Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolorum accusantium accusamus, neque cupiditate quis
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="notification2">
                                <label class="form-check-label" for="notification2">
                                    hic nesciunt repellat perferendis voluptatum totam porro eligendi.
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" value="" id="notification3">
                                <label class="form-check-label" for="notification3">
                                    commodi fugiat molestiae tempora corporis. Sed dignissimos suscipit
                                </label>
                            </div>
                        </div>
                        <div>
                            <button class="btn btn-primary">Update</button>
                            <button class="btn btn-light">Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <!-- End #main -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
</asp:Content>
