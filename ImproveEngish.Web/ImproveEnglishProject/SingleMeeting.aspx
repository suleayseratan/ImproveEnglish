<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="SingleMeeting.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.SingleMeeting" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main" data-aos="fade-in">

        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs">
            <div class="container  text-center">
                <div class="fieldset">
                    <h1>Search</h1>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Date : </label>
                                <input class="form-control" style="width: 50% !important; display: inline !important;" type="date">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group ">
                                <label>Start Time : </label>
                                <input class="form-control search-item" type="time">
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group ">
                                <label>End Time : </label>
                                <input class="form-control search-item" type="time">
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="form-group">
                                <button class="btn btn-primary search-button" type="submit">Search</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <!-- End Breadcrumbs -->

        <!-- ======= Courses Section ======= -->
        <section id="events" class="events">
            <div class="container" data-aos="fade-up">

                <div class="row">
                    <div class="col-md-4 d-flex align-items-stretch">
                        <div class="card">
                            <div class="card-img">
                                <img src="assets/img/events-1.jpg" alt="...">
                            </div>
                            <div class="card-body">
                                <h5 class="card-title"><a href="course-details.html">Introduction to webdesign</a></h5>
                                <p class="font-italic text-center">Sunday, September 26th at 7:00 pm</p>
                                <p class="card-text">Lorem ipsum dolor sit amet consectetur adipisicing elit. Sint, nulla.</p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </section>
        <!-- End Courses Section -->

    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
