using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {   
            if (!IsPostBack)
            {
                if (Session["Cart"] != null)
                {
                    List<Dictionary<string, string>> cart = (List<Dictionary<string, string>>)Session["Cart"];
                    rptCart.DataSource = cart;
                    rptCart.DataBind();

                    // Tính tổng tiền
                    decimal totalPrice = 0;
                    foreach (var product in cart)
                    {
                        totalPrice += Convert.ToDecimal(product["Price"]);
                    }

                    // Hiển thị tổng tiền
                    lblTotalPrice.Text = $"Tổng tiền: {totalPrice:#,0} Đ";
                }
                else
                { 
                    lblTotalPrice.Text = "Giỏ hàng trống!";
                }
            }
        }
        protected void btnDeleteItem_Command(object sender, CommandEventArgs e)
        {
            string productId = e.CommandArgument.ToString();
            // Giả sử Session["Cart"] là List<Dictionary<string, string>>
            var cart = Session["Cart"] as List<Dictionary<string, string>>;
            if (cart != null)
            {
                cart.RemoveAll(p => p["ProductID"] == productId);
                Session["Cart"] = cart;
                rptCart.DataSource = cart;
                rptCart.DataBind();
                
            }
        }
        protected void btnClearCart_Click(object sender, EventArgs e)
        {
           
            // Xóa toàn bộ giỏ hàng (tùy thuộc vào cách bạn lưu giỏ hàng, có thể cần cập nhật logic xóa)
            Session["Cart"] = null; // Nếu giỏ hàng lưu trong Session

            // Chuyển hướng về trang default.aspx
            Response.Redirect("default.aspx");

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Checkout.aspx");
        }
        protected void btnContinueShopping_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
        
    }
}
