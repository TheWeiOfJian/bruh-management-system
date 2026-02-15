<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="BRUH_Management_System.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome - BRUH Management System</title>
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
                        <div id="login_alert" runat="server" class="alert alert-danger bold" role="alert">
                            Email or password is invalid. If you do not have an account, 
                            <a href="/register" class="text-danger font-weight-bold">sign up here</a>.
                        </div>
                        <div class="form-group">
                            <label for="user_email">Email: </label>
                            <asp:TextBox ID="user_email" name="user_email" runat="server" CssClass="form-control" required TextMode="Email"></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label for="user_password">Password: </label>
                            <asp:TextBox TextMode="Password" ID="user_password" name="user_password" CssClass="form-control" runat="server" required></asp:TextBox>
                        </div>
                        <asp:Button ID="LoginBtn" Onclick="Login_Click" CssClass="btn btn-primary" runat="server" Text="Login" />
                        <hr />
                        <span>Do not have an account? <a href="/registration" class="bold">sign up here</a>.</span>
                    </div>
                </div>
            </div>
            
        </div>
        <asp:SqlDataSource ID="LoginSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    </form>

    <script src="Scripts/sweetalert2.all.min.js"></script>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>
