<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="SingleMeetingDetail.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.SingleMeetingDetail" %>
<%@ Import Namespace="Microsoft.Ajax.Utilities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .btn-send-message {
            width: 100%;
            margin-top: 5%;
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
        <!-- End Breadcrumbs -->

        <!-- ======= Cource Details Section ======= -->

        <section id="course-details" class="course-details">
            <div class="container" data-aos="fade-up">

                <div class="row">
                    <asp:Repeater runat="server" ID="rptStudentDetail">
                        <ItemTemplate>
                            <div class="col-lg-4">
                                <img style="width: 550px; height: 250px;" src="<%#Eval("ProfileImagePath") %>" class="img-fluid" alt="">
                                <button class="btn btn-primary btn-send-message">Send A Message</button>
                            </div>
                            <div class="col-lg-8">

                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5>Name Surname</h5>
                                    <p><a href="#"><%#Eval("NameSurname") %></a></p>
                                </div>

                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5>Nationality</h5>
                                    <p><%#Eval("NationalityName") %></p>
                                </div>

                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5>University</h5>
                                    <p><%#Eval("UniversityName") %></p>
                                </div>

                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5>Department</h5>
                                    <p><%#Eval("DepartmentName") %></p>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                    <div class="col-lg-12 mt-2">
                        <div class="container">
                            <h2>Agenda</h2>
                            <p class="lead">
                                This agenda viewer will let you see multiple events cleanly!
                            </p>

                            <hr />

                            <div class="agenda">
                                <div class="table-responsive">
                                    <table class="table table-condensed table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Date</th>
                                                <th>Start Time</th>
                                                <th>End Time</th>
                                                <th>Is it Full</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Single event in a single day -->
                                            <asp:Repeater runat="server" ID="rptStudentAgenda">
                                                <ItemTemplate>
                                                    <tr>
                                                        <td class="agenda-date" class="active" rowspan="1">
                                                            <div class="dayofmonth"><%#Convert.ToDateTime(Eval("MeetingDate")).ToString("dd")%></div>
                                                            <div class="dayofweek"><%#Convert.ToDateTime(Eval("MeetingDate")).ToString("D").Split(',').GetValue(0)%></div>
                                                            <div class="shortdate text-muted"><%#Convert.ToDateTime(Eval("MeetingDate")).ToString("Y")%></div>
                                                        </td>
                                                        <td class="agenda-time"><%#Eval("StartTime") %>
                                                        </td>
                                                        <td class="agenda-time"><%#Eval("EndTime") %>
                                                        </td>
                                                        <td class="agenda-events">
                                                            <div class="agenda-event">
                                                                <i class="glyphicon glyphicon-repeat text-muted" title="Repeating event"></i><%#Convert.ToBoolean(Eval("ISFull") )==true?"Yes":"No"%>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <!-- Multiple events in a single day (note the rowspan) -->

                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>

            </div>
        </section>

        <!-- End Cource Details Section -->


    </main>
    <!-- End #main -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
