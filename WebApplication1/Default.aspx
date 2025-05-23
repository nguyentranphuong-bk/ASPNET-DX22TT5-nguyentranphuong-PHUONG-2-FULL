<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <nav class="navbar navbar-inverse">
     <div class="container-fluid">
         <div class="navbar-header">
             <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>
                 <span class="icon-bar"></span>                        
             </button>
             <a class="navbar-brand" href="<%= ResolveUrl("~/Default.aspx") %>">
                 <img style="width: 194px;
    height: 185px;
    margin: -19px 556px;
    border-radius: 88px;" src="<%= ResolveUrl("~/Images/logo.jpg") %>" alt="Logo" width="120">
             </a>
         </div>

         <div style="padding: 18px 35px;
 margin: -15px 68px;" class="collapse navbar-collapse" id="myNavbar">
             <ul class="nav navbar-nav">
                 <li><a style="color:white" class="maunennava" href="Default.aspx">Trang chủ</a></li>
                 <% if (Session["allow"] != null) { %>

                     <li><a class="maunennava" style="color:yellow" href="Cart.aspx">Giỏ hàng của bạn</a></li>
                 <% } %>
             </ul> 

             <ul class="nav navbar-nav navbar-right">
                 <% if (Session["allow"] == null) { %>
                     <li><a href="Signup.aspx"><span class="glyphicon glyphicon-user"></span> Đăng Kí</a></li>
                     <li><a href="Login.aspx"><span class="glyphicon glyphicon-log-in"></span> Đăng Nhập</a></li>
                 <% } else { %>
                     <li><a style="color: yellow; margin: 0px -131px;" href="Logout.aspx" onclick="return confirm('Bạn muốn đăng xuất?');">
                         <span  class="glyphicon glyphicon-log-out"></span>(<% Response.Write(Session["name"]); %>) Đăng xuất</a>
                     </li> 
                 <% } %>
             </ul>
         </div>
     </div>
 </nav>
</asp:Content> 


<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder3" runat="server">
    <div class="container">
    <aside class="left-panel">      
        <ul class="product-list">    
        <li><img src="logo/c_UPCH.jpg" alt="Laptop 2"></li>
        <li><img src="logo/logo-amd-inkythuatso-3-01-02-09-39-33.jpg" alt="Laptop 3"></li>
        <li><img src="logo/logo-asus-inkythuatso-2-01-26-09-12-02.jpg" alt="Laptop 4"></li>
        <li><img src="logo/logo-hang-may-tinh-hp.jpg" alt="Laptop 5"></li>
        <li><img src="logo/logo-msi-inkythuatso-4-01-27-14-36-47.jpg" alt="Laptop 6"></li>
        <li><img src="logo/logo-razer-inkythuatso-2-01-09-14-05-48.jpg" alt="Laptop 7"></li>
        <li><img src="logo/png-transparent-apple-logo-new-york-city-brand-computer-apple-company-computer-logo-thumbnail.jpg" alt="Laptop 8"></li>
        <li><img src="logo/png-transparent-dell-laptop-logo-brand-computer-laptop-blue-electronics-text-thumbnail.jpg" alt="Laptop 9"></li>
        <li><img src="logo/png-transparent-logo-samsung-electronics-organization-samsung-galaxy-samsung-blue-company-label-thumbnail.jpg" alt="Laptop 10"></li>
           <li>  <img src="logo/png-transparent-xiaomi-mi-logo-xiaomi-mobile-phones-computer-icons-battery-charger-brand-miscellaneous-angle-text-thumbnail.jpg" alt="Laptop 1"></li> 
        </ul>
    </aside>

  <main class="right-panel">
  <asp:Repeater ID="rptProducts" runat="server">
    <ItemTemplate>
        <div class="product-item">
            <img src='<%# Eval("ImagePath") %>' alt='<%# Eval("ProductName") %>' />
            <h3><%# Eval("ProductName") %></h3>
            <p>Giá: <%# string.Format("{0:#,0} Đ", Eval("Price")) %></p>
            <asp:Button style="font-size: 20px;" ID="btnBuy" runat="server" Text="Mua ngay" CssClass="btn btn-primary btn-lg" 

                CommandArgument='<%# Eval("ProductID") + ";" + Eval("ProductName") + ";" + Eval("ImagePath") + ";" + Eval("Price") %>' 
                OnClick="btnBuy_Click" />
        </div>
    </ItemTemplate>
</asp:Repeater>



</main>

</div>
</asp:Content>


   


