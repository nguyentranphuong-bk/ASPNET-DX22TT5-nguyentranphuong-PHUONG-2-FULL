<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebApplication1.Login" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng nhập</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
       body {
    background-image: url('/Images/anhdangki.jpg'); /* Đường dẫn ảnh */
    background-size: cover; /* Ảnh phủ toàn bộ */
    background-position: center; /* Căn giữa ảnh */
    background-repeat: no-repeat; /* Không lặp lại ảnh */
}

        }
        .text-center{
            color: #bf2f3e;
            font-weight: bold;
            font-size: 39px;
        } 
        .login-container {
            max-width: 400px;
            margin: auto;
            margin-top: 100px;
            padding: 30px;  
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <div class="container">
        <div style="margin: 87px 425px;" class="login-container">
            <h2 class="text-center">Đăng nhập</h2>
            <form id="form1" runat="server">
                <div class="mb-3">
                    <label for="txtUsername" class="form-label">Tài khoản</label>
                    <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Nhập tài khoản"></asp:TextBox>
                </div>
                <div class="mb-3">
                    <label for="txtPassword" class="form-label">Mật khẩu</label>
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Nhập mật khẩu"></asp:TextBox>
                </div>
                <asp:Button Style="background: blue;" ID="btLogin" runat="server" Text="Đăng nhập" CssClass="btn btn-primary w-100" OnClick="btLogin_Click" />
            </form>
           
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
