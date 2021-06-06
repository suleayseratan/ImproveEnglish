<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="GroupNotificationDetail.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.GroupNotificationDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="/ImproveEnglishProject/assets/css/notification-detail.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <br>
    <br>
    <div class="email-app mb-4" style="margin-top: 2%;">
        <nav>
            <a href="#" class="btn btn-danger btn-block">New Email</a>
            <ul class="nav">
                <li class="nav-item">
                    <a class="nav-link" href="#"><i class="fa fa-inbox"></i>Inbox <span class="badge badge-danger">4</span></a>
                </li>
            </ul>
        </nav>
        <main class="message">
            <div class="toolbar">
                <div class="btn-group">
                    <button type="button" class="btn btn-light">
                        <span class="fa fa-star"></span>
                    </button>
                    <button type="button" class="btn btn-light">
                        <span class="fa fa-star-o"></span>
                    </button>
                    <button type="button" class="btn btn-light">
                        <span class="fa fa-bookmark-o"></span>
                    </button>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-light">
                        <span class="fa fa-mail-reply"></span>
                    </button>
                    <button type="button" class="btn btn-light">
                        <span class="fa fa-mail-reply-all"></span>
                    </button>
                    <button type="button" class="btn btn-light">
                        <span class="fa fa-mail-forward"></span>
                    </button>
                </div>
                <button type="button" class="btn btn-light">
                    <span class="fa fa-trash-o"></span>
                </button>
                <div class="btn-group">
                    <button type="button" class="btn btn-light dropdown-toggle" data-toggle="dropdown">
                        <span class="fa fa-tags"></span>
                        <span class="caret"></span>
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">add label <span class="badge badge-danger">Home</span></a>
                        <a class="dropdown-item" href="#">add label <span class="badge badge-info">Job</span></a>
                        <a class="dropdown-item" href="#">add label <span class="badge badge-success">Clients</span></a>
                        <a class="dropdown-item" href="#">add label <span class="badge badge-warning">News</span></a>
                    </div>
                </div>
            </div>
            <asp:Repeater runat="server" ID="rptGroupNotification">
                <ItemTemplate>
                    <div class="details">
                        <div class="title"><%#Eval("GroupName") %></div>
                        <div class="header">
                            <img class="avatar" src="https://bootdey.com/img/Content/avatar/avatar1.png">
                            <div class="from">
                                <span><%#Eval("FromStudentName") %></span>
                            </div>
                            <div class="date"><%#Eval("NotificationSentDateTime") %></div>
                        </div>
                        <div class="content">
                            <p>
                                <%#Eval("NotificationContext") %>
                            </p>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </main>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
