using System;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["allow"] != null)
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text;
            string password = txtPassword.Text;

            string connStr = ConfigurationManager.ConnectionStrings["UserDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT id FROM tbluser WHERE Username = @username AND Password = @password";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@username", username);
                    cmd.Parameters.AddWithValue("@password", password);

                    conn.Open();
                    object userID = cmd.ExecuteScalar(); // Lấy UserID nếu đăng nhập thành công

                    if (userID != null)
                    {
                        // Lưu thông tin đăng nhập vào Session
                        Session["UserID"] = userID;
                        Session["UserLoggedIn"] = true; // ✅ Thêm xác thực đăng nhập

                        // Quay lại trang trước nếu có
                        string returnUrl = Request.QueryString["returnUrl"];
                        if (!string.IsNullOrEmpty(returnUrl))
                        {
                            Response.Redirect(returnUrl);
                        }
                        else
                        {
                            Response.Redirect("Default.aspx");
                        }
                    }
                    else
                    {
                        Response.Write("⚠ Tên đăng nhập hoặc mật khẩu không đúng!");
                    }
                }
            }

        }

        protected void btLogin_Click(object sender, EventArgs e)
        {   
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                using (KetNoi kn = new KetNoi())
                {
                    string hashedPassword = kn.HashPassword(password);

                    using (SqlCommand cmd = new SqlCommand("SELECT * FROM tbluser WHERE Username = @Username AND Password = @Password AND Status = 1", kn.GetConnection()))
                    {
                        cmd.Parameters.AddWithValue("@Username", username);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);

                        SqlDataAdapter da = new SqlDataAdapter(cmd);
                        DataTable tb = new DataTable();
                        da.Fill(tb);

                        if (tb.Rows.Count > 0)
                        {
                            Session["name"] = tb.Rows[0]["Username"].ToString();
                            Session["allow"] = true;
                            Session["role"] = tb.Rows[0]["Role"].ToString();
                            Session["UserLoggedIn"] = true; // ✅ Thêm xác thực đăng nhập

                            Response.Redirect("Default.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('Tên đăng nhập hoặc mật khẩu không chính xác hoặc tài khoản chưa được kích hoạt.')</script>");
                        }
                    }
                }

            }
            else
            {
                Response.Write("<script>alert('Vui lòng nhập tên đăng nhập và mật khẩu.')</script>");
            }
        }
    }
}
