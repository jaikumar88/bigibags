<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="login-page">
		<div class="container">
			<h2 class="w3ls-title w3ls-title1">Login Form</h2>
		
			<div class="login-body" >
				
					<asp:TextBox ID="txtEmail" runat="server" CssClass="user" required="required" placeholder ="Email Address"></asp:TextBox>
                    <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="lock" runat="server" required="required" placeholder ="Password"></asp:TextBox>
                   
					<div class="forgot">
						<asp:Label ID="lblMsg" runat="server"></asp:Label>
					</div>

					<asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                    <div class="forgot">
						Do you want to business with us.<a href="Retailer/RetailerRegistration.aspx">Yes</a>
					</div>
				
			</div>
            <div class="clearfix"></div>
			<h4>For New People<h4>
			<p><a href="Registere.aspx">Register Here</a> (Or) go back to <a href="index.aspx">Home<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
		</div>
	</div>
</asp:Content>

