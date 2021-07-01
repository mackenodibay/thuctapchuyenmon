<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="~/cms/display/DisplayLoadControl.ascx" TagPrefix="uc1" TagName="DisplayLoadControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>BookStore - Kiến Thức Là Vàng</title>
    <link href="css/index.css" rel="stylesheet" />
    <script src="js/jquery-3.6.0.min.js"></script>
    <style type="text/css">
        .auto-style1 {
            width: 239px;
            height: 121px;
            margin-right: 0px;
            margin-top: 0px;
        }
        .auto-style2 {
            margin-left: 0px;
        }
        .auto-style4 {
            width: 150px;
            height: 69px;
        }
        .auto-style5 {
            width: 113px;
            height: 46px;
        }
        .auto-style6 {
            height: 100%;
            margin: 0px auto;
            padding: 0px;
            width: 764px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">        
    <div id="dongke">
       
                    <a href="Default.aspx">
                        <img src="pic/Logo/logo-sach(1).jpg" class="auto-style1"  /></a></div>
    <!--đầu trang-->
    <div id="dautrang">
        <div class="contener">
            <div id="logo">
                <div id="logochu" class="auto-style5">
                    &nbsp;</div>
                <div id="logoanh">
                    <asp:Image ID="Image1" runat="server" CssClass="auto-style2" Height="104px" Width="734px" src="pic/Logo/images.jpg"  />
                </div>
            </div>
        </div>
    </div>

    <!--menu đầu trang-->
    <div id="menudautrang">
        <div class="contener">
            <div id="menutrai">
                <ul class="auto-style6">
                    <li class="menu1" ><a href="Default.aspx" >Trang Chủ</a></li>
                    <li class="menu1"><a href="Default.aspx?modul=SanPham">Sản Phẩm</a></li>

                </ul>
            </div>
            <div id="dangnhap">
                <asp:PlaceHolder ID="plChuaDangNhap" runat="server">
                    <ul>
                        <li class="dangnhap1">/<a href="Default.aspx?modul=ThanhVien&modulphu=DangKy">Đăng ký</a></li>
                        <li class="dangnhap2"><a href="Default.aspx?modul=ThanhVien&modulphu=DangNhap">Đăng nhập</a></li>
                    </ul>
                </asp:PlaceHolder>
                
                <asp:PlaceHolder ID="plDaDangNhap" runat="server" Visible="False">
                    <ul>
                         <li class="dangnhap1">/<asp:LinkButton ID="lbtDangXuat" runat="server" CausesValidation="False" OnClick="lbtDangXuat_Click">Đăng xuất</asp:LinkButton></li>
                          <li class="dangnhap2"><asp:Literal ID="ltrTenKhachHang" runat="server"></asp:Literal></li>
                        
                    </ul>
                </asp:PlaceHolder>
            </div>
        </div>
    </div>

    <!--thanh tìm kiếm + giỏ hàng-->
    <div id="timkiem">
        <div class="contener">
           
                <div class="timkiemphai">
                    <div class="giohang">
                        <a id="cart" style="display:inline-block" href="/Default.aspx?modul=SanPham&modulphu=GioHang"></a>
                    </div>
                    <div class="otimkiem">
                        <div class="search">
                            <div id="searchForm">
                                <input type="text" class="key" placeholder="Từ khóa tìm kiếm" name="pr_name"  id="keysearch" onkeydown="CheckPostSearch(event)"/>
                                <a href="javascript://" onclick="PostSearch()" class="submit">&nbsp;</a>
                            </div>
                            
                            <script type="text/javascript">
                                function CheckPostSearch(e) {
                                    if (e.keyCode === 13) {
                                        PostSearch();

                                        e.preventDefault();
                                    }
                                }

                                function PostSearch() {
                                    $("#keysearch").show().focus();
                                    if ($("#keysearch").val() !== "")
                                        window.location = "/Default.aspx?modul=SanPham&modulphu=TimKiem&tukhoa=" + $("#keysearch").val();
                                }
                            </script>
                        </div>           
                    </div>  
                </div>
            </div>
     
    </div>

    <!--thân trang-->
    <div id="thantrang">
        <div class="contener">
            <div id="trangtrai">
                <asp:PlaceHolder ID="plDanhMucSanPham" runat="server">
                    <div id="danhmuc">
                        <div class="daumuc"><a>DANH MỤC SẢN PHẨM</a></div>
                        <div class="ditmuc">
                            <ul>
                                <asp:Literal ID="ltrDanhMucSanPham" runat="server"></asp:Literal>
                            </ul>
                        </div>   
                    </div>
                </asp:PlaceHolder>
       
                <div id="hotro">
                   <div id="pichotro">
                        <div class="logohotro">
                            <img src="css/images/hotline.png" class="auto-style4" />
                        </div>
                        <h3>Hỗ trợ trực tuyến</h3>
                    </div>
                    <div class="support">
                        <div class="text-center">
                            <p>
                                <span class="supp-name">Thanh Sang</span>
                                <br />                    
                                <span class="phone">0384997837</span>
                            </p>                    
                        </div>
                        <div class="text-center">
                            <p>
                                <span class="supp-name">Thanh Hằng</span>
                                <br />
                                <span class="phone">0369041794</span>
                            </p>                            
                        </div>
                        <div class="text-center">
                            <p>
                                <span class="supp-name">Thời gian làm việc</span>
                                <br />
                                <span class="phone">24/24</span>
                            </p>
                        </div>
                    </div>              
                </div>
                <div id="thanhtoan">
                    <div class="title-thanhtoan">
                        <a>THÔNG TIN GIAO DỊCH</a>
                    </div>
                    <div class="thongtinnganhang">      
                        <div class="nganhang">
                            <img src="../css/images/nganhang/vietinbank.png" />
                            <p>
                                <strong>Ngân hàng Vietincombank</strong>
                                <br>
                                Số TK: 104868823685
                                <br>
                                Chủ TK: Thanh Sang
                                <br>
                                Chi nhánh Hội sở - TP.HCM
                            </p>
                        </div>
                    </div>                   
                </div>
            </div>
            <div id="trangphai">
                <uc1:DisplayLoadControl runat="server" ID="DisplayLoadControl" />
            </div>
        </div>
    </div>
   <%--     lien he--%>
        <div class="float-icon-hotline">
   <ul>
      <li class="hotline_float_icon">
	      <a id="messengerButton" href="tel:0384997837" rel="noopener nofollow">
	      	<i class="fa fa-phone animated infinite tada"></i>
	      	<span>Hotline: 0384997837</span>
	      </a>
      </li>
      <li class="hotline_float_icon">
	      <a id="messengerButton" href="//zalo.me/0384997837" target="_blank" rel="noopener nofollow">
		      <i class="fa fa-zalo animated infinite tada"></i>
		      <span>Nhắn tin qua Zalo</span>
	      </a>
      </li>
      <li class="hotline_float_icon">
	      <a id="messengerButton" href="https://m.me/mackenodibay" target="_blank" rel="noopener nofollow">
		      <i class="fa fa-fb animated infinite tada"></i>
		      <span>Nhắn tin qua Facebook</span>
	      </a>
      </li>
   </ul>
    </div>

    <!--chân trang-->
    <div id="footer">
        <div class="contener">
            <div class=" menufoter">
                <p>©2021 Copyright by BookStore.Coms</p>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
