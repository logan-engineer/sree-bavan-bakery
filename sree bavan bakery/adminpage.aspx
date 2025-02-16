<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="adminpage.aspx.cs" Inherits="sree_bavan_bakery.customerdetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
    <title>sree bavan bakery shop</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="popular bakery shop in tamilnadu" name="keywords">
    <meta content="popular bakery shop in tamilnadu" name="description">
    <link href="img/favicon.ico" rel="icon">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Oswald:wght@500;600;700&family=Pacifico&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    

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
                <a href="adminpage.aspx" class="nav-item nav-link active">dashboard</a>
                <a href="customerpage.aspx" class="nav-item nav-link">customerdetails</a>
                <a href="productdetails.aspx" class="nav-item nav-link">productdetails</a>
                
                <a href="orderdetails.aspx" class="nav-item nav-link">orderdetails</a>

                <a href="employeedetails.aspx" class="nav-item nav-link">employeedetails</a>
            </div>
        </div>
                      <div class="d-flex align-items-center">
 
  
       <div class="nav-item dropdown">
     <a href="#" class="nav-link dropdown-toggle  text-white" data-bs-toggle="dropdown">  <i class="fas fa-user"></i>
          <%Response.Write(Session["Name"]); %>
        
</a>
     <div class="dropdown-menu m-0"  aria-labelledby="navbarDropdownMenuAvatar">
           <a class="dropdown-item" href="useraccount.aspx"><i class="bi bi-person-fill-gear"></i> My profile</a>
        <a class="dropdown-item" href="#"><i class="bi bi-person-gear"></i> Settings</a>
        <a class="dropdown-item" href='<%Response.Write(Session["entrylink"]); %>'><i class="bi bi-person-lock"></i> <%Response.Write(Session["entryname"]); %></a> 
     </div>
           
 </div>
  <a class="link-secondary me-3" href="cart.aspx">
    <i class="fas fa-shopping-cart"></i> <span class="badge rounded-pill badge-notification bg-danger"> <%Response.Write(Session["cartcount"]); %></span>
  </a>
                 
     <a href="#" > 
        <i class="fas fa-bell"></i>
 <span class="badge rounded-pill badge-notification bg-danger">1</span> </a>

</div>
    </nav>
    <div class="bg-secondary">
        <div class="container-fluid bg-white py-5 mb-5">
            <div class="card-body">
                 <form runat="server" method="post">
                <div class="container py-10">
                    <div class="row gx-5 gy-4">
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex">
                                <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                                    <i class="fa fa-users text-dark"></i>
                                </div>
                                <div class="ps-4">
                                    <h6 class="text-primary text-uppercase">no of customer</h6>

                                    <h1 class="display-5 text-dark mb-0" data-toggle="counter-up">
                                       
                                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                        
                                    </h1>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex">
                                <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                                    <i class="fa fa-star text-dark"></i>
                                </div>
                                <div class="ps-4">
                                    <h6 class="text-primary text-uppercase">no of item</h6>
                                    <h1 class="display-5 text-dark mb-0" data-toggle="counter-up">
                                         <asp:Label ID="lbl_Item" runat="server" Text=""></asp:Label>
                                    </h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex">
                                <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                                    <i class="fa fa-check text-dark"></i>
                                </div>
                                <div class="ps-4">
                                    <h6 class="text-primary text-uppercase">order</h6>
                                    <h1 class="display-5 text-dark mb-0" data-toggle="counter-up">
                                        <asp:Label ID="lbl_Order" runat="server" Text=""></asp:Label>
                                    </h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex">
                                <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                                    <i class="bi bi-person-gear text-dark"></i>
                                </div>
                                <div class="ps-4">
                                    <h6 class="text-primary text-uppercase">no of employee</h6>
                                    <h1 class="display-5 text-dark mb-0" data-toggle="counter-up">
                                        <asp:Label ID="lbl_Employee" runat="server" Text=""></asp:Label>
                                    </h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex">
                                <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                                    <i class="bi bi-emoji-smile-fill text-dark"></i>
                                </div>
                                <div class="ps-4">
                                    <h6 class="text-primary text-uppercase">feedback</h6>
                                    <h1 class="display-5 text-dark mb-0" data-toggle="counter-up">
                                        <asp:Label ID="lbl_Feedback" runat="server" Text=""></asp:Label>
                                    </h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex">
                                <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                                   <i class="bi bi-currency-rupee text-dark"></i>
                                </div>
                                <div class="ps-4">
                                    <h6 class="text-primary text-uppercase">total amount</h6>
                                    <h1 class="display-5 text-dark mb-0" data-toggle="counter-up">
                                        <asp:Label ID="lbl_Total" runat="server" Text=""></asp:Label>
                                    </h1>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex">
                                <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 80px; height: 80px;">
                                   <i class="bi bi-percent text-dark"></i>
                                </div>
                                <div class="ps-4">
                                    <h6 class="text-primary text-uppercase">discount</h6>
                                  
                                       
                                        <h2 class="display-5 text-dark mb-0"><asp:TextBox ID="txt_Discount" runat="server" Width="70px" Height="50px" BorderStyle="None"></asp:TextBox>
                                            <asp:Button ID="btn_Discount" runat="server" Class="btn btn-warning" Text="Add" OnClick="btn_Discount_Click" /></h2>
                                    
                                       
                                </div>
                            </div>
                        </div>
                    </div>
             </form>
                </div>
            </div>
        </div>

    </div>


    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>


    <script src="js/main.js"></script>
</body>
</html>
