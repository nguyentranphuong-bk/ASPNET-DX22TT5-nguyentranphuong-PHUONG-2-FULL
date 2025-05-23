using System;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class Signup : System.Web.UI.Page
    {
        
        protected void Application_Start(object sender, EventArgs e)
        {
            ScriptManager.ScriptResourceMapping.AddDefinition(
                "jquery",
                new ScriptResourceDefinition
                {
                    Path = "https://code.jquery.com/jquery-3.6.0.min.js",
                    DebugPath = "https://code.jquery.com/jquery-3.6.0.min.js",
                    CdnPath = "https://code.jquery.com/jquery-3.6.0.min.js",
                    CdnDebugPath = "https://code.jquery.com/jquery-3.6.0.min.js"
                });
        }
        protected void btSignup_Click(object sender, EventArgs e)
        {
            // Kiểm tra xem có phải yêu cầu từ người dùng hay không
            if (!IsPostBack)
            {
                return;
            }

            string username = txtUser.Text.Trim();
            string password1 = txtPass1.Text.Trim();
            string password2 = txtPass2.Text.Trim();
            string fullname = HttpUtility.HtmlDecode(txtFullname.Text.Trim());
            string address = txtAddress.Text.Trim();
            string phoneNumber = txtPhone.Text.Trim(); // Lấy số điện thoại từ input

            // Kiểm tra mật khẩu khớp nhau
            if (password1 != password2)
            {
                lbkq.Text = "<span class='text-danger'>Mật khẩu không khớp!</span>";
                return;
            }

            // Kiểm tra dữ liệu đầu vào hợp lệ
            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password1) ||
                string.IsNullOrEmpty(fullname) || string.IsNullOrEmpty(address) ||
                string.IsNullOrEmpty(phoneNumber)) // Kiểm tra số điện thoại
            {
                lbkq.Text = "<span class='text-danger'>Vui lòng điền đầy đủ thông tin!</span>";
                return;
            }

            try
            {
                using (KetNoi kn = new KetNoi())
                {
                    string hashedPassword = kn.HashPassword(password1);

                    using (SqlCommand cmd = new SqlCommand(
    "INSERT INTO tbluser (Username, Password, Fullname, Address, PhoneNumber, Status, Role) " +
    "VALUES (@Username, @Password, @Fullname, @Address, @PhoneNumber, 0, 0)", kn.GetConnection()))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);
                        cmd.Parameters.AddWithValue("@Fullname", fullname);
                        cmd.Parameters.AddWithValue("@Address", address);
                        cmd.Parameters.AddWithValue("@PhoneNumber", phoneNumber); // Thay 'Number' bằng 'PhoneNumber'

                        cmd.ExecuteNonQuery();
                    }
                }

                // ✅ Hiển thị thông báo thành công và chuyển hướng sau 2 giây
                lbkq.Text = "<span class='text-success'>Đăng ký thành công! Đang chuyển hướng...</span>";
                Response.AddHeader("REFRESH", "2;URL=Login.aspx");
            }
            catch (Exception ex)
            {
                lbkq.Text = "<span class='text-danger'>Lỗi khi đăng ký: " +
                            HttpUtility.HtmlEncode(ex.Message) + "</span>";
            }
        }
    }
}
