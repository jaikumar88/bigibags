<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="agileits-modal modal fade" id="myModal88" tabindex="-1" role="dialog" aria-labelledby="myModal88"
		aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					<h4 class="modal-title" id="myModalLabel"><i class="fa fa-map-marker" aria-hidden="true"></i> Location</h4>
				</div>
				<div class="modal-body modal-body-sub"> 
					<h5>Select your delivery location </h5>  
					<select class="form-control bfh-states" data-country="US" data-state="CA">

						<option value="">Select Your location</option>
                        <% string location = "select Distinct Location  from tblStore";
                           clsConnection cLoc = new clsConnection();
                           System.Data.DataSet dsLoc = cLoc.SelectDS(location);
                           for(int l=0;l<dsLoc.Tables[0].Rows.Count;l++){
                            %>
						<option value="<%= dsLoc.Tables[0].Rows[l]["Location"] %>"><%= dsLoc.Tables[0].Rows[l]["Location"] %></option>
                        <% } %>
                        <%--<option value="AK">North Delhi</option><option value="AS">North West Delhi</option><option value="AZ">West Delhi</option><option value="AR">South West Delhi<option value="CA">South Delhi</option><option value="CO">South East Delhi</option><option value="CT">Central Delhi</option><option value="DE">North Delhi</option><option value="DC">North East Delhi</option><option value="FM">Shahdara</option><option value="FL">East Delhi</option>--%>
					</select>
					<input type="text" name="Name" placeholder="Enter your area / Landmark / Pincode" required="">
					<button type="button" class="close2" data-dismiss="modal" aria-hidden="true">Skip & Explore</button>
				</div>
			</div>
		</div>
	</div>
    
	<script>
	    $('#myModal88').modal('show');
	</script>
	<!-- //header -->	
	<!-- banner -->
	<div class="banner">
		<div id="kb" class="carousel kb_elastic animate_text kb_wrapper" data-ride="carousel" data-interval="6000" data-pause="hover">
			<!-- Wrapper-for-Slides -->
            <div class="carousel-inner" role="listbox">  
                <div class="item active"><!-- First-Slide -->
                    <img src="images/5.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_right">
                        <h3 data-animation="animated flipInX">Flat <span>50%</span> Discount</h3>
                        <h4 data-animation="animated flipInX">Hot Offer Today Only</h4>
                    </div>
                </div>  
                <div class="item"> <!-- Second-Slide -->
                    <img src="images/8.jpg" alt="" class="img-responsive" />
                    <div class="carousel-caption kb_caption kb_caption_right">
                        <h3 data-animation="animated fadeInDown">Our Latest Fashion Editorials</h3>
                        <h4 data-animation="animated fadeInUp">cupidatat non proident</h4>
                    </div>
                </div> 
                <div class="item"><!-- Third-Slide -->
                    <img src="images/3.jpg" alt="" class="img-responsive"/>
                    <div class="carousel-caption kb_caption kb_caption_center">
                        <h3 data-animation="animated fadeInLeft">End Of Season Sale</h3>
                        <h4 data-animation="animated flipInX">cupidatat non proident</h4>
                    </div>
                </div> 
            </div> 
            <!-- Left-Button -->
            <a class="left carousel-control kb_control_left" href="#kb" role="button" data-slide="prev">
				<span class="fa fa-angle-left kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a> 
            <!-- Right-Button -->
            <a class="right carousel-control kb_control_right" href="#kb" role="button" data-slide="next">
                <span class="fa fa-angle-right kb_icons" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a> 
        </div>
		<script src="js/custom.js"></script>
	</div>
	<!-- //banner -->  
	<!-- welcome -->
	<div class="welcome"> 
		<div class="container"> 
			<div class="welcome-info">
				<div class="bs-example bs-example-tabs" role="tabpanel" data-example-id="togglable-tabs">
                    <%  clsConnection c2 = new clsConnection();
                        string queryCat = "select * from Tbl_ProductCategory where Sno in (1,2,3,4,5) order by Sno";
                        System.Data.DataSet dsCat = new System.Data.DataSet();
                        dsCat = c2.SelectDS(queryCat);
                         %>
					<ul id="myTab" class=" nav-tabs" role="tablist">
						<li role="presentation" class="active"><a href="#home" id="home-tab" role="tab" data-toggle="tab" >
							<%--<i class="fa fa-laptop" aria-hidden="true"></i> --%>
                            <img src="images/grocerry.jpg" width="50" height="70" />
							<h5><% if(int.Parse(dsCat.Tables[0].Rows[0]["Sno"].ToString())==1) { %> <%= dsCat.Tables[0].Rows[0]["ProductCategory"] %><% } %></h5>
						</a></li>
						<li role="presentation"><a href="#carl" role="tab" id="carl-tab" data-toggle="tab"> 
							<%--<i class="fa fa-female" aria-hidden="true"></i>--%>
                            <img src="images/household.jpg" width="50" height="70" />
							<h5><% if(int.Parse(dsCat.Tables[0].Rows[1]["Sno"].ToString())==2) { %> <%= dsCat.Tables[0].Rows[1]["ProductCategory"] %><% } %></h5>
						</a></li>
						<li role="presentation"><a href="#james" role="tab" id="james-tab" data-toggle="tab"> 
							<%--<i class="fa fa-gift" aria-hidden="true"></i>--%>
                            <img src="images/personal.png" width="50" height="70" />
							<h5><% if(int.Parse(dsCat.Tables[0].Rows[2]["Sno"].ToString())==3) { %> <%= dsCat.Tables[0].Rows[2]["ProductCategory"] %><% } %></h5>
						</a></li>
						<li role="presentation"><a href="#decor" role="tab" id="decor-tab" data-toggle="tab"> 
							<i class="fa fa-home" aria-hidden="true"></i>
							<h5><% if(int.Parse(dsCat.Tables[0].Rows[3]["Sno"].ToString())==4) { %> <%= dsCat.Tables[0].Rows[3]["ProductCategory"] %><% } %></h5>
						</a></li>
						<li role="presentation"><a href="#sports" role="tab" id="sports-tab" data-toggle="tab"> 
							<%--<i class="fa fa-motorcycle" aria-hidden="true"></i>--%>
                            <img src="images/beverages.jpg" width="50" height="70" />
							<h5><% if(int.Parse(dsCat.Tables[0].Rows[4]["Sno"].ToString())==5) { %> <%= dsCat.Tables[0].Rows[4]["ProductCategory"] %><% } %></h5>
						</a></li> 
					</ul>
					<div class="clearfix"> </div>
					<h3 class="w3ls-title">Featured Products</h3>
					<div id="myTabContent" class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active" id="home" aria-labelledby="home-tab">
							<div class="tabcontent-grids">  
								<div id="owl-demo" class="owl-carousel"> 
                                    <% string queryProduct = "select top 8 * from Tbl_Products where ProductCategoryId = (select ProductCategoryId from Tbl_ProductCategory where Sno=1) order by ProductCategoryId desc";
                                       dsCat = c2.SelectDS(queryProduct);
                                       for(int p=0;p<dsCat.Tables[0].Rows.Count;p++) {
                                           int productid = int.Parse(dsCat.Tables[0].Rows[p]["ProductId"].ToString());
                                        %>

									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ProductDetail.aspx?pid=<%= productid %>"><img src="product_image_not_found.jpg" alt="img"><%--<img src="<%= dsCat.Tables[0].Rows[p]["SmallImage"] %>" alt="img">--%></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="products.html"><%= dsCat.Tables[0].Rows[p]["ProductName"] %></a></h4>
												<p><%= dsCat.Tables[0].Rows[p]["Description"] %></p>
												<h5><%= dsCat.Tables[0].Rows[p]["SellingPrice"] %> INR</h5> 
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
                                                    <input type="hidden" name="item_id" value="<%= productid %>">
													<input type="hidden" name="w3ls_item" value="<%= dsCat.Tables[0].Rows[p]["ProductName"] %>" /> 
													<input type="hidden" name="amount" value="<%= dsCat.Tables[0].Rows[p]["SellingPrice"] %>" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
												</form>  
											</div>   
										</div>   
									</div>
                                    <% } %>
									
								</div> 
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="carl" aria-labelledby="carl-tab">
							<div class="tabcontent-grids">
								<script>
								    $(document).ready(function () {
								        $("#owl-demo1").owlCarousel({

								            autoPlay: 3000, //Set AutoPlay to 3 seconds

								            items: 4,
								            itemsDesktop: [640, 5],
								            itemsDesktopSmall: [414, 4],
								            navigation: true

								        });

								    });
								</script>
								<div id="owl-demo1" class="owl-carousel"> 
                                    <% queryProduct = "select top 8 * from Tbl_Products where ProductCategoryId = (select ProductCategoryId from Tbl_ProductCategory where Sno=2) order by ProductCategoryId desc";
                                       dsCat = c2.SelectDS(queryProduct);
                                       for(int p=0;p<dsCat.Tables[0].Rows.Count;p++) {
                                        %>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ProductDetail.aspx?pid=<%= dsCat.Tables[0].Rows[p]["ProductId"] %>"><img src="product_image_not_found.gif" alt="img"><%--<img src="<%= dsCat.Tables[0].Rows[p]["SmallImage"] %>" alt="img">--%></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="products.html"><%= dsCat.Tables[0].Rows[p]["ProductName"] %></a></h4>
												<p><%= dsCat.Tables[0].Rows[p]["Description"] %></p>
												<h5><%= dsCat.Tables[0].Rows[p]["SellingPrice"] %> INR</h5> 
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="<%= dsCat.Tables[0].Rows[p]["ProductName"] %>" /> 
													<input type="hidden" name="amount" value="<%= dsCat.Tables[0].Rows[p]["SellingPrice"] %>" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
												</form>  
											</div>         
										</div>    
									</div>
                                    <% } %>
									   
								</div>   
							</div>
						</div> 
						<div role="tabpanel" class="tab-pane fade" id="james" aria-labelledby="james-tab">
							<div class="tabcontent-grids">
								<script>
								    $(document).ready(function () {
								        $("#owl-demo2").owlCarousel({

								            autoPlay: 3000, //Set AutoPlay to 3 seconds

								            items: 4,
								            itemsDesktop: [640, 5],
								            itemsDesktopSmall: [414, 4],
								            navigation: true

								        });

								    });
								</script>
								<div id="owl-demo2" class="owl-carousel"> 
									<% queryProduct = "select top 8 * from Tbl_Products where ProductCategoryId = (select ProductCategoryId from Tbl_ProductCategory where Sno=3) order by ProductCategoryId desc";
                                       dsCat = c2.SelectDS(queryProduct);
                                       for(int p=0;p<dsCat.Tables[0].Rows.Count;p++) {
                                        %>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ProductDetail.aspx?pid=<%= dsCat.Tables[0].Rows[p]["ProductId"] %>"><img src="product_image_not_found.gif" alt="img"><%--<img src="<%= dsCat.Tables[0].Rows[p]["SmallImage"] %>" alt="img">--%></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="products.html"><%= dsCat.Tables[0].Rows[p]["ProductName"] %></a></h4>
												<p><%= dsCat.Tables[0].Rows[p]["Description"] %></p>
												<h5><%= dsCat.Tables[0].Rows[p]["SellingPrice"] %> INR</h5> 
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="<%= dsCat.Tables[0].Rows[p]["ProductName"] %>" /> 
													<input type="hidden" name="amount" value="<%= dsCat.Tables[0].Rows[p]["SellingPrice"] %>" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
												</form>  
											</div>         
										</div>    
									</div>
                                    <% } %>
									 
								</div>    
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="decor" aria-labelledby="decor-tab">
							<div class="tabcontent-grids">
								<script>
								    $(document).ready(function () {
								        $("#owl-demo3").owlCarousel({

								            autoPlay: 3000, //Set AutoPlay to 3 seconds

								            items: 4,
								            itemsDesktop: [640, 5],
								            itemsDesktopSmall: [414, 4],
								            navigation: true

								        });

								    });
								</script>
								<div id="owl-demo3" class="owl-carousel"> 
									<% queryProduct = "select top 8 * from Tbl_Products where ProductCategoryId = (select ProductCategoryId from Tbl_ProductCategory where Sno=4) order by ProductCategoryId desc";
                                       dsCat = c2.SelectDS(queryProduct);
                                       for(int p=0;p<dsCat.Tables[0].Rows.Count;p++) {
                                        %>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ProductDetail.aspx?pid=<%= dsCat.Tables[0].Rows[p]["ProductId"] %>"><img src="product_image_not_found.gif" alt="img"><%--<img src="<%= dsCat.Tables[0].Rows[p]["SmallImage"] %>" alt="img">--%></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="products.html"><%= dsCat.Tables[0].Rows[p]["ProductName"] %></a></h4>
												<p><%= dsCat.Tables[0].Rows[p]["Description"] %></p>
												<h5><%= dsCat.Tables[0].Rows[p]["SellingPrice"] %> INR</h5> 
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="<%= dsCat.Tables[0].Rows[p]["ProductName"] %>" /> 
													<input type="hidden" name="amount" value="<%= dsCat.Tables[0].Rows[p]["SellingPrice"] %>" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
												</form>  
											</div>         
										</div>    
									</div>
                                    <% } %>
									  
								</div>    
							</div>
						</div>
						<div role="tabpanel" class="tab-pane fade" id="sports" aria-labelledby="sports-tab">
							<div class="tabcontent-grids">
								<script>
								    $(document).ready(function () {
								        $("#owl-demo4").owlCarousel({

								            autoPlay: 3000, //Set AutoPlay to 3 seconds

								            items: 4,
								            itemsDesktop: [640, 5],
								            itemsDesktopSmall: [414, 4],
								            navigation: true

								        });
								    });
								</script>
								<div id="owl-demo4" class="owl-carousel"> 
									<% queryProduct = "select top 8 * from Tbl_Products where ProductCategoryId = (select ProductCategoryId from Tbl_ProductCategory where Sno=5) order by ProductCategoryId desc";
                                       dsCat = c2.SelectDS(queryProduct);
                                       for(int p=0;p<dsCat.Tables[0].Rows.Count;p++) {
                                        %>
									<div class="item">
										<div class="glry-w3agile-grids agileits"> 
											<a href="ProductDetail.aspx?pid=<%= dsCat.Tables[0].Rows[p]["ProductId"] %>"><img src="product_image_not_found.gif" alt="img"><%--<img src="<%= dsCat.Tables[0].Rows[p]["SmallImage"] %>" alt="img">--%></a>
											<div class="view-caption agileits-w3layouts">           
												<h4><a href="products.html"><%= dsCat.Tables[0].Rows[p]["ProductName"] %></a></h4>
												<p><%= dsCat.Tables[0].Rows[p]["Description"] %></p>
												<h5><%= dsCat.Tables[0].Rows[p]["SellingPrice"] %> INR</h5> 
												<form action="#" method="post">
													<input type="hidden" name="cmd" value="_cart" />
													<input type="hidden" name="add" value="1" /> 
													<input type="hidden" name="w3ls_item" value="<%= dsCat.Tables[0].Rows[p]["ProductName"] %>" /> 
													<input type="hidden" name="amount" value="<%= dsCat.Tables[0].Rows[p]["SellingPrice"] %>" /> 
													<button type="submit" class="w3ls-cart" ><i class="fa fa-cart-plus" aria-hidden="true"></i> Add to cart</button>
												</form>  
											</div>         
										</div>    
									</div>
                                    <% } %>
								
								</div>    
							</div>
						</div> 
					</div>   
				</div>  
			</div>  	
		</div>  	
	</div> 
	<!-- //welcome -->
	<!-- add-products -->
	
	<!-- //add-products -->
	<!-- coming soon -->
	
	<!-- //coming soon -->
	<!-- deals -->
	<div class="deals"> 
		<div class="container"> 
			<h3 class="w3ls-title">Brands</h3>
			<div class="deals-row">
                <% string queryBrand = "select * from tblBrand";
                   dsCat = c2.SelectDS(queryBrand);
                   for(int k=0;k<dsCat.Tables[0].Rows.Count;k++) {
                    %>

				<div class="col-md-3 focus-grid"> 
					<a href="ProductMaster.aspx?bid=<%= dsCat.Tables[0].Rows[k]["ID"] %>" class="wthree-btn"> 
						<div class="focus-image"><i class="fa fa-mobile"></i></div>
						<h4 class="clrchg"><%= dsCat.Tables[0].Rows[k]["BrandName"] %></h4> 
					</a>
				</div>
                <% } %>
				
				<div class="clearfix"> </div>
			</div>  	
		</div>  	
	</div> 
</asp:Content>

