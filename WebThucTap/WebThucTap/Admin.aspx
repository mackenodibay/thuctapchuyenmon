<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>

<%@ Register Src="~/cms/admin/AdminLoadControl.ascx" TagPrefix="uc1" TagName="AdminLoadControl" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Trang Quản Trị</title>
    <link href="cms/admin/css/admin.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
      <%--Header--%>
            <div id="header">
                <div class="container">
                    <div class="logo">
                       
                        <a href="/Admin.aspx"> Logo</a>
                    </div>
                    <div class="accountMenu">
                        Xin chào
                    </div>                 
                </div>               
            </div>

         <%--Menu--%>
            <div class="MenuChinh">
                <div class="container">
                    <ul>
                <li><a href="Admin.aspx" title="Trang chủ">Trang chủ</a></li>
                <li><a href="Admin.aspx?modul=SanPham" title="Sản Phẩm">Sản Phẩm</a></li>
                <li><a href="Admin.aspx?modul=TaiKhoan" title="Tài Khoản">Tài Khoản</a></li>
                <li><a href="Admin.aspx?modul=KhachHang" title="Khách Hàng">Khách Hàng</a></li>
                 </ul>
            </div>
        </div>     
         <%--Phần nội dung trang--%>
        <uc1:AdminLoadControl runat="server" ID="AdminLoadControl" />

 
    </form>
</body>
</html>
