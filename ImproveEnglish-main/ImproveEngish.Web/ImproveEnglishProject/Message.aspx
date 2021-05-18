<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.Message" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

    <link rel="stylesheet" href="/ImproveEnglishProject/assets/css/message.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main" style="margin-top: 10%;">
        <div class="container">
            <div class="row clearfix">
                <div class="col-lg-12">
                    <div class="card chat-app">
                        <div id="plist" class="people-list">
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"><i class="fa fa-search"></i></span>
                                    <input hidden type="text" id="txtFromStudentId" value="<%=Session["StudentId"] %>" />
                                </div>
                                <input type="text" class="form-control" placeholder="Search...">
                            </div>
                            <ul class="list-unstyled chat-list mt-2 mb-0">
                                <asp:Repeater runat="server" ID="rptRelationship">
                                    <ItemTemplate>
                                        <li id="liAvatar<%#Eval("StudentId") %>" class="clearfix" onclick="getValue(this.id)">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar">
                                            <div class="about">
                                                <div class="name" id="listName<%#Eval("StudentId") %>"><%#Eval("NameSurname") %></div>
                                                <input hidden="" type="text" id="studentId" value="<%#Eval("StudentId") %>" />
                                            </div>
                                        </li>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </div>
                        <div class="chat">
                            <div class="chat-header clearfix">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <a href="javascript:void(0);" data-toggle="modal" data-target="#view_info">
                                            <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="avatar">
                                        </a>
                                        <div class="chat-about">
                                            <div class="m-b-0" id="chatName"></div>
                                            <small>Last seen: 2 hours ago</small>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 hidden-sm text-right">
                                        <a href="javascript:void(0);" class="btn btn-outline-secondary"><i class="fa fa-camera"></i></a>
                                        <a href="javascript:void(0);" class="btn btn-outline-primary"><i class="fa fa-image"></i></a>
                                        <a href="javascript:void(0);" class="btn btn-outline-info"><i class="fa fa-cogs"></i></a>
                                        <a href="javascript:void(0);" class="btn btn-outline-warning"><i class="fa fa-question"></i></a>
                                    </div>
                                </div>
                            </div>
                            <div class="chat-history">
                                <ul class="m-b-0" id="messageContent">
                                </ul>
                            </div>
                            <div class="chat-message clearfix">
                                <div class="input-group mb-0">
                                    <input type="button" class="input-group-prepend" id="btnSendMessage">
                                        <span class="input-group-text"><i class="fa fa-send"></i></span>
                                    </input>
                                    <input type="text" id="txtMessage" class="form-control" placeholder="Enter text here...">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- End #main -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
    <script
        src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
    <script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
    <script src="../Scripts/jquery-3.4.1.js"></script>
    <script src="../Scripts/jquery.signalR-2.2.2.js"></script>
    <script src="/signalr/hubs"></script>

    <script type="text/javascript">
        $(function () {

            // Declare a proxy to reference the hub. 
            var chatHub = $.connection.chatHub;

            // Start Hub
            $.connection.hub.start().done(function () {
                registerEvents(chatHub);
            });

            

        });
        function registerEvents(chatHub) {

            //$("#btnStartChat").click(function () {

            //    var name = $("#txtNickName").val();
            //    if (name.length > 0) {
            //        chatHub.server.connect(name);
            //    }
            //    else {
            //        alert("Please enter name");
            //    }

            //});


            //$('#btnSendMsg').click(function () {

            //    var msg = $("#txtMessage").val();
            //    if (msg.length > 0) {

            //        var userName = $('#hdUserName').val();
            //        chatHub.server.sendMessageToAll(userName, msg);
            //        $("#txtMessage").val('');
            //    }
            //});


            //$("#txtNickName").keypress(function (e) {
            //    if (e.which == 13) {
            //        $("#btnStartChat").click();
            //    }
            //});

            //$("#txtMessage").keypress(function (e) {
            //    if (e.which == 13) {
            //        $('#btnSendMsg').click();
            //    }
            //});

            $("#btnSendMessage").on('click', function () {
                var fromSudentId = $("#txtFromStudentId").val();
                var msg = $("#txtMessage").val();
                if (msg.length > 0) {
                    var toUserId = $('#studentId').val();
                    chatHub.server.sendPrivateMessage(fromSudentId, toUserId, msg);
                    $("#txtMessage").val('');
                    var div = ' <li class="clearfix">' +
                        '<div class="message-data text-right">' +
                        '<span class="message-data-time">' + Date.now() + '</span>' +
                        '<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="avatar">' +
                        '</div>' +
                        '<div class="message other-message float-right">' + msg + '</div>' +
                        '</div>' +
                        '</li>';
                    $("#messageContent").append(div);
                }
            });
        }
        function registerClientMethods(chatHub) {

            // Calls when user successfully logged in
            chatHub.client.onConnected = function (id, userName, allUsers, messages) {

                $('#hdId').val(id);
                $('#hdUserName').val(userName);
                $('#spanUser').html(userName);

                // Add All Users
                for (i = 0; i < allUsers.length; i++) {

                    AddUser(chatHub, allUsers[i].ConnectionId, allUsers[i].UserName);
                }

                // Add Existing Messages
                for (i = 0; i < messages.length; i++) {

                    AddMessage(messages[i].UserName, messages[i].Message);
                }


            }

            // On New User Connected
            chatHub.client.onNewUserConnected = function (id, name) {

                AddUser(chatHub, id, name);
            }


            // On User Disconnected
            chatHub.client.onUserDisconnected = function (id, userName) {

                $('#' + id).remove();

                var ctrId = 'private_' + id;
                $('#' + ctrId).remove();


                var disc = $('<div class="disconnect">"' + userName + '" logged off.</div>');

                $(disc).hide();
                $('#divusers').prepend(disc);
                $(disc).fadeIn(200).delay(2000).fadeOut(200);

            }

            chatHub.client.messageReceived = function (userName, message) {

                AddMessage(userName, message);
            }


            //chatHub.client.sendPrivateMessage = function (, fromUserName, message) {

            //    var ctrId = 'private_' + windowId;


            //    if ($('#' + ctrId).length == 0) {

            //        createPrivateChatWindow(chatHub, windowId, ctrId, fromUserName);

            //    }

            //    $('#' + ctrId).find('#divMessage').append('<div class="message"><span class="userName">' + fromUserName + '</span>: ' + message + '</div>');

            //    // set scrollbar
            //    var height = $('#' + ctrId).find('#divMessage')[0].scrollHeight;
            //    $('#' + ctrId).find('#divMessage').scrollTop(height);


            //}

        }
        function AddUser(chatHub, id, name) {

            var userId = $('#hdId').val();

            var code = "";

            if (userId == id) {

                code = $('<div class="loginUser">' + name + "</div>");

            }
            else {

                code = $('<a id="' + id + '" class="user" >' + name + '<a>');

                $(code).dblclick(function () {

                    var id = $(this).attr('id');

                    if (userId != id)
                        OpenPrivateChatWindow(chatHub, id, name);

                });
            }

            $("#divusers").append(code);

        }
        function AddMessage(userName, message) {
            $('#divChatWindow').append('<div class="message"><span class="userName">' + userName + '</span>: ' + message + '</div>');

            var height = $('#divChatWindow')[0].scrollHeight;
            $('#divChatWindow').scrollTop(height);
        }
        function createPrivateChatWindow(chatHub, userId, ctrId, userName) {

            // DELETE BUTTON IMAGE
            //$div.find('#imgDelete').click(function () {
            //    $('#' + ctrId).remove();
            //});

            // Send Button event
            //$("#btnSendMessage").click(function () {

            //    $textBox = $div.find("#txtMessage");
            //    var msg = $textBox.val();
            //    if (msg.length > 0) {

            //        chatHub.server.sendPrivateMessage(userId, msg);
            //        $textBox.val('');
            //    }
            //});

            // Text Box event
            //$div.find("#txtMessage").keypress(function (e) {
            //    if (e.which == 13) {
            //        $div.find("#btnSendMessage").click();
            //    }
            //});
            //var sendMessage = function () {
            //    alert("Im working");
            //}


            AddDivToContainer($div);

        }

        function AddDivToContainer($div) {
            $('#divContainer').prepend($div);

            $div.draggable({

                handle: ".header",
                stop: function () {

                }
            });
        }

        var getValue = function (liId) {
            var liChildNode = document.getElementById(liId).childNodes;
            $('#chatName').empty();
            for (let child of liChildNode) {
                if (child.nodeName.toUpperCase() == 'DIV') {
                    for (let i of child.childNodes) {
                        if (typeof i.value != 'undefined')
                            console.log(i.value.toString().trim());//ID
                        if (typeof i.innerText != 'undefined') {
                            console.log(i.innerHTML);
                            let name = i.innerHTML;
                            $('#chatName').append(name);  //i.innerText; //Div
                            /*$('#chatName').append(name);*/
                        }


                    }
                }
                //alert(child.nodeName);
            }
        }

    </script>

</asp:Content>
