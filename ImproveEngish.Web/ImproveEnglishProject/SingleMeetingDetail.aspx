<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="SingleMeetingDetail.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.SingleMeetingDetail" %>

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
                    <div class="col-lg-4">
                        <img src="assets/img/course-details.jpg" class="img-fluid" alt="">
                        <button class="btn btn-primary btn-send-message">Send A Message</button>
                    </div>
                    <div class="col-lg-8">

                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>Trainer</h5>
                            <p><a href="#">Walter White</a></p>
                        </div>

                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>Course Fee</h5>
                            <p>$165</p>
                        </div>

                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>Available Seats</h5>
                            <p>30</p>
                        </div>

                        <div class="course-info d-flex justify-content-between align-items-center">
                            <h5>Schedule</h5>
                            <p>5.00 pm - 7.00 pm</p>
                        </div>

                        <div class="course-info d-flex justify-content-between align-items-center">
                        </div>
                    </div>
                    <div class="col-lg-12">
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
                                                <th>Time</th>
                                                <th>Event</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <!-- Single event in a single day -->
                                            <tr>
                                                <td class="agenda-date" class="active" rowspan="1">
                                                    <div class="dayofmonth">26</div>
                                                    <div class="dayofweek">Saturday</div>
                                                    <div class="shortdate text-muted">July, 2014</div>
                                                </td>
                                                <td class="agenda-time">5:30 AM
                                                </td>
                                                <td class="agenda-events">
                                                    <div class="agenda-event">
                                                        <i class="glyphicon glyphicon-repeat text-muted" title="Repeating event"></i>Fishing
                                                    </div>
                                                </td>
                                            </tr>

                                            <!-- Multiple events in a single day (note the rowspan) -->
                                            <tr>
                                                <td class="agenda-date" class="active" rowspan="3">
                                                    <div class="dayofmonth">24</div>
                                                    <div class="dayofweek">Thursday</div>
                                                    <div class="shortdate text-muted">July, 2014</div>
                                                </td>
                                                <td class="agenda-time">8:00 - 9:00 AM
                                                </td>
                                                <td class="agenda-events">
                                                    <div class="agenda-event">
                                                        Doctor's Appointment
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="agenda-time">10:15 AM - 12:00 PM
                                                </td>
                                                <td class="agenda-events">
                                                    <div class="agenda-event">
                                                        Meeting with executives
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="agenda-time">7:00 - 9:00 PM
                                                </td>
                                                <td class="agenda-events">
                                                    <div class="agenda-event">
                                                        Aria's dance recital
                                                    </div>
                                                </td>
                                            </tr>
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
