<%@ Page Title="" Language="C#" MasterPageFile="~/ProgramManager/Admin.Master" AutoEventWireup="true" CodeBehind="EventDashboard.aspx.cs" Inherits="BRUH_Management_System.ProgramManager.EventDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <%--<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>--%>
    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
    <style>
        h2 {
            font-size: 5rem;
            text-transform: uppercase;
        }

        h5 {
            font-size: 1.8rem;
        }

        .flex {
            display: flex;
            justify-content: space-between;
            font-size: 2rem;
            padding: 50px 0;
            width: 90%;
        }

        .center {
            display: flex;
            justify-content: center;
        }

        canvas {
            margin: 20px 0;
        }
    </style>
    <style>
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
            /*background-color: #addcee;*/
            padding: 20px;
            height: 100%;
            border: 1px solid #999;
            border-radius: 5px;
        }

        .gmap {
            width: 100%;
            margin-top: 15px
        }

        .description-section {
            /*background-color: #addcee;*/
            padding: 20px;
            height: 100%;
            border: 1px solid #999;
            border-radius: 5px;
        }

        img {
            width: 30px;
            height: 30px;
            margin-right: 10px;
        }

        table {
            margin: 5vh 0;
        }
        .update-btn {
            margin-top: 40px;
            margin-right: auto;
            margin-left: auto;
            display: flex;
            padding: 15px 20px;
            justify-content: center;
        }
    </style>
    <div class="row">
        <div class="col-md-4 padding-right">
            <div class="event-detail-section">
                <h2>
                    <asp:Label ID="event_title" runat="server"></asp:Label></h2>
                <h5>
                    <asp:Label ID="event_timeline" runat="server"></asp:Label></h5>
                <h5>
                    <img src="../Images/map.png" /><asp:Label ID="event_venue" runat="server"></asp:Label></h5>
                <div class="gmap">
                    <iframe
                        width="100%"
                        height="300"
                        frameborder="0"
                        scrolling="no"
                        marginheight="0"
                        marginwidth="0"
                        src="https://maps.google.com/maps?width=100%25&amp;height=600&amp;hl=en&amp;q=No.%2022-2,%20Jalan%20Kuchai%20Maju%2019,%20Dinasti%20Sentral,%20Off%20Jalan%20Kuchai%20Lama,%2058200,%20Kuala%20Lumpur,%20Wilayah%20Persekutuan,%20Malaysia,%2058200%20Kuala%20Lumpur+(My%20Business%20Name)&amp;t=&amp;z=14&amp;ie=UTF8&amp;iwloc=B&amp;output=embed"></iframe>
                </div>
                <asp:PlaceHolder ID="update_link_PlaceHolder" runat="server"></asp:PlaceHolder>
            </div>
        </div>
        <div class="col-md-8 padding-left">
            <div class="description-section">
                <canvas id="displaychart" width="100" height="50"></canvas>
                <div class="center">
                    <div class="flex">
                        <asp:Label ID="output1" runat="server"></asp:Label>
                        <asp:Label ID="output2" runat="server"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <asp:Label ID="output3" runat="server"></asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Event]"></asp:SqlDataSource>
    <h2 style="font-size: 3rem">Participants</h2>

    <asp:HiddenField ID="HiddenField1" runat="server" Value="[0, 10, 5, 2, 20, 30, 45]" />
    <table class="table">
        <thead>
            <th scope="col">No.</th>
            <th scope="col">User Email</th>
            <th scope="col">Username</th>
            <th scope="col">Phone No.</th>
        </thead>
        <tbody>
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
        </tbody>
    </table>
    <script>
        var ctx = document.getElementById('displaychart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['July', 'Aug', 'Sept', 'Oct', 'Nov'],
                datasets: [{
                    label: 'ITDP Registration by Months',
                    data: [2, 3, 4, 10, 4],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>

</asp:Content>
