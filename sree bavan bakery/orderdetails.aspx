<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="orderdetails.aspx.cs" Inherits="sree_bavan_bakery.orderdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>sree bavan bakery shop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="popular bakery shop in tamilnadu" name="keywords">
    <meta content="popular bakery shop in tamilnadu" name="description">
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


    <nav class="navbar navbar-expand-lg bg-dark navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-0">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a href="index.aspx" class="navbar-brand d-block d-lg-none">
            <h1 class="m-0 text-uppercase text-white"><i class="fa fa-birthday-cake fs-1 text-primary me-3"></i>sree bavan bakery</h1>
        </a>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto mx-lg-auto py-0">
                <a href="adminpage.aspx" class="nav-item nav-link">dashboard</a>
                <a href="customerpage.aspx" class="nav-item nav-link">customerdetails</a>
                <a href="productdetails.aspx" class="nav-item nav-link">productdetails</a>

                <a href="orderdetails.aspx" class="nav-item nav-link active">orderdetails</a>

                <a href="employeedetails.aspx" class="nav-item nav-link">employeedetails</a>
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
    <session>
        <div class="container">
            <div class="heading_container">
                <div class="align-self-end">
                    <asp:Label ID="lblmsg" runat="server" Text="Label" Visible="false"></asp:Label>
                    <div>
                        <h1 class="text-primary font-secondary">order status</h1>
                    </div>
                </div>
            </div>
        </div>
    </session>
    <div class="container">
        <form id="form1" runat="server" method="post">
            <asp:Repeater ID="Repeater2" runat="server">
                <HeaderTemplate>
                    <table class="table table-responsive-lg table-hover">
                        <thead>
                            <tr>
                                <th>order id</th>
                                <th>card id</th>

                                <th>order status</th>
                                <th>total cost</th>
                            </tr>
                        </thead>
                        <tbody>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Label ID="lblorderid" runat="server" Text='<%#Eval("orderid") %>'></asp:Label>

                        </td>
                        <td>
                            <asp:Label ID="lblcustomerid" runat="server" Text='<%#Eval("cardid") %>'></asp:Label>
                        </td>

                        <td>

                            <asp:Label ID="lblorderstatus" runat="server" Text='<%#Eval("orderstatus")%>' CssClass='<%#Eval("orderstatus").ToString()=="delivered"?"bg-success":"bg-warning" %>'></asp:Label>



                        </td>
                        <td>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("totalcost") %>'></asp:Label>
                        </td>

                        <td>
                            <asp:LinkButton ID="lbdelete" runat="server" Text="remove" CommandName="Remove"
                                CommandArgument='<%#Eval("orderid") %>' OnClientClick="return confirm('do you want remove thid item from cart');">
                               <i class="fa fa-close mr-2"></i></asp:LinkButton>
                        </td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </tbody>
                   
           </table>
                </FooterTemplate>
            </asp:Repeater>
        </form>

    </div>
    <!-- Footer Start -->

    <!-- Footer End -->


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
