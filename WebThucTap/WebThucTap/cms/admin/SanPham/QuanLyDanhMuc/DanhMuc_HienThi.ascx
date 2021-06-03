<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhMuc_HienThi.ascx.cs" Inherits="cms_admin_SanPham_QuanLyDanhMuc_DanhMuc_HienThi" %>
<div class="head">
    Các danh mục sản phẩm đã tạo. 
    <div class="fr ter"><a class="btThemMoi" href="/Admin.aspx?modul=SanPham&modulphu=DanhMuc&thaotac=ThemMoi">Thêm mới danh mục</a></div>
    <div class="cb"></div>
</div>
<div class="KhungChuaBang">
    <table class="tbDanhMuc">
        <tr>
            <th class="cotMa">Mã</th>
            <th class="cotTen">Tên danh mục</th>
            <th class="cotAnh">Ảnh đại diện</th>
            <th class="cotThuTu">Thứ tự</th>
            <th class="cotCongCu">Công cụ</th>
        </tr>
        <asp:Literal ID="ltrDanhMuc" runat="server"></asp:Literal>
    </table>
</div>

<script type="text/javascript">
    function XoaDanhMuc(MaDM) {
        if (confirm("Bạn có chắc chắn muốn xóa danh mục này ?")) {
            $.post("cms/admin/SanPham/QuanLyDanhMuc/Ajax/DanhMuc.aspx",
                {   
                    "ThaoTac":"XoaDanhMuc",
                    "MaDM": MaDM
                  
                },
                function (data, status) {
                    //alert("Data: " + data + "\nStatus: " + status);
                    if (data == 1) {
                        //Thực hiên thành công ---> ẩn dòng vừa được xóa
                        $("#maDong_" + MaDM).slideUp();
                    }
                });
        }
   }
</script>
