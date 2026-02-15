<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyEvents.aspx.cs" Inherits="BRUH_Management_System.MyEvents" %>

<asp:Content ID="MyEventsContent" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        /* Header/Logo Title */
        .header {
            padding: 60px;
            text-align: center;
            background-image: url("/Images/banner.jpg");
            background-size: cover;
            color: white;
            font-size: 30px;
        }
        .description-fade {
            height: 100px;
            width: 100%;
            white-space: normal;
            overflow: hidden;
            position: relative;
        }
        .description-fade::before {
            background-image: linear-gradient( top, rgba( 255, 255, 255, 0 ) 0%, rgba( 255, 255, 255, 1 ) 100% );
            background-image: -moz-linear-gradient( top, rgba( 255, 255, 255, 0 ) 0%, rgba( 255, 255, 255, 1 ) 100% );
            background-image: -ms-linear-gradient( top, rgba( 255, 255, 255, 0 ) 0%, rgba( 255, 255, 255, 1 ) 100% );
            background-image: -o-linear-gradient( top, rgba( 255, 255, 255, 0 ) 0%, rgba( 255, 255, 255, 1 ) 100% );
            background-image: -webkit-linear-gradient( top, rgba( 255, 255, 255, 0 ) 0%, rgba( 255, 255, 255, 1 ) 100% );
            content: "\00a0";
            height: 100%;
            position: absolute;
            width: 100%;
        }
        .panel-body {
            padding: 30px;
        }
    </style>

    <div class="header">
        <h1>My Events</h1>
    </div>

    <div class="container">
        <h1>Ongoing Events</h1>
        <h2 id="no_ongoing" runat="server">No Events found!</h2>
        <div class="row">
            <asp:DataList ID="DataListMyOngoingEvents" runat="server" DataKeyField="Id" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <ItemTemplate>
                    <div class="col-6 col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <strong>
                                    <h2>
                                        <asp:Label ID="event_titleLabel" runat="server" Text='<%# Eval("event_title") %>' />
                                    </h2>
                                </strong>
                                <br />
                                <div class="description-fade">
                                    <asp:Label ID="event_descriptionLabel" runat="server" Text='<%# Eval("event_description") %>' />
                                </div>
                                <br />

                                Start Time:
                                <asp:Label ID="start_timeLabel" runat="server" Text='<%# Eval("start_time") %>' />
                                <br />
                                End Time
                                <asp:Label ID="end_timeLabel" runat="server" Text='<%# Eval("end_time") %>' />
                                <br />
                                Venue:
                                <asp:Label ID="venueLabel" runat="server" Text='<%# Eval("venue") %>' />
                                <br />
                                <br />

                                <a href="#" class="btn btn-primary">View Progress</a>

                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <hr />
        <h1>Upcoming Events</h1>
        <h2 id="no_upcoming" runat="server">No Events found!</h2>
        <div class="row">
            <asp:DataList ID="DataListMyUpcomingEvents" runat="server" DataKeyField="Id" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <ItemTemplate>
                    <div class="col-6 col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <strong>
                                    <h2>
                                        <asp:Label ID="event_titleLabel" runat="server" Text='<%# Eval("event_title") %>' />
                                    </h2>
                                </strong>
                                <br />
                                <div class="description-fade">
                                    <asp:Label ID="event_descriptionLabel" runat="server" Text='<%# Eval("event_description") %>' />
                                </div>
                                <br />

                                Start Time:
                                <asp:Label ID="start_timeLabel" runat="server" Text='<%# Eval("start_time") %>' />
                                <br />
                                End Time
                                <asp:Label ID="end_timeLabel" runat="server" Text='<%# Eval("end_time") %>' />
                                <br />
                                Venue:
                                <asp:Label ID="venueLabel" runat="server" Text='<%# Eval("venue") %>' />
                                <br />
                                <br />
                                <a href="#" class="btn btn-primary">View Progress</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
        <hr />
        <h1>Past Events</h1>
        <h2 id="no_past" runat="server">No Events found!</h2>
        <div class="row">
            <asp:DataList ID="DataListMyPastEvents" runat="server" DataKeyField="Id" RepeatColumns="3" RepeatDirection="Horizontal" RepeatLayout="Flow">
                <ItemTemplate>
                    <div class="col-6 col-md-4">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <strong>
                                    <h2>
                                        <asp:Label ID="event_titleLabel" runat="server" Text='<%# Eval("event_title") %>' />
                                    </h2>
                                </strong>
                                <br />
                                <div class="description-fade">
                                    <asp:Label ID="event_descriptionLabel" runat="server" Text='<%# Eval("event_description") %>' />
                                </div>
                                <br />

                                Start Time:
                                <asp:Label ID="start_timeLabel" runat="server" Text='<%# Eval("start_time") %>' />
                                <br />
                                End Time
                                <asp:Label ID="end_timeLabel" runat="server" Text='<%# Eval("end_time") %>' />
                                <br />
                                Venue:
                                <asp:Label ID="venueLabel" runat="server" Text='<%# Eval("venue") %>' />
                                <br />
                                <br />
                                <a href="#" class="btn btn-primary">View Progress</a>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </div>
</asp:Content>
