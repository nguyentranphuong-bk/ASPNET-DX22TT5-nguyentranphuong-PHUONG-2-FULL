using System;
using System.Security.Cryptography;
using System.Text;
using System.Data.SqlClient;
using System.Web;

namespace WebApplication1
{
    public class KetNoi : IDisposable
    {
        // Chuỗi kết nối đến SQL Server
        private readonly SqlConnection _con = new SqlConnection("Data Source=(localdb)\\ProjectModels;Initial Catalog=UserDB;Integrated Security=True");

        // Phương thức lấy kết nối SQL Server
        public SqlConnection GetConnection()
        {
            if (_con.State == System.Data.ConnectionState.Closed)
            {
                _con.Open();
            } 
            return _con;
        }

        // Phương thức băm mật khẩu bằng SHA256
        public string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password.Trim()));
                return Convert.ToBase64String(bytes);
            }
        }

        // Nếu cần lấy đường dẫn web, dùng `HttpContext.Current`
        public string GetAbsolutePath(string relativePath)
        {
            return HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority) + VirtualPathUtility.ToAbsolute(relativePath);
        }

        // Giải phóng tài nguyên khi không sử dụng kết nối
        public void Dispose()
        {
            if (_con.State != System.Data.ConnectionState.Closed)
            {
                _con.Close();
            }
            _con.Dispose();
        }
    }
}
