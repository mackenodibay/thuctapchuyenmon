using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cms_admin_SanPham_QuanLyDanhMuc_Ajax_DanhMuc : System.Web.UI.Page
{

    private string thaotac = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //Cần code kiểm tra đăng nhập sau đó mới thực hiện các thao tác ở dưới 
        if (Session["DangNhap"] != null && Session["DangNhap"].ToString() == "1")
        {
            //Đã Đăng Nhập

        }
        else
        {
            //Chưa đăng nhập ---> Return để không cho thực hiện các câu lệnh ở dưới
            return;
        }

        if (Request.Params["ThaoTac"] != null)
            thaotac = Request.Params["ThaoTac"];
        switch (thaotac)
        {
            case "XoaDanhMuc":
                XoaDanhMuc();
                break;
        }
    }

    private void XoaDanhMuc()
    {
        string MaDM = "";
        if (Request.Params["MaDM"] != null)
            MaDM = Request.Params["MaDM"];
        //Thực Hiện Code Xóa
        Webbanhang.DanhMuc.Danhmuc_Delete(MaDM);
        //Trả về thông báo:1 là thưc hiện thành công ,2 là thực hiện không thành công
        Response.Write("1");
    }
}