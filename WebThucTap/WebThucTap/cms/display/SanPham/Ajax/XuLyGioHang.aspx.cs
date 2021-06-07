using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cms_display_SanPham_Ajax_XuLyGioHang : System.Web.UI.Page
{
    private string thaotac = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        thaotac = Request.Params["ThaoTac"];
        switch (thaotac)
        {
            case "ThemVaoGioHang":
                ThemVaoGioHang();
                break;
            case "LayThongTinGioHang":
                LayThongTinGioHang();
                break;
            case "LayTongSoSanPhamTrongGioHang":
                LayTongSoSanPhamTrongGioHang();
                break;
            case "LayTongTienTrongGioHang":
                LayTongTienTrongGioHang();
                break;
            case "XoaSPTrongGioHang":
                XoaSPTrongGioHang();
                break;
            case "CapNhatSoLuongVaoGioHang":
                CapNhatSoLuongVaoGioHang();
                break;
        }
    }

    private void CapNhatSoLuongVaoGioHang()
    {
        //Lấy id sản phẩm cần xóa khỏi giỏ hàng
        string idSanPham = Request.Params["idSanPham"];
        string soLuongMoi = Request.Params["soLuongMoi"];

        //Nếu tồn tại giỏ hàng thì mới lấy ra kết quả
        if (Session["GioHang"] != null)
        {
            //Khai báo datatable để chứa giỏ hàng
            DataTable dtGioHang = new DataTable();
            dtGioHang = (DataTable)Session["GioHang"];




            //Lặp Qua Danh Sách sp trong giỏ hàng ----> Cập Nhập Số lượng cho id sản phẩm dc yêu cầu
            for (int i = 0; i < dtGioHang.Rows.Count; i++)
            {
                if (dtGioHang.Rows[i]["MaSP"].ToString() == idSanPham)
                {
                    dtGioHang.Rows[i]["SoLuong"] = soLuongMoi;
                }
            }
            //Gán lại vào session
            Session["GioHang"] = dtGioHang;
        }

        Response.Write("");
    }

    private void XoaSPTrongGioHang()
    {   
        //Lấy id sản phẩm cần xóa khỏi giỏ hàng
        string idSanPham = Request.Params["idSanPham"];

        //Nếu tồn tại giỏ hàng thì mới lấy ra kết quả
        if (Session["GioHang"] != null)
        {
            //Khai báo datatable để chứa giỏ hàng
            DataTable dtGioHang = new DataTable();
            dtGioHang = (DataTable)Session["GioHang"];




            //Lặp Qua Danh Sách sp trong giỏ hàng ----> Nếu có id bị xóa thì loại khỏi danh sách
            for (int i = 0; i < dtGioHang.Rows.Count; i++)
            {
                if (dtGioHang.Rows[i]["MaSP"].ToString() == idSanPham)
                {
                    dtGioHang.Rows[i].Delete();
                }
            }
            //Gán lại vào session
            Session["GioHang"] = dtGioHang;
        }

        Response.Write("");
    }
    private void LayTongTienTrongGioHang()
    {
        double tongTien = 0;

        //Nếu tồn tại giỏ hàng thì mới lấy ra kết quả
        if (Session["GioHang"] != null)
        {
            //Khai báo datatable để chứa giỏ hàng
            DataTable dtGioHang = new DataTable();
            dtGioHang = (DataTable)Session["GioHang"];




            //Chạy vòng lặp đếm tổng số tiền đơn hàng (Thành Tiền = Só Lương x Đơn giá)
            for (int i = 0; i < dtGioHang.Rows.Count; i++)
            {
                tongTien += int.Parse(dtGioHang.Rows[i]["SoLuong"].ToString()) * double.Parse(dtGioHang.Rows[i]["GiaSP"].ToString());

            }
        }

        Response.Write(tongTien);
    }

    private void LayTongSoSanPhamTrongGioHang()
    {
        int tongSo = 0;

        //Nếu tồn tại giỏ hàng thì mới lấy ra kết quả
        if (Session["GioHang"] != null)
        {
            //Khai báo datatable để chứa giỏ hàng
            DataTable dtGioHang = new DataTable();
            dtGioHang = (DataTable)Session["GioHang"];




            //Chạy vòng lặp đếm tổng số sản phẩm trong giỏ hàng
            for (int i = 0; i < dtGioHang.Rows.Count; i++)
            {
                tongSo += int.Parse(dtGioHang.Rows[i]["SoLuong"].ToString());

            }
        }    

        Response.Write(tongSo);
    }

    private void LayThongTinGioHang()
    {
        string ketQua = "";

        //Nếu tồn tại giỏ hàng thì mới lấy ra kết quả
        if (Session["GioHang"] != null)
        {
            //Khai báo datatable để chứa giỏ hàng
            DataTable dtGioHang = new DataTable();
            dtGioHang = (DataTable)Session["GioHang"];

            ketQua += @"
<table style='width:100%;' id='cart-table'>
    <tbody>
        <tr>
            <th></th>
            <th>Tên sản phẩm</th>
            <th>Số lượng</th>
            <th>Đơn giá</th>
            <th></th>
        </tr>
        <tr class='line-item original'>
            <td class='item-image'></td>
            <td class='item-title'>
                <a></a>
            </td>
            <td class='item-quantity'></td>
            <td class='item-price'></td>
            <td class='item-delete'></td>
        </tr>";

            //Chạy vòng lặp và xuất dữ liệu trong giỏ hàng ra dạng bảng
            for (int i = 0; i < dtGioHang.Rows.Count; i++)
            {
                ketQua += @"
        <tr class='line-item' id='tr_" + dtGioHang.Rows[i]["MaSP"] + @"'>
            <td class='item-image'><img class='anhSPGioHang' src='pic/SanPham/" + dtGioHang.Rows[i]["AnhSP"] + @"' /></td>
            <td class='item-title'>
                <a href='/Default.aspx?modul=SanPham&modulphu=ChiTietSanPham&id=" + dtGioHang.Rows[i]["MaSP"] + @"'>" + dtGioHang.Rows[i]["TenSP"] + @"</a>
            </td>
            <td class='item-quantity'><input onchange='CapNhatSoLuongVaoGioHang(" + dtGioHang.Rows[i]["MaSP"] + @")' id='quantity_" + dtGioHang.Rows[i]["MaSP"] + @"' name='updates[]' min='1' type='number' value='" + dtGioHang.Rows[i]["SoLuong"] + @"' class=''></td>
            <td class='item-price'>" + dtGioHang.Rows[i]["GiaSP"] + @"</td>
            <td class='item-delete'><a href='javascript://' onclick='XoaSPTrongGioHang(" + dtGioHang.Rows[i]["MaSP"] + @")'>Xóa</a></td>
        </tr>
";
            }

            ketQua += @"
    </tbody>
</table>
";
        }

        Response.Write(ketQua);
    } 


    private void ThemVaoGioHang()
    {
        string ketQua = "";
        string id = Request.Params["id"];
        string soLuong = Request.Params["soLuong"];
        // Lấy thông tin chi- tiết sản phẩm dc add vào giỏ hàng
        DataTable dt = new DataTable();
        dt = Webbanhang.SanPham.Thongtin_Sanpham_by_id(id);
        if (dt.Rows.Count > 0)// nếu tồn tại sản phẩm thì thực hiền thao tác  
        {   //nếu ch có giỏ hàng thì tạo giỏ hàng
            if (Session["GioHang"] == null)
            {   
                //khai báo datatable để thông tin sản phẩm vào giỏ hàng lần đầu tiên
                DataTable dtGioHang = new DataTable();
                dtGioHang.Columns.Add("MaSP");
                dtGioHang.Columns.Add("TenSP");
                dtGioHang.Columns.Add("AnhSP");
                dtGioHang.Columns.Add("GiaSP");
                dtGioHang.Columns.Add("SoLuong");
                
                //Lưu các thông tin sản phẩm đăt vào datatable
                dtGioHang.Rows.Add(dt.Rows[0]["MaSP"].ToString(), dt.Rows[0]["TenSP"].ToString(), dt.Rows[0]["AnhSP"].ToString(), dt.Rows[0]["GiaSP"].ToString(), soLuong);
                //Gán giá trị của bảng tạm - datatable vào giỏ hàng
                Session["GioHang"] = dtGioHang;



            }
            //nếu đã có giỏ hàng thì thực hiện thêm mới 
            else
            {
                //Khai báo datatable để chứa giỏ hàng 
                DataTable dtGioHang = new DataTable();
                dtGioHang = (DataTable)Session["GioHang"];
                //Kiểm tra xem trong giỏ hàng có sản phẩm này chưa
                //Nếu có tăng số lượng ở dòng chứa sản phẩm này 
                // Nếu chưa có thêm sản phẩm vào dòng cuối giỏ hàng
                int viTriSPTrongGioHang = -1;//Nếu Sau vòng lặp vị trí thay đổi --->Có tồn tại sản phẩm trong giỏ hàng
                for(int i = 0;i< dtGioHang.Rows.Count;i++)
                {
                    if (dtGioHang.Rows[i]["MaSP"].ToString() == id)
                    {
                        //Có tồn tại sản phẩm này trong giỏ hàng
                        viTriSPTrongGioHang = i;
                        //thoát ra khỏi vòng lặp
                        break;
                    }
                }
                //nếu có
                if(viTriSPTrongGioHang != -1){
                    //Lấy ra số lương hiện tại của sp đó trong giỏ hàng
                    int soLuongHienTai = int.Parse(dtGioHang.Rows[viTriSPTrongGioHang]["SoLuong"].ToString());
                    //Tăng Số lượng lên
                    soLuongHienTai += int.Parse(soLuong);
                    //Cập nhập vào chứa thông tin sản phẩm hiện tại
                    dtGioHang.Rows[viTriSPTrongGioHang]["SoLuong"] = soLuongHienTai;
                    //Gắn lại giá tri của bảng tạm -datatable vào giỏ hàng
                    Session["GioHang"] = dtGioHang;

                }
                //nếu không có trong giỏ hàng 
                else
                { 
                    //Lưu các thông tin sản phẩm đăt vào datatable
                    dtGioHang.Rows.Add(dt.Rows[0]["MaSP"].ToString(), dt.Rows[0]["TenSP"].ToString(), dt.Rows[0]["AnhSP"].ToString(), dt.Rows[0]["GiaSP"].ToString(), soLuong);
                    //Gán giá trị của bảng tạm - datatable vào giỏ hàng
                    Session["GioHang"] = dtGioHang;
                }


            }
        }
        else
        {
            ketQua = "Không Tồn Tại Sản Phẩm Này !!";
        }
        Response.Write(ketQua);
           
    }
}