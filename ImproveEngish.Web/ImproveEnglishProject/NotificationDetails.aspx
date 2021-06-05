<%@ Page Title="" Language="C#" ClientIDMode="Static" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="NotificationDetails.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.NotificationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    
    <link href="/ImproveEnglishProject/assets/css/notification-detail.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<br>
<br>
<div class="email-app mb-4" style="margin-top: 2%;">
    <nav>
      <a href="#" class="btn btn-danger btn-block">New Email</a>
      <ul class="nav">
        <li class="nav-item">
          <a class="nav-link" href="/ImproveEnglishProject/Notifications.aspx"><i class="fa fa-inbox"></i> Inbox <span class="badge badge-danger">4</span></a>
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
            <a class="dropdown-item" href="#">add label <span class="badge badge-danger"> Home</span></a>
            <a class="dropdown-item" href="#">add label <span class="badge badge-info"> Job</span></a>
            <a class="dropdown-item" href="#">add label <span class="badge badge-success"> Clients</span></a>
            <a class="dropdown-item" href="#">add label <span class="badge badge-warning"> News</span></a>
          </div>
        </div>
      </div>
      <div class="details">
          <asp:Repeater runat="server" ID="rptNotificationDetail">
              <ItemTemplate>
                  <div class="header">
                      <img class="avatar" src="<%#Eval("FromStudentImage") %>">
                      <div class="from">
                          <span><%#Eval("FromNameSurname") %></span>

                      </div>
                      <div class="date"><%#Eval("SentDateTime") %></div>
                  </div>
                  <div class="content">
                      <p>
                          <%#Eval("MessageContent") %>
                      </p>
                      <div <%#Eval("IsFeedback").Equals(true)?"hidden":"" %> >
                          <button type="button" runat="server" id="btnAccept" class="btn btn-outline-success btn-sm" onserverclick="btnAccept_OnServerClick">Accept</button>
                          <button type="button" runat="server" id="btnDeny" class="btn btn-outline-danger btn-sm px-3" onserverclick="btnDeny_OnServerClick">Deny</button>
                      </div>
                  </div>
              </ItemTemplate>
          </asp:Repeater>
      </div>
    </main>
  </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
