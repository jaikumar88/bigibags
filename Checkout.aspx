<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login-page">
		<div class="container">
			<h2>Checkout</h2>
             <asp:Panel ID="panelcheckpout" runat="server">
			<div class="login-body">
				<h5>Profile information</h5>
				
					<asp:TextBox ID="txtFirst" CssClass="user" runat="server" placeholder="First Name..." required="required"></asp:TextBox>
                    
					<asp:TextBox ID="txtSecond" CssClass="user" runat="server" placeholder="Last Name..." required="required"></asp:TextBox>
				    <asp:TextBox ID="txtEmail" runat="server" placeholder="EmailId..." required="required"></asp:TextBox>
                <asp:TextBox ID="txtPhone" CssClass="user" runat="server" placeholder="Phone No..." required="required"></asp:TextBox>
				
				<h6>Shipping Address</h6>
					
					
					<asp:TextBox ID="txtAddress1" CssClass="user" runat="server" placeholder="Land/Building Name..." required="required" ></asp:TextBox>
					<asp:TextBox ID="txtAddress2" CssClass="user" runat="server" placeholder="Near By Palace..." required="required"></asp:TextBox>
                    <asp:TextBox ID="txtAddress3" CssClass="user" runat="server" placeholder="Area..." required="required"></asp:TextBox>
                <asp:TextBox ID="txtCity" CssClass="user" runat="server" placeholder="City..." required="required" value="Delhi" ReadOnly="true"></asp:TextBox>
                <asp:TextBox ID="txtPincode" CssClass="user" runat="server" placeholder="Pincode..." required="required" ></asp:TextBox>
					<div class="register-check-box">
						<div class="check">
						</div>
					</div>
				
                
					<div class="register-check-box">
						<div class="check">
						</div>
					</div>
                    <asp:Button Text="Register" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"  />
				
			</div></asp:Panel>
			<div class="register">
				
                <asp:Panel ID="panel1" Visible="false" runat="server">
                        <table width="500" align="center" border="1">
                            <tr><th>Product</th><th>Quantity</th><th>Price</th></tr>
                            <% string query="select * from tblCart as cart inner join tbl_Products as product on cart.item_id = product.ProductId  where userId = '"+Session["userId"].ToString()+"'";
                                System.Data.DataSet ds=new System.Data.DataSet();
                                clsConnection c1=new clsConnection();
                                ds=c1.SelectDS(query);
                                
                                for(int i=0;i<ds.Tables[0].Rows.Count;i++) { %>
                            <tr><td><%= ds.Tables[0].Rows[i]["ProductName"] %></td><td><%= ds.Tables[0].Rows[i]["Qty"] %></td><td><%= ds.Tables[0].Rows[i]["Price"] %></td></tr>
                            <% } %>
                        </table>  
                             
                     <asp:Button runat="server" Text="Confirm Order" ID="btnConfirmOrder" OnClick="btnConfirmOrder_Click" />

				</asp:Panel>
			</div>
		</div>
	</div>
    
</asp:Content>

