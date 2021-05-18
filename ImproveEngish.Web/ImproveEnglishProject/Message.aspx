<%@ Page Language="C#" Title="" ClientIDMode="Static"  MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../ImproveEnglishProject/assets/css/message.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">

    <div class="container" style="margin-top: 10%">
        <div class="panel messages-panel">
            <div class="contacts-list">
                <div class="inbox-categories">
                    <div data-toggle="tab" data-target="#inbox" class="active w-100">Inbox </div>
                </div>
                <div class="tab-content">
                    <div id="inbox" class="contacts-outter-wrapper tab-pane active">
                        <form class="panel-search-form info form-group has-feedback no-margin-bottom">
                            <input type="text" class="form-control" name="search" placeholder="Search">
                            <span class="fa fa-search form-control-feedback"></span>
                            <input id="hdId" type="hidden" />
                            <input id="PWCount" type="hidden" value="info" />
                            <input id="hdUserName" type="hidden" />
                        </form>
                        <div class="contacts-outter">
                            <ul id="divUsers" class="list-unstyled contacts">
                                <li data-toggle="tab" data-target="#inbox-message-1" class="active">
                                    
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div id="tabContent" class="tab-content">
                <div class="tab-pane message-body active" id="inbox-message-1">
                    <div class="message-top">
                        <a class="btn btn btn-success new-message"><i class="fa fa-envelope"></i>New Message </a>

                        <div class="new-message-wrapper">
                            <div class="form-group">
                                <input type="text" class="form-control" placeholder="Send message to...">
                                <a class="btn btn-danger close-new-message" href="#"><i class="fa fa-times"></i></a>
                            </div>

                            <div class="chat-footer new-message-textarea">
                                <textarea class="send-message-text"></textarea>
                                <label class="upload-file">
                                    <input type="file" required="">
                                    <i class="fa fa-paperclip"></i>
                                </label>
                                <button type="button" class="send-message-button btn-info"><i class="fa fa-send"></i></button>
                            </div>
                        </div>
                    </div>

                    <div class="message-chat">
                    </div>
                </div>

            </div>
        </div>
    </div>
    <!-- End #main -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script src="../Scripts/jquery-3.4.1.min.js"></script>
    <script src="../Scripts/jquery.signalR-2.2.2.min.js"></script>
    <script src="../signalr/hubs"></script>

    <script type="text/javascript">
        $(function () {
            // Declare a proxy to reference the hub.
            var chatHub = $.connection.chatHub;
            registerClientMethods(chatHub);
            // Start Hub
            $.connection.hub.start().done(function () {
                registerEvents(chatHub);
            });
        });

        //var getValue = function (liId) {
        //    var liChildNode = document.getElementById(liId).childNodes;
        //    $('#chatName').empty();
        //    for (let child of liChildNode) {
        //        if (child.nodeName.toUpperCase() == 'DIV') {
        //            for (let i of child.childNodes) {
        //                if (typeof i.value != 'undefined')
        //                    console.log(i.value.toString().trim());//ID
        //                if (typeof i.innerText != 'undefined') {
        //                    console.log(i.innerHTML);
        //                    let name = i.innerHTML;
        //                    $('#chatName').append(name);  //i.innerText; //Div
        //                    /*$('#chatName').append(name);*/
        //                }
        //            }
        //        }
        //        //alert(child.nodeName);
        //    }
        //}

        function registerEvents(chatHub) {
            var name = '<%= this.UserName %>';
            
            if (name.length > 0) {
                chatHub.server.connect(name);
            }
        }

        function registerClientMethods(chatHub) {


            // Calls when user successfully logged in
            chatHub.client.onConnected = function (id, userName, allUsers, messages, times) {

                $('#hdId').val(id);
                $('#hdUserName').val(userName);
                $('#spanUser').html(userName);

                // Add All Users
                for (i = 0; i < allUsers.length; i++) {

                    AddUser(chatHub, allUsers[i].ConnectionId, allUsers[i].UserName, allUsers[i].UserImage, allUsers[i].LoginTime);
                }

                // Add Existing Messages
                for (i = 0; i < messages.length; i++) {
                    AddMessage(messages[i].UserName, messages[i].Message, messages[i].Time, messages[i].UserImage);
                }
            }

            // On New User Connected
            chatHub.client.onNewUserConnected = function (id, name, UserImage, loginDate) {
                AddUser(chatHub, id, name, UserImage, loginDate);
            }

            chatHub.client.messageReceived = function (userName, message, time, userimg) {

                AddMessage(userName, message, time, userimg);

                // Display Message Count and Notification
                var CurrUser1 = $('#hdUserName').val();
                if (CurrUser1 != userName) {

                    var msgcount = $('#MsgCountMain').html();
                    msgcount++;
                    $("#MsgCountMain").html(msgcount);
                    $("#MsgCountMain").attr("title", msgcount + ' New Messages');
                }
            }


            chatHub.client.sendPrivateMessage = function (windowId, fromUserName, message, userimg, CurrentDateTime) {

                var ctrId = 'inbox-message-' + windowId;
                if ($('#' + ctrId).length == 0) {

                    OpenPrivateChatBox(chatHub, windowId, ctrId, fromUserName, userimg);
                }

                var CurrUser = $('#hdUserName').val();
                var Side = 'my-message';
                var TimeSide = '';

                if (CurrUser == fromUserName) {
                    Side = 'info';
                    TimeSide = 'message-info';
                }
                else {
                    var msgcount = $('#' + ctrId).find('#MsgCountP').html();
                    msgcount++;
                    $('#' + ctrId).find('#MsgCountP').html(msgcount);
                    $('#' + ctrId).find('#MsgCountP').attr("title", msgcount + ' New Messages');
                }

                var divChatP = '<div class="message '+ Side +'">' +
                    '<img alt="" class="img-circle medium-image" src="' + userimg + '">' +
                    '<div class="message-body">' +
                    '<div class="message-body-inner">' +
                    '<div class="message-info">' +
                    '<h4>' + fromUserName + '</h4>' +
                    '<h5><i class="fa fa-clock-o"></i>' + CurrentDateTime + '</h5>' +
                    '</div>' +
                    '<hr>' +
                    '<div class="message-text">' + message + '</div>' +
                    '</div> </div> <br> </div>';

                $('#' + ctrId).find('#chatBody').append(divChatP);

                var htt = $('#' + ctrId).find('#chatBody')[0].scrollHeight;
                $('#' + ctrId).find('#chatBody').slimScroll({
                    height: htt
                });
            }

        }
        function OpenPrivateChatBox(chatHub, userId, ctrId, userName) {

            var PWClass = $('#PWCount').val();

            if ($('#PWCount').val() == 'info')
                PWClass = 'danger';
            else if ($('#PWCount').val() == 'danger')
                PWClass = 'warning';
            else
                PWClass = 'info';

            $('#PWCount').val(PWClass);
            var div1 = '<div class="tab-pane message-body" id="' + ctrId + '"' +
                ' <div class="message-top">' + userName +
                '<a class="btn btn btn-success new-message"><i class="fa fa-envelope"></i>New Message </a>' +
                '<input id="txtUserId" type="hidden" value=' + userId +'/>'+
                '<div class="new-message-wrapper">' +
                '< div class="form-group" >' +
                '<input type="text" class="form-control" placeholder="Send message to...">' +
                '<a class="btn btn-danger close-new-message" href="#"><i class="fa fa-times"></i></a>' + '</div>' +
                '<div class="chat-footer new-message-textarea">' +
                '<textarea class="send-message-text"></textarea>' +
                '<label class="upload-file">' +
                '<input type="file" required="">' +
                '<i class="fa fa-paperclip"></i>' +
                '</label>' +
                '<button type="button" class="send-message-button btn-info"><i class="fa fa-send"></i></button>' + '</div> </div> </div >' +
                '<div class="message-chat">' +
                '<div id="chatBody" class="chat-body">' +
                '<div class="message info">' +
                '</div>' +
                '</div>' +
                '<div class="chat-footer">' +
                '<textarea id="txtPrivateMessage" class="send-message-text"></textarea>' +
                '<label class="upload-file">' +
                '<input type="file" required="">' +
                '<i class="fa fa-paperclip"></i>' +
                '</label>' +
                '<button type="button" id="btnSendMessage" class="send-message-button btn-info"><i class="fa fa-send"></i></button>' +
                '</div>' +
                '</div>' +
                '</div>';

            var $div = $(div1);

            // Send Button event in Private Chat
            $div.find("#btnSendMessage").click(function () {

                $textBox = $div.find("#txtPrivateMessage");

                var msg = $textBox.val();
                if (msg.length > 0) {
                    chatHub.server.sendPrivateMessage(userId, msg);
                    $textBox.val('');
                }
            });

            // Text Box event on Enter Button
            $div.find("#txtPrivateMessage").keypress(function (e) {
                if (e.which == 13) {
                    $div.find("#btnSendMessage").click();
                }
            });

            // Append private chat div inside the main div
            $('#tabContent').append($div);
        }
        function GetCurrentDateTime(now) {

            var localdate = dateFormat(now, "dddd, mmmm dS, yyyy, h:MM:ss TT");

            return localdate;
        }

        function AddUser(chatHub, id, name, UserImage, date) {

            var userId = $('#hdId').val();

            var code;
            if (userId != id) {
                code = $('<li data-toggle="tab" data-target="#inbox-message-'+ id +'>'+
                    '<div id="MsgCountMain" title="0 New Messages" class="message-count">0</div>'+
                    '<img alt="" class="img-circle medium-image" src="' + UserImage +'">'+ 
                    '<div class="vcentered info-combo">' +
                    '<h3 class="no-margin-bottom name">' + name + '</h3>'+
                    '</div>'+
                    '<div class="contacts-add">'+
                    '<span class="message-time">' + date + '</span>' +
                    '<i class="fa fa-trash-o"></i>' +
                    '<i class="fa fa-paperclip"></i>' +
                    '</div>' +
                    '</li>');

                var UserLink = $('<a id="' + id + '" class="user" >' + name + '<a>');
                $(code).click(function () {
                    var id = $(UserLink).attr('id');

                    if (userId != id) {
                        var ctrId = 'inbox-message-' + id;
                        OpenPrivateChatBox(chatHub, id, ctrId, name);
                    }

                });
            }

            $("#divUsers").append(code);

        }

        function AddMessage(userName, message, time, userimg) {

            var CurrUser = $('#hdUserName').val();
            var Side = 'right';
            var TimeSide = 'left';

            if (CurrUser == userName) {
                Side = 'left';
                TimeSide = 'right';

            }

            var divChat = '<div class="direct-chat-msg ' + Side + '">' +
                '<div class="direct-chat-info clearfix">' +
                '<span class="direct-chat-name pull-' + Side + '">' + userName + '</span>' +
                '<span class="direct-chat-timestamp pull-' + TimeSide + '"">' + time + '</span>' +
                '</div>' +

                ' <img class="direct-chat-img" src="' + userimg + '" alt="Message User Image">' +
                ' <div class="direct-chat-text" >' + message + '</div> </div>';

            $('#divChatWindow').append(divChat);

            var height = $('#divChatWindow')[0].scrollHeight;
            $('#divChatWindow').scrollTop(height);

        }

    </script>

</asp:Content>
