<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MainMaster.Master" AutoEventWireup="true" CodeBehind="Admin.aspx.cs" Inherits="EnterExite_Online.Person.Admin" %>

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
                            <asp:Label ID="lblWelcom" runat="server">
                                اطلاعات ورود خروج پرسنل
                            </asp:Label>
                        </h3>
                        <div class="info-detail">

                            <div>

                                <!-- Nav tabs -->
                                <ul class="nav nav-tabs" role="tablist">
                                    <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">ورود خروج پرسنل</a></li>
                                    <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">لیست پرسنل</a></li>
                                </ul>

                                <!-- Tab panes -->
                                <div class="tab-content">
                                    <div role="tabpanel" class="tab-pane active" id="home">
                                        <asp:LinqDataSource ID="dsListReportPerson" runat="server" OnSelecting="dsListReportPerson_Selecting"></asp:LinqDataSource>

                                        <asp:GridView ID="gvListReportPerson" AutoGenerateColumns="false" AllowPaging="true" PageSize="5"  CssClass="table table-striped table-bordered table-hover"  Width="100%" runat="server" DataSourceID="dsListReportPerson">
                                            <Columns>
                                                <asp:BoundField DataField="PersonID" Visible="false" />
                                                <asp:BoundField DataField="FullName" HeaderText="نام" />
                                                <asp:BoundField DataField="EnterExiteType" HeaderText="وضعیت کارمند" />
                                                <asp:BoundField DataField="Date" DataFormatString="{0:yyyy/MM/dd}" HeaderText="تاریخ" />
                                                <asp:BoundField DataField="Time" DataFormatString="{0:HH:mm}" HeaderText="ساعت" />
                                                <asp:BoundField DataField="Present" HeaderText="وضعیت در شرکت" />
                                            </Columns>
                                        </asp:GridView>



                                        <br />


                                    </div>
                                    <div role="tabpanel" class="tab-pane" id="profile">
                                        <asp:LinqDataSource ID="dsListPerson" runat="server" OnSelecting="dsListPerson_Selecting"></asp:LinqDataSource>

                                        <asp:GridView ID="gvListPerson" AutoGenerateColumns="false"  CssClass="table table-striped table-bordered table-hover"  Width="100%" runat="server" AllowPaging="true" PageSize="5" DataSourceID="dsListPerson">
                                            <Columns>
                                                <asp:BoundField DataField="PersonID" Visible="false" />
                                                <asp:BoundField DataField="FullName" HeaderText="نام" />
                                                <asp:BoundField DataField="Job" HeaderText="شغل" />
                                                <asp:BoundField DataField="Phone" HeaderText="شماره همراه" />
                                                <asp:BoundField DataField="Email" HeaderText="ایمیل" />
                                                <asp:BoundField DataField="Username" HeaderText="نام کاربری" />
                                                <asp:BoundField DataField="Password" HeaderText="کلمه عبور" />
                                                <asp:BoundField DataField="Adress" HeaderText="آدرس" />
                                                <asp:BoundField DataField="IsAdmin" HeaderText="یا مدیر است" />
                                            </Columns>
                                        </asp:GridView>

                                    </div>
                                </div>

                            </div>





                        </div>
                        <br />
                    </div>

                    <div class="col-md-3 contact-info text-right">
                        <h3>اطلاعات پرسنلی</h3>
                        <div class="info-detail">
                            <ul>
                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#myModal">
                                    پرسنل جدید
                                </button>

                            </ul>
                            <ul>
                            </ul>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!-- Modal -->
    <div class="modal fade" id="myModal" style="z-index: 100000" tabindex="-10000" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">پرسنل جدید</h4>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <asp:Label ID="lblName" runat="server" Text="نام:"></asp:Label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="blFamily" runat="server" Text="نام:"></asp:Label>
                        <asp:TextBox ID="txtFamily" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblUsername" runat="server" Text="کد پرسنلی">   </asp:Label>
                        <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPassword" runat="server" Text="کلمه عبور"></asp:Label>
                        <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblJob" runat="server" Text="شغل"></asp:Label>
                        <asp:TextBox ID="txtJob" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblEmail" runat="server" Text="ایمیل:"></asp:Label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:Label ID="lblPhone" runat="server" Text="تلفن:"></asp:Label>
                        <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblAdress" runat="server" Text="ایمیل:"></asp:Label>
                        <asp:TextBox ID="txtAdress" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>

                    <div class="form-group">
                        <asp:Label ID="lblChekbox" runat="server" Text="مدیر است ؟"></asp:Label>
                        <asp:CheckBox ID="ckIsAdmins" CssClass="checkbox clearfix" runat="server" />

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">بستن</button>
                        <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" CssClass="btn btn-primary" Text="ثبت اطلاعات" />
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
