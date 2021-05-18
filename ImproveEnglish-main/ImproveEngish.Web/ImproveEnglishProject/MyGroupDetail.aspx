<%@ Page Title="" ClientIDMode="Static" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="MyGroupDetail.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.MyGroupDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main">

        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs" data-aos="fade-in">
            <div class="container">
                <h2>Course Details</h2>
                <p>Est dolorum ut non facere possimus quibusdam eligendi voluptatem. Quia id aut similique quia voluptas sit quaerat debitis. Rerum omnis ipsam aperiam consequatur laboriosam nemo harum praesentium. </p>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- ======= Cource Details Section ======= -->
        <section id="course-details" class="course-details">
            <div class="container">
                <asp:ScriptManager runat="server"></asp:ScriptManager>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="course-info d-flex justify-content-between" style="text-align: right !important;">
                            <p>
                                <button runat="server" type="submit" id="btnEdit" class="btn btn-primary w-auto">Edit Group</button>
                                <button runat="server" type="button" id="btnDeleteGroup" class="btn btn-danger w-auto" OnServerClick="btnDeleteGroup_OnServerClick">Delete Group</button>
                            </p>
                        </div>
                        <asp:Repeater runat="server" ID="rptGroupDetail">
                            <ItemTemplate>
                                <div id="divLabel" class="row">
                                    <div class="col-lg-5">
                                        <img style="width: 550px; height: 250px;" src="<%#Eval("GroupImagePath") %>" class="img-fluid" alt="...">

                                        <h3><%#Eval("GroupName") %></h3>
                                        <p>
                                            <%#Eval("GroupExplanation") %>
                                        </p>
                                    </div>
                                    <div class="col-lg-7">
                                        <div class="course-info d-flex justify-content-between align-items-center">
                                            <h5>Subject</h5>
                                            <p>
                                                <a href="#"><%#Eval("GroupSubject") %></a>
                                            </p>
                                        </div>

                                        <div class="course-info d-flex justify-content-between align-items-center">
                                            <h5>Created By</h5>
                                            <p><%#Eval("CreatorNameSurname") %></p>
                                        </div>

                                        <div class="course-info d-flex justify-content-between align-items-center">
                                            <h5>Number of members</h5>
                                            <p><%#Eval("NumberOfGroupMembers") %></p>
                                        </div>
                                        <div class="course-info d-flex justify-content-between align-items-center">
                                            <h5>MeetingLocation</h5>
                                            <p><%#Eval("GroupMeetingLocation") %></p>
                                        </div>
                                        <div class="course-info d-flex justify-content-between align-items-center">
                                            <h5>Meeting Date</h5>
                                            <p><%#Eval("GroupMeetingDate","{0:MM/dd/yyyy}") %></p>
                                        </div>
                                        <div class="course-info d-flex justify-content-between align-items-center">
                                            <h5>Meeting Time</h5>
                                            <p><%#DateTime.Parse(Eval("GroupMeetingTime").ToString()).ToString("hh:mm tt") %></p>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div id="divEdit" class="row text-center" hidden="true">
                            <div class="col-sm-1"></div>
                            <div class="col-lg-10">
                                <div id="divGroupImage" class="course-info d-flex justify-content-between align-items-center">
                                    <h5 class="w-50">Group Image</h5>
                                    <p class="w-75">
                                        <input type="file" runat="server" accept="image/*"
                                            class="form-control w-100"
                                            name="fileGroupImage"
                                            id="fileGroupImage" />
                                        <div class="invalid-feedback">Example invalid custom file feedback</div>
                                    </p>
                                </div>
                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5 class="w-50">Name</h5>
                                    <p class="w-75">
                                        <input runat="server" id="txtGroupName" type="text" class="form-control w-100" aria-label="Small" aria-describedby="inputGroup-sizing-sm" />
                                    </p>
                                </div>
                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5 class="w-50">Subject</h5>
                                    <p class="w-75">
                                        <input runat="server" id="txtGroupSubject" type="text" class="form-control w-100" aria-label="Small" aria-describedby="inputGroup-sizing-sm" />
                                    </p>
                                </div>
                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5 class="w-50">Group Explanation</h5>
                                    <p class="w-75">
                                        <textarea runat="server" class="form-control w-100" id="txtExplanation"
                                            rows="3"></textarea>
                                    </p>
                                </div>
                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5 class="w-50">Number of members</h5>
                                    <p class="w-75">
                                        <select runat="server" id="ddlNumberOfMembers" class="custom-select w-100">
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
                                        <asp:RequiredFieldValidator runat="server" ID="rfvNumberOfGroup" CssClass="text-danger font-weight-bold" ControlToValidate="ddlNumberOfMembers" ErrorMessage="Please Select End Time" ValidationGroup="UpdateGroup"></asp:RequiredFieldValidator>
                                    </p>
                                </div>
                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5 class="w-50">MeetingLocation</h5>
                                    <p class="w-75">
                                        <input runat="server" id="txtMeetingLocation" type="text" class="form-control w-100" aria-label="Small" aria-describedby="inputGroup-sizing-sm" />
                                        <asp:RequiredFieldValidator runat="server" ID="rfvMeetingLocation" CssClass="text-danger font-weight-bold" ControlToValidate="ddlNumberOfMembers" ErrorMessage="Please Select End Time" ValidationGroup="UpdateGroup"></asp:RequiredFieldValidator>
                                    </p>
                                </div>
                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5 class="w-50">Meeting Date</h5>
                                    <p class="w-75">
                                        <input runat="server" id="mDate" class="form-control w-100" type="date" />
                                        <asp:RequiredFieldValidator runat="server" ID="rfvMeetingDate" CssClass="text-danger font-weight-bold" ControlToValidate="mDate" ErrorMessage="Please Select End Time" ValidationGroup="UpdateGroup"></asp:RequiredFieldValidator>
                                    </p>
                                </div>
                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5 class="w-50">Meeting Time</h5>
                                    <p class="w-75">
                                        <input runat="server" id="mTime" class="form-control w-100" type="time" />
                                        <asp:RequiredFieldValidator runat="server" ID="rfvMeetingTime" CssClass="text-danger font-weight-bold" ControlToValidate="mTime" ErrorMessage="Please Select End Time" ValidationGroup="UpdateGroup"></asp:RequiredFieldValidator>
                                    </p>
                                </div>
                                <div class="d-flex justify-content-between align-items-center">
                                    <button runat="server" ID="btnUpdate" class="btn btn-primary w-100" OnServerClick="btnUpdate_OnServerClick">Update</button>
                                </div>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger runat="server" ControlID="btnEdit"/>
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </section>
        <!-- End Cource Details Section -->
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script src="/ImproveEnglishProject/assets/js/main.js"></script>
    <script>
        $(document).ready(function () {

            $("#btnEdit").on('click', function () {
                $("#divEdit").prop('hidden', false);
                $("#divLabel").prop('hidden', true);
            });
        });
    </script>
</asp:Content>
