<%@ Page Title="" ClientIDMode="Static" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="FreeTimes.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.FreeTimes" %>

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
                <button type="button" id="btnEdit" disabled="disabled" class="btn btn-info" data-toggle="modal" data-target="#myModal">Edit</button>
                <button runat="server" type="button" id="btnDelete" name="btnDelete" disabled="disabled" class="btn btn-danger" data-toggle="modal" data-target="#myModal" onserverclick="btnDelete_OnServerClick">Delete</button>
                <!-- The Modal -->
                <div class="modal fade" id="myModal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">Update Free Time</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <div class="modal-body">
                                <div class="form-group row">
                                    <input runat="server" type="text" hidden="true" id="txtScheduleId" name="txtScheduleId" />
                                </div>
                                <div class="form-group row">
                                    <label class="group-label col-sm-4">Meeting Date : </label>
                                    <input runat="server" id="mDate" class="form-control col-sm-3"
                                        style="width: 50% !important; display: inline !important;" type="date" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvMeetingDate" CssClass="text-danger font-weight-bold" ControlToValidate="mDate" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                </div>
                                <!-- Modal body -->

                                <div class="form-group row">
                                    <label class="group-label col-sm-4">Meeting Start Time : </label>
                                    <input runat="server" id="mStartTime" class="form-control search-item col-sm-3" type="time" />
                                    <asp:RequiredFieldValidator runat="server" ID="rfvMeetingStartTime" CssClass="text-danger font-weight-bold" ControlToValidate="mStartTime" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group row">
                                    <label class="group-label col-sm-4">Meeting End Time : </label>
                                    <input runat="server" id="mEndTime" class="form-control search-item col-sm-3" type="time" />
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator2" CssClass="text-danger font-weight-bold" ControlToValidate="mEndTime" ErrorMessage="Please Select End Time" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group row">
                                    <label class="col-sm-4 group-label" for="inlineFormCustomSelect">
                                        IS it full?
                                    </label>
                                    <asp:RadioButtonList ID="radioIsFull" runat="server" RepeatDirection="Horizontal" CssClass="col-sm-8">
                                        <asp:ListItem Text="Yes" Value="true" Selected="True" style="margin-right: 2px !important;"></asp:ListItem>
                                        <asp:ListItem Text="No" Value="false"></asp:ListItem>
                                    </asp:RadioButtonList>
                                    <asp:RequiredFieldValidator runat="server" ID="RequiredFieldValidator1" CssClass="text-danger font-weight-bold" ControlToValidate="radioIsFull" ErrorMessage="Please Select" ValidationGroup="CreateGroup"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <!-- Modal footer -->
                            <div class="modal-footer">
                                <button runat="server" id="btnUpdate" type="button" class="btn btn-success" onserverclick="btnUpdate_OnServerClick" validationgroup="CreateGroup">Update</button>
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
                                            <th hidden="true">Schedule Id</th>
                                            <th>Date</th>
                                            <th hidden="true">Date Hidden</th>
                                            <th>Start Time</th>
                                            <th>End Time</th>
                                            <th>Is it Full</th>
                                            <th hidden="true">Is it Full</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <!-- Single event in a single day -->
                                        <asp:Repeater runat="server" ID="rptStudentAgenda">
                                            <ItemTemplate>
                                                <tr>
                                                    <td hidden="true"><%#Eval("ScheduleId") %></td>
                                                    <td class="agenda-date" class="active" rowspan="1">
                                                        <div class="dayofmonth"><%#Convert.ToDateTime(Eval("MeetingDate")).ToString("dd")%></div>
                                                        <div class="dayofweek"><%#Convert.ToDateTime(Eval("MeetingDate")).ToString("D").Split(',').GetValue(0)%></div>
                                                        <div class="shortdate text-muted"><%#Convert.ToDateTime(Eval("MeetingDate")).ToString("Y")%></div>
                                                    </td>
                                                    <td hidden="true"><%#Eval("MeetingDate","{0:dd/MM/yyyy}") %></td>
                                                    <td class="agenda-time"><%#Eval("StartTime") %>
                                                    </td>
                                                    <td class="agenda-time"><%#Eval("EndTime") %>
                                                    </td>
                                                    <td class="agenda-events">
                                                        <div class="agenda-event">
                                                            <i class="glyphicon glyphicon-repeat text-muted" title="Repeating event"></i><%#Convert.ToBoolean(Eval("IsFull") )==true?"Yes":"No"%>
                                                        </div>
                                                    </td>
                                                    <td hidden="true"><%#Eval("IsFull") %></td>
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

                    var date = new Date(rowData[2]);
                    var day = ("0" + date.getDate()).slice(-2);
                    var month = ("0" + (date.getMonth() + 1)).slice(-2);

                    var dateFormat = date.getFullYear() + "-" + (day) + "-" + (month);

                    var startTime = new Date(rowData[2].trim() + " " + rowData[3].trim());
                    var formatStartTime = startTime.getHours() + ":" + startTime.getMinutes();
                    var endTime = new Date(rowData[2].trim() + " " + rowData[4].trim());
                    var formatEndTime = endTime.getHours() + ":" + endTime.getMinutes();

                    $("#btnEdit").prop('disabled', false);
                    $("#btnDeleteGroup").prop('disabled', false);
                    $("#txtScheduleId").val(rowData[0].trim());
                    $("#mDate").val(dateFormat);
                    $("#mStartTime").val(formatStartTime);
                    $("#mEndTime").val(formatEndTime);

                    if (rowData[6] == "False") {
                        $('#<%=radioIsFull.ClientID %>').find("input[value='false']").prop("checked", true);
                    } else {
                        $('#<%=radioIsFull.ClientID %>').find("input[value='true']").prop("checked", true);
                    }
                });
        });
    </script>
</asp:Content>
