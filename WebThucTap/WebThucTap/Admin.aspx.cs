using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Kiểm tra nếu đã đăng nhập thì mới cho vào trang quản trị
        if (Session["DangNhap"] != null && Session["DangNhap"].ToString() == "1")
        {
            //Đã Đăng Nhập

        }
        else
        {
            //Chưa đăng nhập ---> đẩy về trang login
            Response.Redirect("/Login.aspx");
        }
        if (!IsPostBack)
            ltrTenDangNhap.Text = Session["TenDangNhap"].ToString();


    }

    protected string DanhDau(string tenModul)
    {
        string s = "";

        string modul = ""; //Biến lưu giá trị của querstring modul
        if (Request.QueryString["modul"] != null)
            modul = Request.QueryString["modul"];
        if (tenModul == modul)
            s = "current";

        return s;
    }

    protected void lbtDangXuat_Click(object sender, EventArgs e)
    {
        //Xóa các Session đã lưu 
        Session["DangNhap"] = null;
        Session["TenDangNhap"] = null;
        //Đẩy về trang login
        Response.Redirect("/Login.aspx");
    }
}

