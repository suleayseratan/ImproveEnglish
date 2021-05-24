<%@ Page Title="" Language="C#" ClientIDMode="Static" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="SingleMeeting.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.SingleMeeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>

    <link href="/ImproveEnglishProject/assets/css/ajax.select2.min.css" rel="stylesheet" />
    <script src="/ImproveEnglishProject/assets/js/ajax.jquery.min.js"></script>
    <script src="/ImproveEnglishProject/assets/js/ajax.select2.min.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main" data-aos="fade-in">
        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs" style="margin-top: 10%">
            <div class="container  text-center">
                <div class="fieldset">
                    <h1>Search</h1>
                    <div class="row">
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>Date : </label>
                                <input runat="server" id="mDate" class="form-control" style="width: 70% !important; display: inline !important;" type="date" />
                                <asp:RequiredFieldValidator runat="server" ID="rfvDate" CssClass="text-danger font-weight-bold" ControlToValidate="mDate" ErrorMessage="Please Select Date" ValidationGroup="Search"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group ">
                                <label>Start Time : </label>
                                <input runat="server" id="mStartTime" class="form-control search-item" type="time"/>
                                <asp:RequiredFieldValidator runat="server" ID="rfvStartTime" CssClass="text-danger font-weight-bold" ControlToValidate="mStartTime" ForeColor="" ErrorMessage="Please Select Start Time" ValidationGroup="Search"></asp:RequiredFieldValidator>

                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group ">
                                <label>End Time : </label>
                                <input runat="server" id="mEndTime" class="form-control search-item" type="time"/>
                                <asp:RequiredFieldValidator runat="server" ID="rfvEndTime" CssClass="text-danger font-weight-bold" ControlToValidate="mEndTime" ErrorMessage="Please Select End Time" ValidationGroup="Search"></asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div class="col-lg-3">
                            <div class="form-group">
                                <label>Department : </label>
                                <asp:DropDownList runat="server" ID="ddlDepartment" CssClass="form-control select2" style="width: 56% !important; display: inline !important"/>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <button runat="server" type="button" id="btnSearch" class="btn btn-primary search-button" onserverclick="btnSearch_OnServerClick" ValidationGroup="Search">Search</button>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- ======= Courses Section ======= -->
        <section id="events" class="events">
            <div id="secondContent" class="container" data-aos="fade-up">
                <div class="row">
                    <asp:Repeater runat="server" ID="rptStudents">
                        <ItemTemplate>
                            <div class="col-md-4 d-flex align-items-stretch">
                                <div class="card">
                                    <div class="card-img">
                                        <img style="width: 350px; height: 250px;" src="<%#Eval("ProfileImagePath")%>" alt="...">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card-title"><a href="/SingleMeetingDetail/<%#Eval("StudentId") %>/<%#Eval("ScheduleId") %>"><%#Eval("NameSurname")%></a></h5>
                                        <p class="text-center">
                                            <strong>Free Date :</strong> <%#Eval("MeetingDate","{0:MM/dd/yyyy}")%>
                                            <br />
                                            <strong>Start Time :</strong> <%#DateTime.Parse(Eval("StartTime").ToString()).ToString("hh:mm tt")%>
                                            <br />
                                            <strong>End Time :</strong> <%#DateTime.Parse(Eval("EndTime").ToString()).ToString("hh:mm tt")%>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
            <div runat="server" id="firstContent" class="container" data-aos="fade-up">
                <div class="row">
                    <div class="col-md-12 d-flex">
                        <p class="col-md-12" style="font-size: 4rem; text-align: center; font-weight: bolder; color: deepskyblue">Please Search</p>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Courses Section -->
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script>
        $("#secondContent").prop('hidden', false);

        $(document).ready(function () {

            $("#btnSearch").on('click', function () {
                $("#firstContent").prop('hidden', true);
                $("#secondContent").prop('hidden', false);
            });
        });
    </script>
</asp:Content>
