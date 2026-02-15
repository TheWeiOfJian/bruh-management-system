<%@ Page Title="" Language="C#" MasterPageFile="~/ProgramManager/Admin.Master" AutoEventWireup="true" CodeBehind="AddStage.aspx.cs" Inherits="BRUH_Management_System.ProgramManager.AddStage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="eventID" runat="server"></asp:Label>
    <div>
    <label for="stage_name">Stage Name: </label>
    <asp:TextBox ID="stage_name" name="stage_name" runat="server" required></asp:TextBox>
    <label for="stage_desc">Stage Description: </label>
    <asp:TextBox ID="stage_desc" name="stage_desc" runat="server" required></asp:TextBox>
    <label for="event_start">Event Start Time: </label>
    <asp:TextBox ID="event_start" CssClass="date_time" name="event_start" runat="server" required TextMode="DateTimeLocal"></asp:TextBox>
    <label for="event_end">Event End Time: </label>
    <asp:TextBox ID="event_end" CssClass="date_time" name="event_end" runat="server" required TextMode="DateTimeLocal"></asp:TextBox>
    <label for="event_venue">Event Venue: </label>
    <asp:TextBox ID="event_venue" name="event_venue" runat="server" required></asp:TextBox>
        <asp:Button ID="CreateBtn" OnClick="CreateBtn_Click" runat="server" Text="Create" />
        
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Event]"></asp:SqlDataSource>




</asp:Content>
