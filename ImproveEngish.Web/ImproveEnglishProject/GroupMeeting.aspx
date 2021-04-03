<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglish/Page.Master" AutoEventWireup="true" CodeBehind="GroupMeeting.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.GroupMeeting" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .popup-button {
            margin-top: 73px;
            text-align: center !important;
            padding: 30px 0;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main">
        <div class="popup-button">
            <div class="container">
                <button type="button" class="btn btn-danger btn-block"" data-toggle="modal" data-target="#myModal">
                    <i class="fas fa-plus"></i> Create a group
                </button>
                <!-- The Modal -->
                <div class="modal fade" id="myModal">
                    <div class="modal-dialog modal-xl">
                        <div class="modal-content">

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Modal Heading</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body">
                                <div class="form-group row">
                                    <label class="col-sm-3 group-label">Group Page : </label>
                                    <div class="custom-file col-sm-8">
                                        <input type="fil" eclass="custom-file-input" id="validatedCustomFile" required>
                                        <label class="custom-file-label" for="validatedCustomFile">Choose Group
                                            Page...</label>
                                        <div class="invalid-feedback">Example invalid custom file feedback</div>
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="input-group input-group-sm mb-3">
                                        <label class="group-label col-sm-3">Group Name : </label>
                                        <input type="text" class="form-control col-sm-8" aria-label="Small"
                                            aria-describedby="inputGroup-sizing-sm">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <div class="input-group input-group-sm mb-3">
                                        <label class="group-label col-sm-3">Subject : </label>
                                        <input type="text" class="form-control col-sm-8" aria-label="Small"
                                            aria-describedby="inputGroup-sizing-sm">
                                    </div>
                                </div>
                                <div class="form-group row">
                                    <label for="exampleFormControlTextarea1" class="group-label col-sm-3">Explanation :
                                    </label>
                                    <textarea class="form-control col-sm-8" id="exampleFormControlTextarea1"
                                        rows="3"></textarea>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-3 group-label" for="inlineFormCustomSelect">Number of Members :
                                    </label>
                                    <select class="custom-select col-sm-8" id="inlineFormCustomSelect">
                                        <option selected>Choose...</option>
                                        <option value="1">One</option>
                                        <option value="2">Two</option>
                                        <option value="3">Three</option>
                                    </select>
                                </div>
                                <div class="form-group row">
                                    <label class="group-label col-sm-3">Meeting Date : </label>
                                    <input class="form-control col-sm-3"
                                        style="width: 50% !important; display: inline !important;" type="date">
                                    <label class="group-label col-sm-2">Meeting Time : </label>
                                    <input class="form-control search-item col-sm-3" type="time">
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-success" data-dismiss="modal">Save</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs" data-aos="fade-in">
            <div class="container">
                <div class="fieldset">
                    <h1>Search</h1>
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="form-group">
                                <label>Date : </label>
                                <input class="form-control" style="width: 50% !important; display: inline !important;"
                                    type="date">
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

        <!-- ======= Events Section ======= -->
        <section id="courses" class="courses">
            <div class="container" data-aos="fade-up">

                <div class="row" data-aos="zoom-in" data-aos-delay="100">

                    <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
                        <div class="course-item">
                            <img src="assets/img/course-1.jpg" class="img-fluid" alt="...">
                            <div class="course-content">
                                <h3><a href="events-details.html">Website Design</a></h3>
                                <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae
                                    dolores dolorem tempore.
                                </p>
                                <div class="trainer d-flex justify-content-between align-items-center">
                                    <div class="trainer-profile d-flex align-items-center">
                                        <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
                                        <span>Antonio</span>
                                    </div>
                                    <div class="trainer-rank d-flex align-items-center">
                                        <i class="bx bx-user"></i>&nbsp;50 &nbsp;&nbsp;
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- End Course Item-->

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
