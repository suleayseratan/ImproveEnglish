<%@ Page Title="" ClientIDMode="Static" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="MyGroups.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.MyGroups" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .popup-button {
            margin-top: 2%;
            text-align: center !important;
            padding: 30px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main">

        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs" data-aos="fade-in">
            <div class="container">
                
            </div>
        </div>


        <div class="popup-button">
            <div class="container">
                <button runat="server" type="button" id="btnModal" class="btn btn-danger btn-block" data-toggle="modal" data-target="#myModal">
                    <i class="fas fa-plus"></i>Create a group
                </button>
                <!-- The Modal -->
                <div class="modal fade" id="myModal">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Create A Group</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label class="col-sm-3 group-label">Group Page : </label>
                                    <div class="custom-file col-sm-8">
                                        <input type="file" runat="server" accept="image/*"
                                            class="form-control max-width"
                                            name="fileGroupImage"
                                            id="fileGroupImage" />
                                        <label class="custom-file-label" for="fileGroupImage">Choose Group Page...</label>
                                        <div class="invalid-feedback">Example invalid custom file feedback</div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="input-group input-group-sm mb-3">
                                        <label class="group-label col-sm-3">Group Name : </label>
                                        <input runat="server" id="txtGroupName" type="text" class="form-control col-sm-8" aria-label="Small" aria-describedby="inputGroup-sizing-sm" />
                                        <asp:RequiredFieldValidator runat="server" ID="rfvGroupName" CssClass="text-danger font-weight-bold" ControlToValidate="txtGroupName" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="input-group input-group-sm mb-3">
                                        <label class="group-label col-sm-3">Subject : </label>
                                        <input runat="server" id="txtSubject" type="text" class="form-control col-sm-8" aria-label="Small" aria-describedby="inputGroup-sizing-sm" />
                                        <asp:RequiredFieldValidator runat="server" ID="rfvSubject" CssClass="text-danger font-weight-bold" ControlToValidate="txtSubject" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="input-group input-group-sm mb-3">
                                        <label class="group-label col-sm-3">Meeting Location : </label>
                                        <input runat="server" id="txtMeetingLocation" type="text" class="form-control col-sm-8" aria-label="Small" aria-describedby="inputGroup-sizing-sm" />
                                        <asp:RequiredFieldValidator runat="server" ID="rfvLocation" CssClass="text-danger font-weight-bold" ControlToValidate="txtMeetingLocation" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="txtExplanation" class="group-label col-sm-3">
                                        Explanation :
                                    </label>
                                    <textarea runat="server" class="form-control col-sm-8" id="txtExplanation"
                                        rows="3"></textarea>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvExplanation" CssClass="text-danger font-weight-bold" ControlToValidate="txtExplanation" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 group-label" for="inlineFormCustomSelect">
                                        Number of Members :
                                    </label>
                                    <select runat="server" id="ddlNumberOfMembers" class="custom-select col-sm-8">
                                        <option selected>Choose...</option>
                                        <option value="3">Three</option>
                                        <option value="4">Four</option>
                                        <option value="5">Five</option>
                                        <option value="6">Six</option>
                                        <option value="7">Seven</option>
                                        <option value="8">Eight</option>
                                        <option value="9">Nine</option>
                                        <option value="10">Ten</option>
                                    </select>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvNumberOfGroup" CssClass="text-danger font-weight-bold" ControlToValidate="ddlNumberOfMembers" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group row">
                                    <label class="group-label col-sm-3">Meeting Date : </label>
                                    <input runat="server" id="mDate" class="form-control col-sm-3"
                                        style="width: 50% !important; display: inline !important;" type="date" />
                                    <label class="group-label col-sm-2">Meeting Time : </label>
                                    <input runat="server" id="mTime" class="form-control search-item col-sm-3" type="time" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvMeetingDate" CssClass="text-danger font-weight-bold" ControlToValidate="mDate" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                    <asp:RequiredFieldValidator runat="server" ID="rfvMeetingTime" CssClass="text-danger font-weight-bold" ControlToValidate="mTime" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button runat="server" id="btnSaveGroup" type="button" class="btn btn-success" onserverclick="btnSaveGroup_OnServerClick" ValidationGroup="CreateGroup" >Save</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->
        <!-- ======= Events Section ======= -->
        <section id="courses" class="courses">
            <div class="container" data-aos="fade-up">

                <div class="row" data-aos="zoom-in" data-aos-delay="100">
                    <asp:Repeater runat="server" ID="rptGroupMeeting">
                        <ItemTemplate>
                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
                                <div class="course-item mt-4">
                                    <img style="width: 350px; height: 250px;" src="<%#Eval("GroupImagePath") %>" class="img-fluid" alt="...">
                                    <div class="course-content">
                                        <h3><a href="/MyGroupDetail/<%#Eval("GroupId") %>"><%#Eval("GroupName") %></a></h3>

                                        <p>
                                            <%#Eval("GroupExplanation") %>
                                        </p>
                                        <div class="trainer d-flex justify-content-between align-items-center">
                                            <div class="trainer-profile d-flex align-items-center">
                                                <img src="<%#Eval("CreatorImagePath") %>" class="img-fluid" alt="">
                                                <span><%#Eval("CreatorNameSurname") %></span>
                                            </div>
                                            <div class="trainer-rank d-flex align-items-center">
                                                <i class="bx bx-user"></i>&nbsp;<%#Eval("NumberOfGroupMembers")%>&nbsp;&nbsp;
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- End Course Item-->
                        </ItemTemplate>
                    </asp:Repeater>
                </div>

            </div>
        </section>
        <!-- End Events Section -->

    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <!-- Template Main JS File -->
    <script src="/ImproveEnglishProject/assets/js/main.js"></script>
    <script type="text/javascript">
        $('.clockpicker').clockpicker();
    </script>
</asp:Content>
