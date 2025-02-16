<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cart.aspx.cs" Inherits="sree_bavan_bakery.cart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>menu page</title>

    <link href="img/favicon.ico" rel="icon">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Oswald:wght@500;600;700&family=Pacifico&display=swap" rel="stylesheet">


    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">


    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">


    <link href="css/bootstrap.min.css" rel="stylesheet">


    <link href="css/style.css" rel="stylesheet">
</head>
<body>
    <div class="container-fluid px-0 d-none d-lg-block">
        <div class="row gx-0">
            <div class="col-lg-4 text-center bg-secondary py-3">
                <div class="d-inline-flex align-items-center justify-content-center">
                    <i class="bi bi-envelope fs-1 text-primary me-3"></i>
                    <div class="text-start">
                        <h6 class="text-uppercase mb-1">Email Us</h6>
                        <span>logu123@example.com</span>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 text-center bg-primary border-inner py-3">
                <div class="d-inline-flex align-items-center justify-content-center">
                    <a href="index.aspx" class="navbar-brand">
                        <h2 class="m-0 text-uppercase text-white"><i class="fa fa-birthday-cake fs-1 text-dark me-3"></i>sree bavan bakery</h2>
                    </a>
                </div>
            </div>
            <div class="col-lg-4 text-center bg-secondary py-3">
                <div class="d-inline-flex align-items-center justify-content-center">
                    <i class="bi bi-phone-vibrate fs-1 text-primary me-3"></i>
                    <div class="text-start">
                        <h6 class="text-uppercase mb-1">Call Us</h6>
                        <span>+09843589897</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a href="index.aspx" class="navbar-brand d-block d-lg-none">
            <h1 class="m-0 text-uppercase text-white"><i class="fa fa-birthday-cake fs-1 text-primary me-3"></i>sree bavan bakery</h1>
        </a>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto mx-lg-auto py-0">
                <a href="index.aspx" class="nav-item nav-link active">Home</a>
                <a href="#about" class="nav-item nav-link">About Us</a>
                <a href="menu.aspx" class="nav-item nav-link">Menu & Pricing</a>
                <a href="#team" class="nav-item nav-link">Master Chefs</a>
                <a href="contact.aspx" class="nav-item nav-link">Contact Us</a>
               
            </div>
        </div>
        <div class="d-flex align-items-center">


            <div class="nav-item dropdown">
                <a href="#" class="nav-link dropdown-toggle  text-white" data-bs-toggle="dropdown"><i class="fas fa-user"></i>
                    <%Response.Write(Session["Name"]); %>
        
                </a>
                <div class="dropdown-menu m-0" aria-labelledby="navbarDropdownMenuAvatar">
                    <a class="dropdown-item" href="useraccount.aspx"><i class="bi bi-person-gear"></i>My profile</a>
                    <a class="dropdown-item" href="#"><i class="bi bi-gear"></i>Settings</a>
                    <a class="dropdown-item" href='<%Response.Write(Session["entrylink"]); %>'><i class="bi bi-person-lock"></i><%Response.Write(Session["entryname"]); %></a>
                </div>

            </div>
            <a class="link-secondary me-3" href="cart.aspx">
                <i class="fas fa-shopping-cart"></i><span class="badge rounded-pill badge-notification bg-danger"><%Response.Write(Session["cartcount"]); %></span>
            </a>

            <a href="#">
                <i class="fas fa-bell"></i>
                <span class="badge rounded-pill badge-notification bg-danger">1</span> </a>

        </div>
    </nav>
    <!-- Navbar End -->
    <session>
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblmsg" runat="server" Text="Label" Visible="false"></asp:Label>
                    <div>
                        <h1 class="text-primary font-secondary">your shipping cart</h1>
                    </div>
                </div>
            </div>
        </div>
    </session>
    <div class="container">
        <form id="form1" runat="server" method="post">
            <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand" OnItemDataBound="Repeater2_ItemDataBound">
                <HeaderTemplate>
                    <table class="table table-responsive-lg table-hover">
                        <thead>
                            <tr>
                                <th>name</th>
                                <th>image</th>
                                <th>unit price</th>
                                <th>quantity</th>
                                <th>total price</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblname" runat="server" Text='<%#Eval("name") %>'></asp:Label>

                        </td>
                        <td>
                            <asp:Image ID="img2" runat="server" ImageUrl='<%# "~/img/"+Eval("product_image") %>' Style="width: 60px;" />
                        </td>
                        <td>
                            <asp:Label ID="lblprice" runat="server" Text='<%#Eval("cost") %>'></asp:Label>
                            <asp:HiddenField ID="hdnproductid" runat="server" Value='<%#Eval("productid") %>' />
                            <asp:HiddenField ID="hdnquantity" runat="server" Value='<%#Eval("cqty") %>' />
                            <asp:HiddenField ID="hdnprdquantity" runat="server" Value='<%#Eval("pqty") %>' />
                        </td>
                        <td>
                            <div class="quantity">
                                <div class="pro-qty">
                                    <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" Text='<%#Eval("cqty") %>' Width="70px"></asp:TextBox>
                                    <asp:RegularExpressionValidator ID="revQuantity" runat="server" ErrorMessage="*" ForeColor="Red"
                                        Font-Size="Small" ValidationExpression="[1-9]*" ControlToValidate="txtQuantity"
                                        Display="Dynamic" SetFocusOnError="true" EnableClientScript="true"></asp:RegularExpressionValidator>
                                </div>
                            </div>

                        </td>
                        <td>
                            <asp:Label ID="lbltotalprice" runat="server"></asp:Label>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbdelete" runat="server" Text="remove" CommandName="Remove"
                                CommandArgument='<%#Eval("productid") %>' OnClientClick="return confirm('do you want remove thid item from cart');">
                                <i class="bi bi-trash"></i></asp:LinkButton>
                        </td>
                        <td>
                            <asp:LinkButton ID="lbupdatecart" runat="server" CommandName="updatecart" CommandArgument='<%#Eval("productid") %>'>
                              <i class="bi bi-capslock-fill"></i></asp:LinkButton>
                        </td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    <tr>
                        <td colspan="3"></td>
                        <td class="pl-lg-5"><b>grand total:</b></td>
                        <td>
                            <%Response.Write(Session["grandtotalprice"]); %> 
                        </td>
                    </tr>

                    <tr>
                        <td></td>
                        <td></td>
                        <td>
                            <a href="menu.aspx" class="btn btn-info py-2">
                                <i class="fa fa-arrow-circle-left mr-2">continue shipping </i>
                            </a>

                        </td>


                        <td>
                            <asp:LinkButton ID="lbcheckout" runat="server" CommandName="checkout" CssClass="btn btn-success py-1">
                         checkout <i class="fa fa-arrow-circle-right mr-2"</asp:LinkButton>
                        </td>
                    </tr>

                    </tbody>
                    
            </table>
                </FooterTemplate>
            </asp:Repeater>
        </form>

    </div>
    <!-- Footer Start -->
          <div class="container-fluid bg-img text-secondary" style="margin-top: 90px">
    <div class="container">
        <div class="row gx-5">
            <div class="col-lg-4 col-md-6 mb-lg-n5">
                <div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary border-inner p-4">
                    <a href="index.html" class="navbar-brand">
                        <h3 class="m-0 text-uppercase text-white"><i class="fa fa-birthday-cake fs-1 text-dark me-3"></i>sree bavan bakery</h3>
                    </a>
                    <p class="mt-3">Order your dream cake today!<br />
                        Let is make your celebration sweeter,contact us.Get in touch for custom cake inquiries.</p>
                </div>
            </div>
            <div class="col-lg-8 col-md-6">
                <div class="row gx-5">
                    <div class="col-lg-4 col-md-12 pt-5 mb-5">
                        <h4 class="text-primary text-uppercase mb-4">Get In Touch</h4>
                        <div class="d-flex mb-2">
                            <i class="bi bi-geo-alt text-primary me-2"></i>
                            <p class="mb-0">123 Street, chennai, Tamil nadu</p>
                        </div>
                        <div class="d-flex mb-2">
                            <i class="bi bi-envelope-open text-primary me-2"></i>
                            <p class="mb-0">logu@example.com</p>
                        </div>
                        <div class="d-flex mb-2">
                            <i class="bi bi-telephone text-primary me-2"></i>
                            <p class="mb-0">+012 345 67890</p>
                        </div>
                        <div class="d-flex mt-4">
                            <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                            <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                        <h4 class="text-primary text-uppercase mb-4">Quick Links</h4>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-secondary mb-2" href="index.aspx"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                            <a class="text-secondary mb-2" href="#about"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                         
                            <a class="text-secondary mb-2" href="#team"><i class="bi bi-arrow-right text-primary me-2"></i>Meet The Team</a>
                      
                            <a class="text-secondary" href="contact.aspx"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                        <h4 class="text-primary text-uppercase mb-4">Newsletter</h4>
                        <p></p>
                        <form action="register.aspx">
                            <div class="input-group">
                                
                                <button class="btn btn-primary">Sign Up</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <div class="container-fluid text-secondary py-4" style="background: #111111;">
        <div class="container text-center">
            <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">logutech</a>. All Rights Reserved. Designed by logu</p>
        </div>
    </div>


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-inner py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->

    <script src="js/main.js"></script>
</body>
</html>
