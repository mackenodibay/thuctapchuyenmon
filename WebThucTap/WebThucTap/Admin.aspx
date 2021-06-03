<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register Src="~/cms/admin/AdminLoadControl.ascx" TagPrefix="uc1" TagName="AdminLoadControl" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang Quản Trị</title>
    <link href="cms/admin/css/admin.css" rel="stylesheet" />
    <script src="cms/admin/js/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <%--Header--%>
        <div id="header">
            <div class="container">
                <div class="logo">
                    <a href="/Admin.aspx">
                        <img src="pic/Logo/logo-sach(1).jpg" />
                    </a>
                </div>
                <div class="accountMenu">
                    Xin chào:<asp:Literal ID="ltrTenDangNhap" runat="server"></asp:Literal> !
                    <asp:LinkButton ID="lbtDangXuat" runat="server" OnClick="lbtDangXuat_Click">Đăng Xuất</asp:LinkButton>
                </div>
            </div>
        </div>

        <%--Menu--%>
        <div class="MenuChinh">
            <div class="container">
                <ul>
                   
                    <li><a class="<%=DanhDau("SanPham") %>" href="Admin.aspx?modul=SanPham">Sản phẩm</a></li>
                    <li><a class="<%=DanhDau("KhachHang") %>" href="Admin.aspx?modul=KhachHang">Khách Hàng</a></li>
                    <li><a class="<%=DanhDau("TaiKhoan") %>" href="Admin.aspx?modul=TaiKhoan">Tài khoản</a></li>

                </ul>
            </div>
        </div>
        <%--Phần nội dung trang--%>
        <uc1:AdminLoadControl runat="server" ID="AdminLoadControl" />


    </form>
</body>
</html>
