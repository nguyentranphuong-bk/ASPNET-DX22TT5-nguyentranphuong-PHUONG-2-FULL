using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static WebApplication1.Cart;

namespace WebApplication1
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                LoadProducts();
            }

        }
        private void LoadProducts()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["LaptopDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open(); // Mở kết nối kiểm tra lỗi

                    // Cập nhật truy vấn để lấy ProductID
                    string query = "SELECT ProductID, ProductName, Price, ImagePath FROM Products";
                    SqlDataAdapter da = new SqlDataAdapter(query, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);

                    rptProducts.DataSource = dt;
                    rptProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                Response.Write("Lỗi kết nối hoặc truy vấn: " + ex.Message);
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["CustomerInfo"] != null)
            {
                Dictionary<string, string> customerInfo = (Dictionary<string, string>)Session["CustomerInfo"];
                string name = customerInfo["Name"];
                string address = customerInfo["Address"];
                string phone = customerInfo["Phone"];

                string message = $"Bạn {name}, địa chỉ: {address}, số điện thoại: {phone} đã đặt hàng thành công. Tổng đài sẽ liên hệ đến bạn.";
                string script = $"alert('{message}'); window.location='Default.aspx';";

                ClientScript.RegisterStartupScript(this.GetType(), "OrderSuccess", script, true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "OrderFailed", "alert('Thông tin khách hàng không có sẵn!');", true);
            }
        }
        protected void btnBuy_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string[] productData = btn.CommandArgument.Split(';');

            if (productData.Length < 4)
            {
                Response.Write("<script>alert('Không thể lấy thông tin sản phẩm!');</script>");
                return;
            }

            string productID = productData[0];
            string productName = productData[1];
            string imagePath = productData[2];
            string price = productData[3];

            List<Dictionary<string, string>> cart = Session["Cart"] as List<Dictionary<string, string>> ?? new List<Dictionary<string, string>>();

            cart.Add(new Dictionary<string, string>()
    {
        { "ProductID", productID },
        { "ProductName", productName },
        { "ImagePath", imagePath },
        { "Price", price }
    });

            Session["Cart"] = cart;

            Response.Redirect("Cart.aspx");
        }






    }
}
