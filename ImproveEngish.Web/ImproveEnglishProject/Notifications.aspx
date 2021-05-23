<%@ Page Title="" ClientIDMode="Static" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="Notifications.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="/ImproveEnglishProject/assets/css/notification.css" rel="stylesheet" />
    <link href="/ImproveEnglishProject/assets/css/settings.css" rel="stylesheet">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main">
        <asp:ScriptManager runat="server" ID="scriptManager1"></asp:ScriptManager>
        <asp:UpdatePanel runat="server" ID="UpdatePanel" UpdateMode="Conditional">
            <ContentTemplate>
                <%--<div class="container bootdey" style="margin-top: 10%;">
                    <div class="email-app mb-4">
                        <nav>
                            <a href="page-inbox-compose.html" class="btn btn-danger btn-block">New Email</a>
                            <div class="nav nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <div class="nav-item">
                                    <a class="nav-link active" id="singleMeetingInbox" data-toggle="pill" href="#singleNotification" role="tab" aria-controls="singleNotification" aria-selected="true"><i class="fa fa-inbox"></i>Single Inbox <span class="badge badge-danger">4</span></a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" id="groupMeetingInbox" data-toggle="pill" href="#groupNotification" role="tab" aria-controls="groupNotification" aria-selected="False"><i class="fa fa-inbox"></i>Group Inbox <span class="badge badge-danger">4</span></a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="#"><i class="fa fa-star"></i>Stared</a>
                                </div>
                                <div class="nav-item">
                                    <a class="nav-link" href="#"><i class="fa fa-trash-o"></i>Trash</a>
                                </div>
                            </div>
                        </nav>
                        <div class="tab-content" id="v-pills-tabContent">
                            <div class="inbox tab-pane fade show active" id="singleNotification" role="tabpanel" aria-labelledby="singleMeetingInbox">
                                <div class="toolbar">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-envelope"></span>
                                        </button>
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
                                    <div class="btn-group float-right">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-left"></span>
                                        </button>
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-right"></span>
                                        </button>
                                    </div>
                                </div>
                                <ul class="messages">
                                    <li class="message unread">
                                        <a href="/ImproveEnglishProject/NotificationDetails.aspx">
                                            <div class="actions">
                                                <span class="action"><i class="fa fa-square-o"></i></span>
                                                <span class="action"><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <div class="header">
                                                <span class="from">Lukasz Holeczek</span>
                                                <span class="date">
                                                    <span class="fa fa-paper-clip"></span>Today, 3:47 PM</span>
                                            </div>
                                            <div class="title">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                            </div>
                                            <div class="description">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                            </div>
                                        </a>
                                    </li>
                                    <li class="message">
                                        <a href="#">
                                            <div class="actions">
                                                <span class="action"><i class="fa fa-square-o"></i></span>
                                                <span class="action"><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <div class="header">
                                                <span class="from">Lukasz Holeczek</span>
                                                <span class="date">Today, 3:47 PM</span>
                                            </div>
                                            <div class="title">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                            </div>
                                            <div class="description">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="inbox tab-pane fade" id="groupNotification" role="tabpanel" aria-labelledby="groupMeetingInbox">
                                <div class="toolbar">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-envelope"></span>
                                        </button>
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
                                    <div class="btn-group float-right">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-left"></span>
                                        </button>
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-right"></span>
                                        </button>
                                    </div>
                                </div>
                                <ul class="messages">
                                    <li class="message unread">
                                        <a href="/ImproveEnglishProject/NotificationDetails.aspx">
                                            <div class="actions">
                                                <span class="action"><i class="fa fa-square-o"></i></span>
                                                <span class="action"><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <div class="header">
                                                <span class="from">Lukasz Holeczek 2</span>
                                                <span class="date">
                                                    <span class="fa fa-paper-clip"></span>Today, 3:47 PM</span>
                                            </div>
                                            <div class="title">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                            </div>
                                            <div class="description">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                            </div>
                                        </a>
                                    </li>
                                    <li class="message">
                                        <a href="#">
                                            <div class="actions">
                                                <span class="action"><i class="fa fa-square-o"></i></span>
                                                <span class="action"><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <div class="header">
                                                <span class="from">Lukasz Holeczek</span>
                                                <span class="date">Today, 3:47 PM</span>
                                            </div>
                                            <div class="title">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                            </div>
                                            <div class="description">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>--%>
                <section class="py-5 my-5">
                    <div class="email-app bg-white shadow rounded-lg d-block d-lg-flex">
                        <div class="profile-tab-nav border-right">
                            <div class="p-4">
                                <a href="page-inbox-compose.html" class="btn btn-danger btn-block">New Email</a>
                            </div>
                            <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                                <a class="nav-link active" id="single-tab" data-toggle="pill" href="#single" role="tab" aria-controls="single" aria-selected="true">
                                    <i class="fa fa-inbox text-center mr-1"></i>
                                    Single Inbox
                                </a>
                                <a class="nav-link" id="password-tab" data-toggle="pill" href="#group" role="tab" aria-controls="group" aria-selected="false">
                                    <i class="fa fa-inbox text-center mr-1"></i>
                                    Group Inbox
                                </a>
                                <a class="nav-link" id="trash-tab" data-toggle="pill" href="#trash" role="tab" aria-controls="trash" aria-selected="false">
                                    <i class="fa fa-trash-o text-center mr-1"></i>
                                    Trash
                                </a>
                            </div>
                        </div>
                        <div class="tab-content p-4 p-md-5" id="v-pills-tabContent">
                            <div class="inbox tab-pane fade show active" id="single" role="tabpanel" aria-labelledby="single-tab">
                                <div class="toolbar">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-envelope"></span>
                                        </button>
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
                                    <div class="btn-group float-right">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-left"></span>
                                        </button>
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-right"></span>
                                        </button>
                                    </div>
                                </div>
                                <ul class="messages">
                                    <asp:Repeater runat="server" ID="rptSingleNotification">
                                        <ItemTemplate>
                                            <li class="message">
                                                <a href="/ImproveEnglishProject/NotificationDetails.aspx">
                                                    <div class="actions">
                                                        <span class="action"><i class="fa fa-square-o"></i></span>
                                                        <span class="action"><i class="fa fa-star-o"></i></span>
                                                    </div>
                                                    <div class="header">
                                                        <span class="from"><%#Eval("FromNameSurname") %></span>
                                                        <span class="date">
                                                            <div class="dayofmonth"><%#Eval("MeetingDate")%></div>
                                                            <span class="fa fa-paper-clip"></span></span>
                                                    </div>
                                                    <div class="title">
                                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                                    </div>
                                                    <div class="description">
                                                       <%#Eval("MessageContent") %>
                                                    </div>
                                                </a>
                                            </li>
                                        </ItemTemplate>

                                    </asp:Repeater>
                                </ul>
                            </div>
                            <div class="inbox tab-pane fade" id="group" role="tabpanel" aria-labelledby="group-tab">
                                <div class="toolbar">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-envelope"></span>
                                        </button>
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
                                    <div class="btn-group float-right">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-left"></span>
                                        </button>
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-right"></span>
                                        </button>
                                    </div>
                                </div>
                                <ul class="messages">
                                    <li class="message unread">
                                        <a href="/ImproveEnglishProject/NotificationDetails.aspx">
                                            <div class="actions">
                                                <span class="action"><i class="fa fa-square-o"></i></span>
                                                <span class="action"><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <div class="header">
                                                <span class="from">Lukasz Holeczek 2</span>
                                                <span class="date">
                                                    <span class="fa fa-paper-clip"></span>Today, 3:47 PM</span>
                                            </div>
                                            <div class="title">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                            </div>
                                            <div class="description">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                            </div>
                                        </a>
                                    </li>
                                    <li class="message">
                                        <a href="#">
                                            <div class="actions">
                                                <span class="action"><i class="fa fa-square-o"></i></span>
                                                <span class="action"><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <div class="header">
                                                <span class="from">Lukasz Holeczek</span>
                                                <span class="date">Today, 3:47 PM</span>
                                            </div>
                                            <div class="title">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                            </div>
                                            <div class="description">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="inbox tab-pane fade" id="trash" role="tabpanel" aria-labelledby="trash-tab">
                                <div class="toolbar">
                                    <div class="btn-group">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-envelope"></span>
                                        </button>
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
                                    <div class="btn-group float-right">
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-left"></span>
                                        </button>
                                        <button type="button" class="btn btn-light">
                                            <span class="fa fa-chevron-right"></span>
                                        </button>
                                    </div>
                                </div>
                                <ul class="messages">
                                    <li class="message unread">
                                        <a href="/ImproveEnglishProject/NotificationDetails.aspx">
                                            <div class="actions">
                                                <span class="action"><i class="fa fa-square-o"></i></span>
                                                <span class="action"><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <div class="header">
                                                <span class="from">Lukasz Holeczek 2</span>
                                                <span class="date">
                                                    <span class="fa fa-paper-clip"></span>Today, 3:47 PM</span>
                                            </div>
                                            <div class="title">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit.
                                            </div>
                                            <div class="description">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                            </div>
                                        </a>
                                    </li>
                                    <li class="message">
                                        <a href="#">
                                            <div class="actions">
                                                <span class="action"><i class="fa fa-square-o"></i></span>
                                                <span class="action"><i class="fa fa-star-o"></i></span>
                                            </div>
                                            <div class="header">
                                                <span class="from">Lukasz Holeczek</span>
                                                <span class="date">Today, 3:47 PM</span>
                                            </div>
                                            <div class="title">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
                                            </div>
                                            <div class="description">
                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </section>
            </ContentTemplate>
            <Triggers>
            </Triggers>
        </asp:UpdatePanel>
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
</asp:Content>
