﻿<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Site.Master" AutoEventWireup="true" CodeBehind="AdminBookIssuing.aspx.cs" Inherits="WebApplication_LibraryManagementProject.UI.WebForm8" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
        $(document).ready(function () {
            $("#body_StartDateTextBox").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "2000:2025",
                dateFormat: 'dd-mm-yy'
            });
            $("#body_ReturnDateTextBox").datepicker({
                changeMonth: true,
                changeYear: true,
                yearRange: "2000:2025",
                dateFormat: 'dd-mm-yy'
            });
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="server">

    
    <div class="container-fluid">
        <div class="row justify-content-center">

            <!-- Assign book section-->
            <div class="col-md-5">
                <div class="card" style="margin: 10px">
                    <div class="card-body">
                        <div class="row">
                            <div class="col text-center">
                                <h3>Book Lending</h3>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col text-center">
                                <img width="100px" src="../Images/books.png" />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="body_UsernameTextBox">Username</label>
                                    <asp:TextBox class="form-control" placeholder="Username" ID="UsernameTextBox" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="body_BookIdTextBox">Book ID</label>
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" placeholder="Book ID" ID="BookIdTextBox" runat="server"></asp:TextBox>
                                        <asp:Button CssClass="btn btn-dark" ID="GoButton" runat="server" Text="Go" OnClick="GoButton_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="body_MemberNameTextBox">Member Name</label>
                                    <asp:TextBox class="form-control" placeholder="Member Name" ID="MemberNameTextBox" runat="server" ReadOnly="true"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="body_BookNameTextBox">Book Name</label>
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" placeholder="Book Name" ID="BookNameTextBox" runat="server" ReadOnly="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="body_StartDateTextBox">Start Date</label>
                                    <asp:TextBox class="form-control" placeholder="Start Date" ID="StartDateTextBox" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="body_EndDateTextBox">Return Date</label>
                                    <div class="input-group">
                                        <asp:TextBox class="form-control" placeholder="Return Date" ID="ReturnDateTextBox" runat="server"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <asp:Button CssClass="btn btn-block btn-primary" ID="IssueButton" runat="server" Text="Assign book" OnClick="IssueButton_Click" />
                            </div>
                            <div class="col-md-6">
                                <asp:Button CssClass="btn btn-block btn-success" ID="ReturnButton" runat="server" Text="Return book" OnClick="ReturnButton_Click" />
                            </div>
                            <div class="col text-center">
                                <asp:Label ID="ErrorLabel" runat="server" Text="" CssClass="text-danger"></asp:Label>
                            </div>
                            <br />
                            <br />
                        </div>
                    </div>
                </div>
                
            </div>

    </div>

</asp:Content>
