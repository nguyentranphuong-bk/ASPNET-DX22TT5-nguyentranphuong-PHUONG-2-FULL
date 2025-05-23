<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="WebApplication1.Checkout" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Thanh toán đơn hàng</title>
    <script type="text/javascript">
        function showLoginReminder() {
            Swal.fire({
                title: 'Thông báo bạn hãy đăng nhập',
                text: 'BẤM VÀO THANH TOÁN ĐỂ MUA HÀNG!',
                icon: 'warning',
                confirmButtonText: 'OK',
                width: 500, // Chiều rộng lớn hơn
                padding: '1.5em',
                color: '#333',
                background: '#fff url(https://sweetalert2.github.io/images/trees.png)',
                backdrop: `
                rgba(0,0,123,0.4)
                url("https://sweetalert2.github.io/images/nyan-cat.gif")
                left top
                no-repeat
            `
            });
        }
    </script>

    <!-- SweetAlert2 CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11/dist/sweetalert2.min.css">

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

    <style>
        .checkout-container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .checkout-item {
            display: flex;
            flex-direction: column; /* Sắp xếp nội dung theo chiều dọc */
            justify-content: center; /* Căn giữa theo chiều dọc */
            align-items: center; /* Căn giữa theo chiều ngang */
            padding: 10px;
            border-bottom: 1px solid #ddd;
            text-align: center; /* Căn giữa nội dung bên trong */
        }

        .checkout-item img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 5px;
        }

        .checkout-item div {
            text-align: center; /* Căn giữa văn bản */
        }

        .btn-submit {
            margin-top: 15px;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
        }
        .image-container {
    width: 250px;
    height: 250px;
    overflow: hidden;
}

.image-container img {
    width: 100%;
    height: 100%;
    object-fit: contain;
}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="checkout-container">
            <h2>Thông tin đơn hàng</h2>
<asp:Repeater ID="rptCheckout" runat="server">
    <ItemTemplate>
        <div style="display: flex; align-items: center;">
            <img src="<%# Eval("ImagePath") %>" alt="Ảnh sản phẩm" style="width: 80px; height: 80px; margin-right: 10px;" />
            <p>Sản phẩm: <%# Eval("ProductName") %> - Giá: <%# Eval("Price") %> Đ</p>
        </div>
    </ItemTemplate>
</asp:Repeater>


<asp:Label ID="Label1" runat="server" Text="Tổng tiền:"></asp:Label>
    


            <h3 id="total-price">
                <asp:Label ID="lblTotalPrice" runat="server" CssClass="total-price-label" />
            </h3>
 <h3>Thông tin khách hàng</h3>
<label>Họ tên:</label>
<asp:TextBox ID="txtName" runat="server" placeholder="Nhập họ tên" />

<label>Địa chỉ:</label>
<asp:TextBox ID="txtAddress" runat="server" placeholder="Nhập địa chỉ" />

<label>Số điện thoại:</label>
<asp:TextBox ID="txtPhone" runat="server" placeholder="Nhập số điện thoại" />


<asp:Button ID="btnSaveCustomerInfo" runat="server" Text="Lưu thông tin" OnClick="btnSubmit_Click" />





        </div>
    </form>
</body>
</html>
