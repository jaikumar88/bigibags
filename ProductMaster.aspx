<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductMaster.aspx.cs" Inherits="ProductMaster" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript">
	function Pricefilter(i)
	{
		priceVal=document.getElementById(i).value
		alert(priceVal);
		window.location = "ProductMaster.aspx?price=" + priceVal;
	}
</script>
<% clsConnection con = new clsConnection();
   System.Data.DataSet dsPro = new System.Data.DataSet();
   string queryProduct = "";
   string search = "";
    if (Request.QueryString["id"] != null) {

        queryProduct = "select * from Tbl_Products where Status='Active' and ProductGroupId = '" + Request.QueryString["id"].ToString() + "' order by ProductId desc";
       dsPro = con.SelectDS(queryProduct);
   }
    if (Request.QueryString["bid"] != null)
    {
        queryProduct = "select * from Tbl_Products where Status='Active' and  BrandId = '" + Request.QueryString["bid"].ToString() + "' order by ProductId desc";
        dsPro = con.SelectDS(queryProduct);
    }
    if (Request.QueryString["cid"] != null)
    {
        queryProduct = "select * from Tbl_Products where Status='Active' and  ProductCategoryId = '" + Request.QueryString["cid"].ToString() + "' order by ProductId desc";
        dsPro = con.SelectDS(queryProduct);
    }
    if (Request.QueryString["search"] != null)
    {
        search = "true";
        queryProduct = "select * from Tbl_Products where Status='Active' and  ProductName like '%" + Request.QueryString["search"].ToString() + "%' order by ProductId desc";
        dsPro = con.SelectDS(queryProduct);
    }
    if (Request.QueryString["price"] != null)
    {
        string pricevalue =  Request.QueryString["price"].ToString();
		if(pricevalue !="5000")
		{
			string[] price = pricevalue.Split('-');
		
			queryProduct = "select * from Tbl_Products where Status='Active' and  SellingPrice > " + price[0] + " and SellingPrice<= " + price[1] + " order by ProductId desc";
		}
		else
		{
			queryProduct = "select * from Tbl_Products where Status='Active' and  SellingPrice > 4000 order by ProductId desc";
		}
        dsPro = con.SelectDS(queryProduct);
    }
    %>
    <div class="products">	 
		<div class="container">
			<div class="col-md-9 product-w3ls-right">
				<!-- breadcrumbs --> 
				<ol class="breadcrumb breadcrumb1">
					<li><a href="index.aspx">Home</a></li>
					<li class="active">Products</li>
				</ol> 
				<div class="clearfix"> </div>
				<!-- //breadcrumbs -->
				<div class="product-top">
					<h4></h4>
					<ul> 
						<li class="dropdown head-dpdn">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Filter By<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Low price</a></li> 
								<li><a href="#">High price</a></li>
								<li><a href="#">Latest</a></li> 
								<li><a href="#">Popular</a></li> 
							</ul> 
						</li>
						<li class="dropdown head-dpdn">

							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Brands<span class="caret"></span></a>
							<ul class="dropdown-menu">
								 <% clsConnection c3 = new clsConnection();
             string queryBrand = "select * from tblBrand";
                   System.Data.DataSet dsCat = c3.SelectDS(queryBrand);
                   for(int k=0;k<dsCat.Tables[0].Rows.Count;k++) {
                    %>
                                <li><a href="ProductMaster.aspx?bid=<%= dsCat.Tables[0].Rows[k]["ID"] %>"><%= dsCat.Tables[0] .Rows[k]["BrandName"] %></a></li> 
								 
                                <% } %>
							</ul> 
						</li>
					</ul> 
					<div class="clearfix"> </div>
				</div>
				<div class="products-row">
                    
                    <% if(dsPro.Tables[0].Rows.Count>0){
                        for(int product =0;product<dsPro.Tables[0].Rows.Count;product++) {
                            int productid = int.Parse(dsPro.Tables[0].Rows[product]["ProductId"].ToString());
                            
                            %>
					<div class="col-md-3 product-grids"> 
						<div class="agile-products">
							<div class="new-tag"><h6>20%<br>Off</h6></div>
                            
							<a href="ProductDetail.aspx?pid=<%= productid %>"><img src="product_image_not_found.jpg" alt="img" class="img-responsive" alt="img"><%--<img src="<%= dsPro.Tables[0].Rows[product]["SmallImage"] %>" class="img-responsive" alt="img">--%></a>
							<div class="agile-product-text">              
								<h5><a href="single.html"><%= dsPro.Tables[0].Rows[product]["ProductName"] %></a></h5> 
								<h6><del><%= dsPro.Tables[0].Rows[product]["Price"] %></del> <%= dsPro.Tables[0].Rows[product]["SellingPrice"] %></h6> 
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
                                    <input type="hidden" name="item_id" value="<%= productid %>">
									<input type="hidden" name="w3ls_item" value="<% Response.Write(dsPro.Tables[0].Rows[product]["ProductName"].ToString()); %>"> 
									<input type="hidden" name="amount" value="<% Response.Write(dsPro.Tables[0].Rows[product]["Price"].ToString()); %>"> 
									<button type="submit" class="w3ls-cart pw3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form> 
							</div>
						</div> 
					</div>
                    <% } }
                        if (dsPro.Tables[0].Rows.Count == 0 && search == "true")
                        {
                            bool flag=MailSender.SendEmail("durgeshengrit@gmail.com", "Search Product Not Found", "Dear Admin,<br><br> Below product is search by user and not found in our store. <br><br> -" + Request.QueryString["search"].ToString(), System.Web.Mail.MailFormat.Html);
                        }
                       %>
					 
					<div class="clearfix"> </div>
				</div>
				<!-- add-products --> 
				<div class="w3ls-add-grids w3agile-add-products">
					<a href="#"> 
						<h4>TOP 10 TRENDS FOR YOU FLAT <span>20%</span> OFF</h4>
						<h6>Shop now <i class="fa fa-arrow-circle-right" aria-hidden="true"></i></h6>
					</a>
				</div> 
				<!-- //add-products -->
			</div>
			<div class="col-md-3 rsidebar">
				<div class="rsidebar-top">
					<div class="slider-left">
						<h4>Filter By Price</h4>            
						<div class="row row1 scroll-pane jspScrollable" tabindex="0" style="overflow: hidden; padding: 0px; width: 223px;">
							
							 
							 
							 
							 
							 
							 
						<div class="jspContainer" style="width: 223px; height: 160px;"><div class="jspPane" style="padding: 0px; width: 246px; top: 0px;"><label class="checkbox"><input type="radio" name="checkbox" id="rdo0" onchange="Pricefilter(this.id)" value="1-1000"><i></i>0 - 1000  </label><label class="checkbox"><input type="radio" name="checkbox" id="rdo1000" value="1000-2000" onchange="Pricefilter(this.id)"> <i></i> 1000 - 2000 </label><label class="checkbox"><input type="radio" name="checkbox" id="rdo2000" value="2000-3000" onchange="Pricefilter(this.id)"><i></i>2000 - 3000  </label><label class="checkbox" ><input type="radio" id="rdo3000" name="checkbox" value="3000-4000" onchange="Pricefilter(this.id)"><i></i>3000 - 4000 </label><label class="checkbox"><input type="radio" name="checkbox" id="rdomore" value="5000" onchange="Pricefilter(this.id)"><i></i>More</label></div><div class="jspVerticalBar"><div class="jspCap jspCapTop"></div><div class="jspTrack" style="height: 160px;"><div class="jspDrag" style="height: 99px;"><div class="jspDragTop"></div><div class="jspDragBottom"></div></div></div><div class="jspCap jspCapBottom"></div></div></div></div> 
					</div>
					
					<div class="sidebar-row">
						<h4>DISCOUNTS</h4>
						<div class="row row1 scroll-pane jspScrollable" tabindex="0" style="overflow: hidden; padding: 0px; width: 223px;">
							
							
							
							
							
							
							
							
						<div class="jspContainer" style="width: 223px; height: 160px;"><div class="jspPane" style="padding: 0px; width: 246px; top: 0px;"><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Upto - 10% (20)</label><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>70% - 60% (5)</label><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>50% - 40% (7)</label><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (2)</label><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (5)</label><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>30% - 20% (7)</label><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>10% - 5% (2)</label><label class="checkbox"><input type="checkbox" name="checkbox"><i></i>Other(50)</label></div><div class="jspVerticalBar"><div class="jspCap jspCapTop"></div><div class="jspTrack" style="height: 160px;"><div class="jspDrag" style="height: 88px;"><div class="jspDragTop"></div><div class="jspDragBottom"></div></div></div><div class="jspCap jspCapBottom"></div></div></div></div>
					</div>
								 
				</div>
				<div class="related-row">
					<h4>Related Searches</h4>
					<ul>
						<li><a href="products.html">Air conditioner </a></li>
						<li><a href="products.html">Gaming</a></li>
						<li><a href="products.html">Monitors</a></li>
						<li><a href="products.html">Pc </a></li>
						<li><a href="products.html">Food Processors</a></li>
						<li><a href="products.html">Oven</a></li>
						<li><a href="products.html">Purifiers</a></li>
						<li><a href="products.html">Oven</a></li>
						<li><a href="products.html">Cleaners</a></li>
						<li><a href="products.html">Small devices</a></li>
					</ul>
				</div>
				<div class="related-row">
					<h4>YOU MAY ALSO LIKE</h4>
					<div class="galry-like">  
						<a href="single.html"><img src="images/e1.png" class="img-responsive" alt="img"></a>             
						<h4><a href="products.html">Audio speaker</a></h4> 
						<h5>$100</h5>       
					</div>
				</div>
			</div>
			<div class="clearfix"> </div>
			<!-- recommendations -->
			<div class="recommend">
				<h3 class="w3ls-title">Our Recommendations </h3> 
				<script>
				    $(document).ready(function () {
				        $("#owl-demo5").owlCarousel({

				            autoPlay: 3000, //Set AutoPlay to 3 seconds

				            items: 4,
				            itemsDesktop: [640, 5],
				            itemsDesktopSmall: [414, 4],
				            navigation: true

				        });

				    });
				</script>
				<div id="owl-demo5" class="owl-carousel owl-theme" style="opacity: 1; display: block;">
					<div class="owl-wrapper-outer"><div class="owl-wrapper" style="width: 4560px; left: 0px; display: block; transition: all 800ms ease; transform: translate3d(-570px, 0px, 0px);"><div class="owl-item" style="width: 285px;"><div class="item">
						<div class="glry-w3agile-grids agileits">
							<div class="new-tag"><h6>20% <br> Off</h6></div>
							<a href="products1.html"><img src="images/f2.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">Women Sandal</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$20</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="Women Sandal"> 
									<input type="hidden" name="amount" value="20.00"> 
									<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div> 
					</div></div><div class="owl-item" style="width: 285px;"><div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<a href="products.html"><img src="images/e4.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products.html">Digital Camera</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$80</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="Digital Camera"> 
									<input type="hidden" name="amount" value="100.00"> 
									<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>         
						</div>  
					</div></div><div class="owl-item" style="width: 285px;"><div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<div class="new-tag"><h6>New</h6></div>
							<a href="products4.html"><img src="images/s1.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products4.html">Roller Skates</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$180</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="Roller Skates"> 
									<input type="hidden" name="amount" value="180.00"> 
									<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>         
						</div>  
					</div></div><div class="owl-item" style="width: 285px;"><div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<a href="products1.html"><img src="images/f1.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products1.html">T Shirt</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$10</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="T Shirt"> 
									<input type="hidden" name="amount" value="10.00"> 
									<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div>    
					</div></div><div class="owl-item" style="width: 285px;"><div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<div class="new-tag"><h6>New</h6></div>
							<a href="products6.html"><img src="images/p1.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products6.html">Coffee Mug</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$14</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="Coffee Mug"> 
									<input type="hidden" name="amount" value="14.00"> 
									<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>         
						</div>  
					</div></div><div class="owl-item" style="width: 285px;"><div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<div class="new-tag"><h6>20% <br> Off</h6></div>
							<a href="products6.html"><img src="images/p2.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">              
								<h4><a href="products6.html">Teddy bear</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$20</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="Teddy bear"> 
									<input type="hidden" name="amount" value="20.00"> 
									<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div> 
					</div></div><div class="owl-item" style="width: 285px;"><div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<a href="products4.html"><img src="images/s2.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products4.html">Football</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$70</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="Football"> 
									<input type="hidden" name="amount" value="70.00">
									<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>        
						</div> 
					</div></div><div class="owl-item" style="width: 285px;"><div class="item">
						<div class="glry-w3agile-grids agileits"> 
							<div class="new-tag"><h6>Sale</h6></div>
							<a href="products3.html"><img src="images/h1.png" alt="img"></a>
							<div class="view-caption agileits-w3layouts">           
								<h4><a href="products3.html">Wall Clock</a></h4>
								<p>Lorem ipsum dolor sit amet consectetur</p>
								<h5>$80</h5>
								<form action="#" method="post">
									<input type="hidden" name="cmd" value="_cart">
									<input type="hidden" name="add" value="1"> 
									<input type="hidden" name="w3ls_item" value="Wall Clock"> 
									<input type="hidden" name="amount" value="80.00"> 
									<button type="submit" class="w3ls-cart"><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
								</form>
							</div>         
						</div>  
					</div></div></div></div>
					  
					
					
					
					
					 
					 
				<div class="owl-controls clickable"><div class="owl-pagination"><div class="owl-page active"><span class=""></span></div><div class="owl-page"><span class=""></span></div></div><div class="owl-buttons"><div class="owl-prev">prev</div><div class="owl-next">next</div></div></div></div>    
			</div>
			<!-- //recommendations -->
		</div>
	</div>
</asp:Content>

