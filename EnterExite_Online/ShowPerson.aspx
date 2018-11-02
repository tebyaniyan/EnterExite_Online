<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MainMaster.Master" AutoEventWireup="true" CodeBehind="ShowPerson.aspx.cs" Inherits="EnterExite_Online.ShowPerson" %>

<%@ Register Assembly="Trirand.Web" TagPrefix="trirand" Namespace="Trirand.Web.UI.WebControls" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" type="text/css" media="screen" href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.10.0/themes/redmond/jquery-ui.css" />
    <script src="http://ajax.microsoft.com/ajax/jquery/jquery-1.9.0.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">

    <section class="contact">
        <div class="container">
            <div class="row">
                <div class="contact-caption clearfix">
                    <div class="contact-heading text-center">
                        <h2>مدیریت ورود خروج پرسنل</h2>

                    </div>

                    <div class="col-md-8 col-md-offset-1 contact-form">
                        <h3>
                            <asp:Label ID="lblWelcom" runat="server"></asp:Label>
                        </h3>
                        <div class="info-detail">
                            <asp:LinqDataSource ID="dsListReportPerson" runat="server" OnSelecting="dsListReportPerson_Selecting"></asp:LinqDataSource>
                            <asp:GridView ID="gvListPerson"  AllowPaging="true" PageSize="7" CssClass="table table-striped table-bordered table-hover"  Width="100%" runat="server" DataSourceID="dsListReportPerson" AutoGenerateColumns="False">
                                <Columns>
                                    <asp:BoundField DataField="PersonID" Visible="false"></asp:BoundField>
                                    <asp:BoundField DataField="FullName" HeaderText="نام"></asp:BoundField>
                                    <asp:BoundField DataField="EnterExiteType" HeaderText="وضعیت کارمند"></asp:BoundField>

                                    <asp:BoundField DataField="EnterExiteType" HeaderText="وضعیت کارمند"></asp:BoundField>

                                    <asp:BoundField DataField="Date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="تاریخ"></asp:BoundField>

                                    <asp:BoundField DataField="Time" DataFormatString="{0:HH:mm}" HeaderText="ساعت"></asp:BoundField>

                                    <asp:BoundField DataField="Present" HeaderText="وضعیت در شرکت"></asp:BoundField>



                                </Columns>
                                <Columns>
                                </Columns>
                            </asp:GridView>
                    
                            <br />
                        </div>
                        <br />
                    </div>


                    <div class="col-md-3 contact-info text-left">
                        <h3>اطلاعات پرسنلی</h3>
                        <div class="info-detail">
                            <ul>
                                <li><i class="fa fa-user"></i><span>نام:</span>
                                    <asp:Label ID="lblPersonName" runat="server">  </asp:Label>
                                </li>
                            </ul>
                            <ul>
                                <li><i class="fa fa-pencil"></i><span>شعل: </span>
                                    <asp:Label ID="lblJob" runat="server">  </asp:Label>
                                </li>
                            </ul>
                            <ul>
                                <li><i class="fa fa-phone"></i><span>تلفن : </span>
                                    <asp:Label ID="lblPhone" runat="server">  </asp:Label>
                                </li>

                            </ul>

                            <ul>
                                <li><i class="fa fa-envelope"></i><span>ایمیل:</span>
                                    <asp:Label ID="lblEmail" runat="server">  </asp:Label>
                                </li>
                            </ul>
                            <ul>
                                <li>
                                    <a href="/" class="btn btn-warning btn-sm btn-block">خروج</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
  
</asp:Content>
