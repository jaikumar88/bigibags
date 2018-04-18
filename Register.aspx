<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">Register Page</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- register -->
	<div class="login-page">
		<div class="container">
			<h2 class="w3ls-title w3ls-title1">Register Here</h2>
			<div class="login-body">
				<h5>profile information</h5>
				
					<asp:TextBox ID="txtFirst" CssClass="user" runat="server" placeholder="First Name..." required="required"></asp:TextBox>
                    
					<asp:TextBox ID="txtSecond" CssClass="user" runat="server" placeholder="Last Name..." required="required"></asp:TextBox>
                    <asp:TextBox ID="txtMobile" CssClass="user" runat="server" placeholder="Mobile No..." required="required"></asp:TextBox>
				
				
				<h6>Login information</h6>
					
					<asp:TextBox ID="txtEmail" CssClass="user" runat="server" placeholder="EmailId..." required="required"></asp:TextBox>
					<asp:TextBox ID="txtPassword" CssClass="lock" runat="server" placeholder="Password..." required="required" TextMode="Password"></asp:TextBox>
					<asp:TextBox ID="txtCPassword" CssClass="lock" runat="server" placeholder="Confirm Password..." required="required"></asp:TextBox>
					<div class="register-check-box">
						<div class="check">
							<asp:Label runat="server" Visible="false" ID="lblMessage" class="checkbox">Email Already in Use</asp:Label>
		
						</div>
					</div>
					
                    <asp:Button Text="Register" ID="btnSubmit" runat="server" OnClick="btnSubmit_Click"  />
				
			</div>
			<div class="register-home">
				<a href="index.aspx">Home
			</div>
		</div>
	</div>
</a>
</asp:Content>

