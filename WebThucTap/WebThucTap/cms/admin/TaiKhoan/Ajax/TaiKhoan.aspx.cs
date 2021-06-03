using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cms_admin_TaiKhoan_Ajax_TaiKhoan : System.Web.UI.Page
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
            case "XoaTaiKhoan":
                XoaTaiKhoan();
                break;
        }
    }

    private void XoaTaiKhoan()
    {
        string TenDangNhap = "";
        if (Request.Params["TenDangNhap"] != null)
            TenDangNhap = Request.Params["TenDangNhap"];
        //Thực Hiện Code Xóa
        if (TenDangNhap.ToLower() != "admin")
        {//Không cho xóa tài khoản admin
            Webbanhang.DangKy.Dangky_Delete(TenDangNhap);
            //Trả về thông báo:1 là thưc hiện thành công ,2 là thực hiện không thành công
            Response.Write("1");
        }
        else
        {
            Response.Write("Không được xóa tài khoản admin !!!");
        }
    }
}