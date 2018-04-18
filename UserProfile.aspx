<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="breadcrumbs">
		<div class="container">
			<ol class="breadcrumb breadcrumb1 animated wow slideInLeft" data-wow-delay=".5s">
				<li><a href="index.aspx"><span class="glyphicon glyphicon-home" aria-hidden="true"></span>Home</a></li>
				<li class="active">My Profile Page</li>
			</ol>
		</div>
	</div>
<!-- //breadcrumbs -->
<!-- register -->
	<div class="login-page">
		<div class="container">
			<h2 class="w3ls-title w3ls-title1">My Account</h2>
			<div class="login-body">
				<h5>Profile information</h5>
                <% clsConnection cP = new clsConnection();
                   string sqlProfile = "select * from tblRegisteration where EmailId = '" + Session["userId"].ToString() + "'";
                   System.Data.DataSet ds1 = new System.Data.DataSet();
                   ds1 = cP.SelectDS(sqlProfile);
                    %>
				
					<input type="text" ID="txtFirst" value="<%= ds1.Tables[0].Rows[0]["FirstName"] %>" class="user"  placeholder="First Name..." required="required" />
                    
					<input type="text" ID="Text1" value="<%= ds1.Tables[0].Rows[0]["LastName"] %>" class="user"  placeholder="First Name..." required="required" />
                    <input type="text" ID="Text2" value="<%= ds1.Tables[0].Rows[0]["MobileNo"] %>" class="user"  placeholder="Mobile No..." required="required" />
				
				
				<h6>Login information</h6>
					
					<input type="text" ID="txtEmail" value="<%= ds1.Tables[0].Rows[0]["EmailId"] %>" Class="user" ReadOnly="true" placeholder="EmailId..." required="required" />
					
					
					
                    
				
			</div>
			<div class="register-home">
				<a href="index.aspx">Home
			</div>
		</div>
	</div>
</asp:Content>

