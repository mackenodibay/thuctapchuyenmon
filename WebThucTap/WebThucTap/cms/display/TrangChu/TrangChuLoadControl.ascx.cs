using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cms_display_TrangChu_TrangChuLoadControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ltrNhomSanPham.Text = LayNhomSanPham();
        }
    }



    #region lấy nhóm và các sản phẩm
    private string LayNhomSanPham()
    {
        string s = "";
        DataTable dt = new DataTable();
        dt = Webbanhang.NhomSanPham.Thongtin_Nhomsp();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            s += "<div class='sanphamnoibat'>";
            s += @"
<div class='title-line'>
    <h3>" + dt.Rows[i]["TenNhom"] + @"</h3>
</div>
";
            s += "<div>";
            s += LayDanhSachSanPhamTheoNhom(dt.Rows[i]["NhomID"].ToString(), dt.Rows[i]["SoSPHienThi"].ToString());
            s += "</div>";
            s += "<div style='clear:both'></div>";
            s += "</div>";
        }

        return s;
    }

    private string LayDanhSachSanPhamTheoNhom(string NhomID, string SoSPHienThi)
    {
        string s = "";
        DataTable dt = new DataTable();
        dt = Webbanhang.SanPham.Thongtin_Sanpham_by_nhomid(NhomID, SoSPHienThi);
        string link = "";
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            link = "Default.aspx?modul=SanPham&modulphu=ChiTietSanPham&id=" + dt.Rows[i]["MaSP"];
            s += @"
<div class='item'>
    <a href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
        <img src='/pic/sanpham/" + dt.Rows[i]["AnhSP"] + @"' alt='" + dt.Rows[i]["TenSP"] + @"' />
    </a>
    <a class='title-sp' href='" + link + @"' title='" + dt.Rows[i]["TenSP"] + @"'>
        " + dt.Rows[i]["TenSP"] + @"
    </a>
    <div class='desc'>
        Giá: " + dt.Rows[i]["GiaSP"] + @" Đồng
    </div>
</div>
";

        }
        return s;
    }
    #endregion
}


