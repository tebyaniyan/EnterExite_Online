<%@ Page Title="" Language="C#" MasterPageFile="~/Content/MainMaster.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="EnterExite_Online.Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cpMain" runat="server">
    <div id="load-overlay-elt">
        <section class="contact">
            <div class="container">
                <div class="row">
                    <div class="contact-caption clearfix">
                        <div class="contact-heading text-center">
                            <h2>مدیریت ورود خروج پرسنل</h2>
                            <a class="btn btn-success btn-xs" href="javascript:void(0);" onclick="javascript:introJs().start();">آموزش کار با سامانه</a>
                            <button type="button" class="btn btn-success btn-xs" data-toggle="modal" data-target="#myModal">
                                ورود به پنل مدیریت
                            </button>

                            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                                <div class="modal-dialog" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">ورود به سیستم مدیریت</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="form-group">
                                                <asp:Label ID="lblUsernameAdmin" runat="server" Text="نام کارربری:">
                                                </asp:Label>
                                                <asp:TextBox ID="txtUsernameAdmin" ValidationGroup="LoginAdmin" ValidateRequestMode="Disabled" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Label ID="lblPasswordAdmin" runat="server" Text="کلمه عبور:"></asp:Label>
                                                <asp:TextBox ID="txtPasswordAdmin" ValidationGroup="LoginAdmin" ValidateRequestMode="Disabled" runat="server" CssClass="form-control"></asp:TextBox>
                                            </div>
                                            <div class="form-group">
                                                <asp:Button ID="btnLoginAdmin" CssClass="btn btn-success" OnClick="btnLoginAdmin_Click" runat="server" Text="ورود به سیستم" />
                                            </div>
                                        </div>
                                     
                                    </div>
                                </div>
                            </div>
                           

                        </div>


                        <div id="about" runat="server">

                            <div class="col-md-8 contact-info text-left">
                                <h3>درباره ما</h3>
                                <div class="info-detail">
                                    <ul>
                                        <li><i class="fa fa-calendar"></i><span>تاریخ امروز:</span>
                                            <asp:Label ID="lblDateNow" runat="server">  </asp:Label>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li><i class="fa fa-map-marker"></i><span>جمله روز: </span>
                                            بهره من از دانش و حکمت تنها این بود که بر جهل خود دانا شدم.

                                        </li>
                                    </ul>
                                    <ul>
                                        <li><i class="fa fa-phone"></i><span>تلفن : </span>09127746737</li>
                                    </ul>
                                    <ul>
                                        <li><i class="fa fa-fax"></i><span>فکس</span> 02832828200</li>
                                    </ul>
                                    <ul>
                                        <li><i class="fa fa-envelope"></i><span>ایمیل:</span> hi@mspsoft.com</li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 col-md-offset-1 contact-form">
                            <h3>اطلاعات پرسنلی</h3>
                            <div class="form">
                                <div class="form-group-lg">
                                    <%--                                <asp:Label ID="lblUserName" Text="کد پرسنلی :" ForeColor="White" runat="server"></asp:Label>--%>
                                    <asp:TextBox runat="server" data-step="1" data-intro="کد پرسنلی خود را وارد کنید ابتدا!" ValidationGroup="LoginPerson" TextMode="Number" ID="txtUsername" placeholder="کد پرسنلی خود را وارد کنید" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="LoginPerson" ControlToValidate="txtUsername" runat="server" ForeColor="White" ErrorMessage="لطفا کد پرسنلی خود را وارد کنید"></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group-lg">
                                    <%--                                <asp:Label ID="lblPassword" Text="کلمه عبور:" ForeColor="Wheat" runat="server"></asp:Label>--%>
                                    <asp:TextBox ID="txtPassword" data-step="2" data-intro="کلمه عبور خود را وارد کنید" ValidationGroup="LoginPerson" TextMode="Password" placeholder="کلمه عبور خود را وارد کنید" runat="server" CssClass="form-control"></asp:TextBox>

                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="LoginPerson" ControlToValidate="txtPassword" runat="server" ForeColor="White" ErrorMessage="لطفا کد عبور خود را وارد کنید"></asp:RequiredFieldValidator>

                                </div>
                                <div class="form-group">
                                    <asp:Button ID="btnEnter" OnClick="btnEnter_Click"
                                        runat="server" data-step="3"
                                        data-intro="روی دکمه ورود کلیک کنید تا اطلاعات شما ثبت شود"
                                        CssClass="btn btn-danger btn" Text="ثبت اطلاعات" />
                                    <script>
                                        $(function () {

                                            // Action on Click
                                            $("#load-overlay-elt .btn").click(function () {

                                                $("#load-overlay-elt .contact").isLoading({
                                                    text: "Loading",
                                                    position: "overlay"
                                                });

                                                // Setup Loading plugin
                                                $("#load-overlay-elt .contact p").removeClass("alert-success");

                                                // Re-enabling event
                                                setTimeout(function () {
                                                    $("#load-overlay-elt .contact").isLoading("hide");
                                                    $("#load-overlay-elt .contact p").html("Content Loaded")
                                                                                .addClass("alert-success");
                                                }, 2000);

                                            });

                                        });
                                    </script>

                                </div>

                                <div class="form-group">
                                    <asp:Label ID="lblSucsses" runat="server"></asp:Label>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </div>


        </section>
    </div>

</asp:Content>
