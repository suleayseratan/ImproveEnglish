<%@ Page Title="" Language="C#" MasterPageFile="~/ImproveEnglishProject/Page.Master" AutoEventWireup="true" CodeBehind="GroupMeetingDetail.aspx.cs" Inherits="ImproveEngish.Web.ImproveEnglishProject.GroupMeetingDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="server">
    <main id="main">

        <!-- ======= Breadcrumbs ======= -->
        <div class="breadcrumbs" data-aos="fade-in">
            <div class="container">
                <h2>Course Details</h2>
                <p>Est dolorum ut non facere possimus quibusdam eligendi voluptatem. Quia id aut similique quia voluptas sit quaerat debitis. Rerum omnis ipsam aperiam consequatur laboriosam nemo harum praesentium. </p>
            </div>
        </div>
        <!-- End Breadcrumbs -->

        <!-- ======= Cource Details Section ======= -->
        <section id="course-details" class="course-details">
            <div class="container" data-aos="fade-up">
                <asp:Repeater runat="server" ID="rptGroupDetail">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-lg-8">
                                <img src="<%#Eval("GroupImagePath") %>" class="img-fluid" alt="">
                                <h3><%#Eval("GroupName") %></h3>
                                <p>
                                  <%#Eval("GroupExplanation") %>
                                </p>
                            </div>
                            <div class="col-lg-4">

                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5>Subject</h5>
                                    <p><a href="#"><%#Eval("GroupSubject") %></a></p>
                                </div>

                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5>Created By</h5>
                                    <p><%#Eval("CreatorNameSurname") %></p>
                                </div>

                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5>Number of members</h5>
                                    <p><%#Eval("NumberOfGroupMembers") %></p>
                                </div>

                                <div class="course-info d-flex justify-content-between align-items-center">
                                    <h5>Schedule</h5>
                                    <p><%#Eval("GroupMeetingDate","{0:MM/dd/yyyy}") %> <%#DateTime.Parse(Eval("GroupMeetingTime").ToString()).ToString("hh:mm tt") %></p>
                                </div>

                                <div class="d-flex justify-content-between align-items-center">
                                    <button class="btn btn-primary w-100">Join</button>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </section>
        <!-- End Cource Details Section -->
    </main>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="js" runat="server">
</asp:Content>
