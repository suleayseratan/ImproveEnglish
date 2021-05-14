<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ImproveEngish.Web.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <link rel="stylesheet" href="/ImproveEnglishProject/assets/css/message.css">
</head>
<body>
    <form id="form1" runat="server">
        <main id="main" style="margin-top: 5%;">
            <input type="text" id="txtName" />
            <button type="button" id="btnLogin">Giriş</button>
                            
            <div class="alert alert-success" id="clientDurumMesajlari" style="display: none"></div>
            <i class="fa fa-chevron-down expand-button" aria-hidden="true"></i>
            <div id="frame">
                <div id="sidepanel">
                    <div id="profile">
                        <div class="wrap">
                            <img id="profile-img" src="http://emilcarlsson.se/assets/mikeross.png" class="online" alt="" />
                            <p>Mike Ross</p>
                            
                            <div id="status-options">
                                <ul>
                                    <li id="status-online" class="active"><span class="status-circle"></span>
                                        <p>Online</p>
                                    </li>
                                    <li id="status-away"><span class="status-circle"></span>
                                        <p>Away</p>
                                    </li>
                                    <li id="status-busy"><span class="status-circle"></span>
                                        <p>Busy</p>
                                    </li>
                                    <li id="status-offline"><span class="status-circle"></span>
                                        <p>Offline</p>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div id="search">
                        <label for=""><i class="fa fa-search" aria-hidden="true"></i></label>
                        <input type="text" placeholder="Search contacts..." />
                    </div>
                    <div id="contacts">
                        <ul>
                            <li class="contact active">
                                <div class="wrap">
                                    <span class="contact-status busy"></span>
                                    <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                                    <div class="meta">
                                        <p class="name">Harvey Specter</p>
                                        <p class="preview">
                                            Wrong. You take the gun, or you pull out a bigger one. Or, you
                                        call their bluff. Or,
                                        you do any one of a hundred and forty six other things.
                                   
                                        </p>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div id="bottom-bar">
                        <button id="addcontact">
                            <i class="fa fa-user-plus fa-fw" aria-hidden="true"></i><span>Add
                            contact</span></button>
                        <button id="settings">
                            <i class="fa fa-cog fa-fw" aria-hidden="true"></i>
                            <span>Settings</span></button>
                    </div>
                </div>
                <div class="content">
                    <div class="contact-profile">
                        <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                        <p>Harvey Specter</p>
                    </div>
                    <div class="messages" style="width: 100% !important;">
                        <ul>
                            <li class="sent">
                                <img src="http://emilcarlsson.se/assets/mikeross.png" alt="" />
                                <p>What are you talking about? You do what they say or they shoot you.</p>
                            </li>
                            <li class="replies">
                                <img src="http://emilcarlsson.se/assets/harveyspecter.png" alt="" />
                                <p>
                                    Wrong. You take the gun, or you pull out a bigger one. Or, you call their bluff. Or, you
                                do any one of a
                                hundred and forty six other things.
                           
                                </p>
                            </li>
                        </ul>
                    </div>
                    <div class="message-input">
                        <div class="wrap">
                            <input type="text" placeholder="Write your message..." />
                            <i class="fa fa-paperclip attachment" aria-hidden="true"></i>
                            <button id="btnSend" class="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>
            </div>

        </main>
    </form>
</body>
<script src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
<script src='https://code.jquery.com/jquery-2.2.4.min.js'></script>
<script src="Scripts/jquery-3.4.1.min.js"></script>
<script src="Scripts/jquery.signalR-2.2.2.min.js"></script>
<script src="/signalr/hubs"></script>
<script>
    $(".messages").animate({ scrollTop: $(document).height() }, "fast");

    $("#profile-img").click(function () {
        $("#status-options").toggleClass("active");
    });

    $(".expand-button").click(function () {
        $("#profile").toggleClass("expanded");
        $("#contacts").toggleClass("expanded");
    });

    $("#status-options ul li").click(function () {
        $("#profile-img").removeClass();
        $("#status-online").removeClass("active");
        $("#status-away").removeClass("active");
        $("#status-busy").removeClass("active");
        $("#status-offline").removeClass("active");
        $(this).addClass("active");

        if ($("#status-online").hasClass("active")) {
            $("#profile-img").addClass("online");
        } else if ($("#status-away").hasClass("active")) {
            $("#profile-img").addClass("away");
        } else if ($("#status-busy").hasClass("active")) {
            $("#profile-img").addClass("busy");
        } else if ($("#status-offline").hasClass("active")) {
            $("#profile-img").addClass("offline");
        } else {
            $("#profile-img").removeClass();
        };

        $("#status-options").removeClass("active");
    });

    function newMessage() {
        message = $(".message-input input").val();
        if ($.trim(message) == '') {
            return false;
        }
        $('<li class="sent"><img src="http://emilcarlsson.se/assets/mikeross.png" alt="" /><p>' + message + '</p></li>').appendTo($('.messages ul'));
        $('.message-input input').val(null);
        $('.contact.active .preview').html('<span>You: </span>' + message);
        $(".messages").animate({ scrollTop: $(document).height() }, "fast");
    };

    //$('.submit').click(function () {
    //    newMessage();
    //});

    $(window).on('keydown', function (e) {
        if (e.which == 13) {
            newMessage();
            return false;
        }
    });

    //# sourceURL=pen.js

    $(document).ready(() => {


        $('#btnLogin').click(function() {
            const name = $("#txtName").val();
            connection.invok("GetNickName", name).catch(error => console.log(error));
        });

        chat.client.clientJoined = function (name){
            $("#clientDurumMesajlari").fadeIn(2000,
                () => {
                    $("#clientDurumMesajlari").html(`${name} giriş yaptı`);
                    setTimeout(() => {
                            $("#clientDurumMesajlari").fadeOut(2000);
                        },
                        2000);
                });

        };
    });
    </script>
</html>
