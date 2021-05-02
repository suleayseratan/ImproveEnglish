<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="FreeTimes.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.FreeTimes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="assets/css/datatables.bootstrap4.min.css" rel="stylesheet" />
    <link href="assets/css/buttons.datatables.min.css" rel="stylesheet" />

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
                                <input runat="server" id="inputDate" class="form-control" style="width: 50% !important; display: inline !important;"
                                    type="date" />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group ">
                                <label>Start Time : </label>
                                <input runat="server" id="inputStartTime" class="form-control search-item" type="time" />
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="form-group ">
                                <label>End Time : </label>
                                <input runat="server" id="inputEndTime" class="form-control search-item" type="time" />
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div runat="server" id="divMessage" class="alert alert-danger mt-3 w-50" style="margin-left: 25%;" visible="False" role="alert">
                            </div>
                            <div class="form-group">
                                <button runat="server" id="btnAddFreeTime" type="button" class="btn btn-primary search-button" onserverclick="btnAddFreeTime_OnServerClick">Add</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- End Breadcrumbs -->
        <div class="popup-button">
            <div class="container">
                <button type="button" id="btnEdit" hidden="true" class="btn btn-danger btn-block" data-toggle="modal" data-target="#myModal">
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
                                <button runat="server" id="btnSaveGroup" type="button" class="btn btn-success" validationgroup="CreateGroup">Save</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- ======= Events Section ======= -->
        <div class="container" data-aos="fade-up">
            <div class="row">
                <div class="col-lg-12">
                    <div class="container">

                        <h2>Free Time Agenda</h2>
                        <p class="lead">
                        </p>
                        <hr />
                        <div class="agenda">
                            <div class="table-responsive">
                                <table class="table table-condensed table-bordered nowrap" id="row-delete">
                                    <thead>
                                        <tr>
                                            <th>Date</th>
                                            <th hidden="true">Date Hidden</th>
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
                                                    <td hidden="true"><%#Eval("MeetingDate") %></td>
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
        <!-- End Events Section -->

    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="assets/js/data-table-custom.js"></script>
    <script src="assets/js/datatables.bootstrap4.min.js"></script>
    <script src="assets/js/datatables.responsive.min.js"></script>
    <script src="assets/js/jquery.datatables.min.js"></script>

    <script>
        $(document).ready(function () {

            $("#row-delete tbody").on('click',
                'tr',
                function () {

                    var rowData = $(this).children("td").map(function () {
                        return $(this).text();
                    }).get();
                    $("#btnEdit").prop('hidden', false);

                });
        });
    </script>
</asp:Content>
