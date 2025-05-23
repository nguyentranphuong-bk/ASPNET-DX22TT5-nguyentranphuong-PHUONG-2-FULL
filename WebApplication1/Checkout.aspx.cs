using System;
using System.Collections.Generic;

namespace WebApplication1
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Gọi JavaScript khi trang load lần đầu
                ClientScript.RegisterStartupScript(this.GetType(), "LoginReminder", "showLoginReminder();", true);
            }
            if (!IsPostBack)
            {
                // 🛒 Hiển thị giỏ hàng như code gốc của bạn
                if (Session["Cart"] != null)
                {
                    List<Dictionary<string, string>> cart = (List<Dictionary<string, string>>)Session["Cart"];

                    // Chuyển đổi Dictionary thành danh sách đối tượng động
                    List<dynamic> formattedCart = new List<dynamic>();
                    decimal totalPrice = 0;

                    foreach (var product in cart)
                    {
                        decimal price;
                        if (decimal.TryParse(product["Price"], out price))
                        {
                            totalPrice += price;
                        }

                        formattedCart.Add(new
                        {
                            ProductName = product["ProductName"],
                            Price = product["Price"],
                            ImagePath = product["ImagePath"]
                        });
                    }

                    rptCheckout.DataSource = formattedCart;
                    rptCheckout.DataBind();

                    lblTotalPrice.Text = $"Tổng tiền: {totalPrice:#,0} Đ";
                }
                else
                {
                    lblTotalPrice.Text = "Không có sản phẩm trong giỏ hàng!";
                }

               
            }
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Kiểm tra xem người dùng đã đăng nhập hay chưa
            if (Session["UserLoggedIn"] == null || !(bool)Session["UserLoggedIn"])
            {
                ClientScript.RegisterStartupScript(this.GetType(), "NotLoggedIn", "alert('Vui lòng đăng nhập trước khi đặt hàng!'); window.location='Login.aspx';", true);
                return;
            }

            // 🛍 **Xử lý đặt hàng**
            string script = "alert('Bạn đã đặt hàng thành công!'); window.location='Default.aspx';";
            ClientScript.RegisterStartupScript(this.GetType(), "OrderSuccess", script, true);
        }
    }
}
