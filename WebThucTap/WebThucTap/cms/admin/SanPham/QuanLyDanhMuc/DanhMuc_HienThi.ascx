<%@ Control Language="C#" AutoEventWireup="true" CodeFile="DanhMuc_HienThi.ascx.cs" Inherits="cms_admin_SanPham_QuanLyDanhMuc_DanhMuc_HienThi" %>
<style type="text/css">
    .auto-style1 {
        height: 23px;
    }
</style>
<div class="head">
    Các danh mục sản phẩm đã tạo. 
    <div class="fr ter"><a class="btThemMoi" href="/Admin.aspx?modul=SanPham&modulphu=DanhMuc&thaotac=ThemMoi">Thêm mới danh mục</a></div>
    <div class="cb"></div>
</div>
<div class="KhungChuaBang">
   <table class="tbDanhMuc">
       <tr>
           <th class="auto-style1">Mã</th>
           <th class="auto-style1">Tên danh mục</th>
           <th class="auto-style1">Ảnh đại diện</th>
           <th class="auto-style1">Thứ tự</th>
           <th class="auto-style1">Công cụ</th>
       </tr>
       <asp:Literal ID="ltrDanhMuc" runat="server"></asp:Literal>
   </table>
</div>

<script type="text/javascript">
    function XoaDanhMuc(MaDM)
    {
        if(confirm("Bạn chắc chắn muốn xóa danh mục này"))
        {
            //Viết code xóa danh mục tại đây

            $.post("cms/admin/SanPham/QuanLyDanhMuc/Ajax/DanhMuc.aspx",
                {
                    "ThaoTac":"XoaDanhMuc",
                    "MaDM": MaDM
                },
                function (data, status)
                {
                    //alert("Data :" + data + "\n Status :" + status);
                    if(data==1)
                    {
                        //thực hiện thành công => ẩn dòng vừa xóa đi
                        $("#maDong_" + MaDM).slideUp();

                    }
                });
        }
    }
</script>