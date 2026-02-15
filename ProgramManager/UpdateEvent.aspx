<%@ Page Title="" Language="C#" MasterPageFile="~/ProgramManager/Admin.Master" AutoEventWireup="true" CodeBehind="UpdateEvent.aspx.cs" Inherits="BRUH_Management_System.ProgramManager.UpdateEvent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <style>
        body {
            background-color: #d1f1fd;
        }

        .header {
            padding: 60px;
            text-align: center;
            font-size: 30px;
        }

        .row {
            display: flex;
            justify-content: center;
        }

        .form-container {
            background-color: white;
            padding: 40px;
            box-shadow: 0 10px 16px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
            border-radius: 7px;
        }

        .bold {
            font-weight: bold;
        }
    </style>

    <div class="header">
        <h1>Update Event</h1>
    </div>

    <div class="row">
        <div class="col-sm-10 col-md-6 py-md-4">
            <div class="form-container">
                <div class="form-group">
                    <label for="event_title">Event Title: </label>
                    <asp:TextBox ID="event_title" name="event_title" runat="server" CssClass="form-control" ReadOnly></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="event_desc">Event Description: </label>
                    <asp:TextBox ID="event_desc" name="event_desc" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="event_start">Event Start Time: </label>
                    <asp:TextBox ID="event_start" CssClass="date_time form-control" name="event_start" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="event_end">Event End Time: </label>
                    <asp:TextBox ID="event_end" CssClass="date_time form-control" name="event_end" runat="server" TextMode="DateTimeLocal"></asp:TextBox>
                </div>
                <div class="form-group">
                    <label for="event_venue">Event Venue: </label>
                    <asp:TextBox ID="event_venue" name="event_venue" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <asp:Button ID="UpdateBtn" OnClick="UpdateBtn_Click" runat="server" CssClass="btn btn-primary" Text="Update" />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Event]"></asp:SqlDataSource>
</asp:Content>
