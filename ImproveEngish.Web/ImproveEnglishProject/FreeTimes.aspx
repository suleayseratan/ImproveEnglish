<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="FreeTimes.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.FreeTimes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
   <main id="main">
        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs" style="margin-top: 10%" data-aos="fade-in">
            <div class="container">
                <div class="fieldset">
                    <h1>Add Your Free Time</h1>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Date : </label>
                                <input runat="server" ID="inputDate" class="form-control" style="width: 50% !important; display: inline !important;"
                                       type="date"/>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group ">
                                <label>Start Time : </label>
                                <input runat="server" ID="inputStartTime" class="form-control search-item" type="time"/>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group ">
                                <label>End Time : </label>
                                <input runat="server" ID="inputEndTime" class="form-control search-item" type="time"/>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <button runat="server" ID="btnAddFreeTime" type="button" class="btn btn-primary search-button" OnServerClick="btnAddFreeTime_OnServerClick">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- ======= Events Section ======= -->
        <div class="container" data-aos="fade-up">
            <div class="row">
                <div class="col-lg-12">
                    <div class="container">

                        <h2>Free Time Agenda</h2>

                        <hr />

                        <div class="agenda">
                            <div class="table-responsive">
                                <table class="table table-condensed table-bordered">
                                    <thead>
                                        <tr style="background-color: deepskyblue;">
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
                                            <td class="agenda-time">
                                                5:30 AM
                                            </td>
                                            <td class="agenda-events">
                                                <div class="agenda-event">
                                                    <i class="glyphicon glyphicon-repeat text-muted" title="Repeating event"></i>  Fishing
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
                                            <td class="agenda-time">
                                                8:00 - 9:00 AM
                                            </td>
                                            <td class="agenda-events">
                                                <div class="agenda-event">
                                                    Doctor's Appointment
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="agenda-time">
                                                10:15 AM - 12:00 PM
                                            </td>
                                            <td class="agenda-events">
                                                <div class="agenda-event">
                                                    Meeting with executives
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="agenda-time">
                                                7:00 - 9:00 PM
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
        <!-- End Events Section -->

    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">

</asp:Content>
