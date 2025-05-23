<%@ Page Title="Đăng ký" Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="WebApplication1.Signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đăng ký tài khoản</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
       body {
    background-image: url('/Images/anhdangki.jpg'); /* Đường dẫn ảnh */
    background-size: cover; /* Ảnh phủ toàn bộ */
    background-position: center; /* Căn giữa ảnh */
    background-repeat: no-repeat; /* Không lặp lại ảnh */
}

        .signup-container {
            background: cadetblue;
            max-width: 400px;
            margin: auto;
            margin-top: 30px;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="signup-container">
            <h2 class="text-center">Đăng ký tài khoản</h2>
            <form id="form1" runat="server">
                <asp:Label ID="lbkq" runat="server" CssClass="text-danger" EnableViewState="false"></asp:Label>
                <br />

                <div class="mb-3">
                    <label for="txtUser" class="form-label">Tài khoản</label>
                    <asp:TextBox ID="txtUser" runat="server" CssClass="form-control" placeholder="Nhập tài khoản" />
                    <asp:RequiredFieldValidator ID="rfvUser" runat="server" ControlToValidate="txtUser" ErrorMessage="Vui lòng nhập tài khoản!" CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label for="txtPass1" class="form-label">Mật khẩu</label>
                    <asp:TextBox ID="txtPass1" runat="server" TextMode="Password" CssClass="form-control" placeholder="Nhập mật khẩu" />
                    <asp:RequiredFieldValidator ID="rfvPass1" runat="server" ControlToValidate="txtPass1" ErrorMessage="Vui lòng nhập mật khẩu!" CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label for="txtPass2" class="form-label">Nhập lại mật khẩu</label>
                    <asp:TextBox ID="txtPass2" runat="server" TextMode="Password" CssClass="form-control" placeholder="Xác nhận mật khẩu" />
                    <asp:RequiredFieldValidator ID="rfvPass2" runat="server" ControlToValidate="txtPass2" ErrorMessage="Vui lòng nhập lại mật khẩu!" CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label for="txtFullname" class="form-label">Họ tên</label>
                    <asp:TextBox ID="txtFullname" runat="server" CssClass="form-control" placeholder="Nhập họ và tên" />
                    <asp:RequiredFieldValidator ID="rfvFullname" runat="server" ControlToValidate="txtFullname" ErrorMessage="Vui lòng nhập họ tên!" CssClass="text-danger" Display="Dynamic" />
                </div>

                <div class="mb-3">
                    <label for="txtAddress" class="form-label">Địa chỉ</label>
                    <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" placeholder="Nhập địa chỉ" />
                    <asp:RequiredFieldValidator ID="rfvAddress" runat="server" ControlToValidate="txtAddress" ErrorMessage="Vui lòng nhập địa chỉ!" CssClass="text-danger" Display="Dynamic" />
                </div>
                                <div class="mb-3">
                    <label for="txtPhone" class="form-label">Số điện thoại</label>
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" placeholder="Nhập số điện thoại" />
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ControlToValidate="txtPhone" ErrorMessage="Vui lòng nhập số điện thoại!" CssClass="text-danger" Display="Dynamic" />
                </div>

                <asp:Button ID="btSignup" runat="server" Text="Đăng ký" CssClass="btn btn-primary w-100" OnClick="btSignup_Click" />
            </form>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
