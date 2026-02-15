<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="BRUH_Management_System.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration - BRUH Management System</title>
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <style>
        body {
            background-color: #d1f1fd;
        }
        .row {
            margin-top: 100px;
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
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid">
            <div class="row">
                <div class="col-sm-10 col-md-6 py-md-4">
                    <div class="form-container">
                        <div class="form-group">
                            <label for="user_email">Email: </label>
                            <asp:TextBox  ID="user_email" name="user_email" runat="server" CssClass="form-control" required TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="username">Username: </label>
                            <asp:TextBox ID="username" name="username" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="user_password">Password: </label>
                            <asp:TextBox TextMode="Password" ID="user_password" name="user_password" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="user_phone">Phone No: </label>
                            <asp:TextBox ID="user_phone" name="user_phone" runat="server" CssClass="form-control" required></asp:TextBox>
                        </div>
                        <asp:Button ID="Register" Onclick="Register_Click" runat="server" CssClass="btn btn-primary" Text="Register" />
                        <hr />
                        <span>Already have an account? <a href="/login" class="bold">Login here</a>.</span>
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    </form>

    <script src="Scripts/sweetalert2.all.min.js"></script>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>
