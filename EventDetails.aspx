<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EventDetails.aspx.cs" Inherits="BRUH_Management_System.EventDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
        @media only screen and (min-width: 991px) {
            .row {
                display: -webkit-box;
                display: -webkit-flex;
                display: -ms-flexbox;
                display: flex;
            }
            .row > [class*='col-'] {
                display: flex;
                flex-direction: column;
            }
            .padding-right {
                padding-right: 0px;
            }
            .padding-left {
                padding-left: 0px;
            }
        }
        .event-detail-section {
            background-color: #d1f1fd;
            padding: 20px;
            height: 100%;
        }

        .gmap {
            width: 100%;
            margin-top: 15px
        }

        .description-section {
            background-color: #addcee;
            padding: 20px;
            height: 100%;
        }
        .signup-btn {
            margin-top: 40px;
            margin-right: auto;
            margin-left: auto;
            display: flex;
            padding: 15px 20px;
            border-radius: 25%/50%;
        }
    </style>

    <div class="header">
        <h1 id="event_title" runat="server"></h1>
    </div>

    <div class="row">
        <div class="col-md-4 padding-right">
            <div class="event-detail-section">
                <h3>Start time:</h3>
                <asp:Label ID="start_time_lbl" runat="server" Text=""></asp:Label>
                <h3>End time:</h3>
                <asp:Label ID="end_time_lbl" runat="server" Text=""></asp:Label>
                <h3>Venue:</h3>
                <asp:Label ID="venue_lbl" runat="server" Text=""></asp:Label>
                <div class="gmap">
                    <iframe
                        width="100%"
                        height="300"
                        frameborder="0"
                        scrolling="no"
                        marginheight="0"
                        marginwidth="0"
                        src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=No.%2022-2,%20Jalan%20Kuchai%20Maju%2019,%20Dinasti%20Sentral,%20Off%20Jalan%20Kuchai%20Lama,%2058200,%20Kuala%20Lumpur,%20Wilayah%20Persekutuan,%20Malaysia,%2058200%20Kuala%20Lumpur+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed">
                    </iframe>
                </div>
            </div>
        </div>
        <div class="col-md-8 padding-left">
            <div class="description-section">
                <h3>Event description</h3>
                <asp:Label ID="description_lbl" runat="server" Text=""></asp:Label>
                <br />
                <br />
                <asp:Button ID="signup_btn" runat="server" Text="Sign Up Now" CssClass="btn btn-primary signup-btn" OnClick="signup_btn_Click" />
            </div>
        </div>
    </div>
</asp:Content>
