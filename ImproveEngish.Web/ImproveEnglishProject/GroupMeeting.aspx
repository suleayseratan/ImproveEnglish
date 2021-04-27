<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="GroupMeeting.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.GroupMeeting" %>

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
        <div class="breadcrumbs" style="margin-top: 10%;" data-aos="fade-in">
            <div class="container">
                <div class="fieldset">
                    <h1>Search</h1>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>Date : </label>
                                <input runat="server" type="date" id="sMeetingDate" class="form-control" style="width: 70% !important; display: inline !important;" />
                                <asp:RequiredFieldValidator runat="server" ID="rfvSearchDate" CssClass="text-danger font-weight-bold" ControlToValidate="sMeetingDate" ErrorMessage="Please Select Date" ValidationGroup="Search"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group ">
                                <label>Start Time : </label>
                                <input runat="server" type="time" id="sMeetingStartTime" class="form-control search-item" />
                                <asp:RequiredFieldValidator runat="server" ID="rfvSearchStartTime" CssClass="text-danger font-weight-bold" ControlToValidate="sMeetingStartTime" ErrorMessage="Please Select Start Time" ValidationGroup="Search"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group ">
                                <label>End Time : </label>
                                <input runat="server" id="sMeetingEndTime" type="time" class="form-control search-item" />
                                <asp:RequiredFieldValidator runat="server" ID="rfvSearchEndTime" CssClass="text-danger font-weight-bold" ControlToValidate="sMeetingEndTime" ErrorMessage="Please Select End Time" ValidationGroup="Search"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group ">
                                <label>Subject : </label>
                                <input runat="server" id="txtSearchSubject" type="text" style="width: 70% !important;" class="form-control search-item" />
                                <asp:RequiredFieldValidator runat="server" ID="rfvSearchSubject" CssClass="text-danger font-weight-bold" ControlToValidate="txtSearchSubject" ErrorMessage="Please Select Subject" ValidationGroup="Search"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <button runat="server" id="btnSearch" type="submit" class="btn btn-primary search-button" onserverclick="btnSearch_OnServerClick" validationgroup="Search">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
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
                                                <input type="file" eclass="custom-file-input" id="validatedCustomFile">
                                                <label class="custom-file-label" for="validatedCustomFile">Choose Group Page...</label>
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
                                            <asp:RequiredFieldValidator runat="server" ID="rfvMeetingDate" CssClass="text-danger font-weight-bold" ControlToValidate="mDate" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                            <label class="group-label col-sm-2">Meeting Time : </label>
                                            <input runat="server" id="mTime" class="form-control search-item col-sm-3" type="time" />
                                            <asp:RequiredFieldValidator runat="server" ID="rfvMeetingTime" CssClass="text-danger font-weight-bold" ControlToValidate="mTime" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                    <!-- Modal footer -->
                                    <div class="modal-footer">
                                        <button runat="server" id="btnSaveGroup" type="button" class="btn btn-success" onserverclick="btnSaveGroup_OnServerClick">Save</button>
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
                                <div class="course-item">
                                    <img src="<%#Eval("GroupImagePath") %>" class="img-fluid" alt="...">
                                    <div class="course-content">
                                        <h3><a href="GroupMeetingDetail.aspx?groupId=<%#Eval("GroupId") %>"><%#Eval("GroupName") %></a></h3>
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
    <script src="assets/js/main.js"></script>
    <script type="text/javascript">
        $('.clockpicker').clockpicker();

    </script>
</asp:Content>
