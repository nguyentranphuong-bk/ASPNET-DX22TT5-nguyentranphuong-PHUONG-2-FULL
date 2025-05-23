<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="WebApplication1.Cart" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Giỏ hàng của bạn</title>
    <style>
        .cart-container {
            width: 80%;
            margin: 20px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .cart-item {
            display: flex;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }
        .cart-item img {
            width: 80px;
            height: 80px;
            margin-right: 15px;
        }
        .btn-checkout {
            margin-top: 15px;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            cursor: pointer;
        }
        .btn-continue {
    margin-top: 10px;
    padding: 10px 20px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.btn-continue:hover {
    background-color: #0056b3;
    transform: scale(1.03);
}

.btn-continue:active {
    background-color: #004080;
}
.btn-clear {
    margin-top: 15px;
    padding: 10px 20px;
    background-color: #dc3545;
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 16px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.btn-clear:hover {
    background-color: #c82333;
    transform: scale(1.03);
}

.btn-clear:active {
    background-color: #bd2130;
}
.btn-delete {
    margin-top: 5px;
    padding: 8px 16px;
    background-color: #fd7e14; /* Màu cam */
    color: white;
    border: none;
    border-radius: 6px;
    font-size: 14px;
    cursor: pointer;
    transition: background-color 0.3s ease, transform 0.2s ease;
}

.btn-delete:hover {
    background-color: #e86c00; /* Màu cam tối hơn khi hover */
    transform: scale(1.03);
}

.btn-delete:active {
    background-color: #d35e00; /* Màu cam đậm khi nhấn */
} 

.cart-container {
        text-align: center;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 100%;
    }

    .cart-item {
        display: flex;
        justify-content: center;
        align-items: center;
        text-align: center;
        flex-direction: column;
        margin-bottom: 20px;
    }

    .cart-item img {
        max-width: 150px;
        margin-bottom: 10px;
    }

    .btn-delete, .btn-continue, .btn-clear, .btn-checkout {
        margin-top: 10px;
        padding: 10px 20px;
        font-size: 18px;
    }
    </style>
</head>
<body>
   <form id="form1" runat="server">
    <div class="cart-container">
        <h2>Giỏ hàng của bạn</h2>

        <asp:Repeater ID="rptCart" runat="server">
            <ItemTemplate>
                <div class="cart-item">
                    <img style="width: 179px;
    height: 125px;" src='<%# ((Dictionary<string, string>)Container.DataItem)["ImagePath"] %>' 
                         alt='<%# ((Dictionary<string, string>)Container.DataItem)["ProductName"] %>' />
                    <div>
                        <p><strong><%# ((Dictionary<string, string>)Container.DataItem)["ProductName"] %></strong></p>
                        <p>Giá: <%# ((Dictionary<string, string>)Container.DataItem)["Price"] %></p>

                        <!-- Nút Xóa từng sản phẩm -->
                        <asp:Button ID="btnDeleteItem" runat="server" Text="Xóa" CommandName="DeleteItem"
                            CommandArgument='<%# ((Dictionary<string, string>)Container.DataItem)["ProductID"] %>'
                            CssClass="btn btn-danger btn-delete" OnCommand="btnDeleteItem_Command" />

                        <!-- Nút Tiếp tục mua hàng -->
                        <asp:Button ID="btnContinueShopping" runat="server" Text="Tiếp tục mua hàng"
                            OnClick="btnContinueShopping_Click" CssClass="btn btn-primary btn-continue" />
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <!-- Nút Hủy toàn bộ giỏ hàng -->
        <asp:Button ID="btnClearCart" runat="server" Text="Hủy toàn bộ giỏ hàng"
            CssClass="btn btn-warning btn-clear" OnClick="btnClearCart_Click" />

        <!-- Tổng tiền -->
        <h3 id="total-price">
            <asp:Label ID="lblTotalPrice" runat="server" />
        </h3>

        <!-- Nút Thanh toán -->
        <asp:Button ID="btnCheckout" runat="server" Text="Thanh toán"
            CssClass="btn btn-success btn-checkout" OnClick="btnCheckout_Click" />
    </div>
</form>

</body>

</html>