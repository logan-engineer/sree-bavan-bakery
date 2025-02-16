<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="sree_bavan_bakery.index" %>

<!DOCTYPE html>

<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
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
   
    <!-- Topbar Start -->
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
                <form runat="server"> <asp:LinkButton ID="LinkButton1" class="nav-item nav-link" runat="server" Visible="false" OnClick="LinkButton1_Click">Admin Page</asp:LinkButton>
                 </form>
            </div>
            
        </div>
               <div class="d-flex align-items-center">
 
  
       <div class="nav-item dropdown">
     <a href="#" class="nav-link dropdown-toggle  text-white" data-bs-toggle="dropdown">  <i class="fas fa-user"></i>
          <%Response.Write(Session["Name"]); %>
        
</a>
     <div class="dropdown-menu m-0"  aria-labelledby="navbarDropdownMenuAvatar">
           <a class="dropdown-item" href="useraccount.aspx"><i class="bi bi-person-fill-gear"></i> My profile</a>
        <a class="dropdown-item" href="#"><i class="bi bi-gear"></i> Settings</a>
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
    <!-- Navbar End -->




    <!-- Hero Start -->
    <div class="container-fluid bg-primary py-5 mb-5 hero-header">
        <div class="container py-5">
            <div class="row justify-content-start">
                <div class="col-lg-8 text-center text-lg-start">
                    <h1 class="font-secondary text-primary mb-4">Super Crispy</h1>
                    <h1 class="display-1 text-uppercase text-white mb-4">sree bavan bakery</h1>
                    <h1 class="text-uppercase text-white">The Best Cake In Tamil Nadu</h1>
                    <div class="d-flex align-items-center justify-content-center justify-content-lg-start pt-5">
                        <a href="" class="btn btn-primary border-inner py-3 px-5 me-5">Read More</a>
                        <button type="button" class="btn-play" data-bs-toggle="modal"
                            data-src="https://www.youtube.com/embed/DWRcNpR6Kdc" data-bs-target="#videoModal">
                            <span></span>
                        </button>
                        <h5 class="font-weight-normal text-white m-0 ms-4 d-none d-sm-block">Play Video</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Hero End -->


    <!-- Video Modal Start -->
    <div class="modal fade" id="videoModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content rounded-0">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Youtube Video</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- 16:9 aspect ratio -->
                    <div class="ratio ratio-16x9">
                        <iframe class="embed-responsive-item" src="" id="video" allowfullscreen allowscriptaccess="always"
                            allow="autoplay"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Video Modal End -->


    <!-- About Start -->
    <div id="about" class="container-fluid pt-5">
        <div class="container">
            <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
                <h2 class="text-primary font-secondary">About Us</h2>
                <h1 class="display-4 text-uppercase">Welcome To sree bavan bakery</h1>
            </div>
            <div class="row gx-5">
                <div class="col-lg-5 mb-5 mb-lg-0" style="min-height: 400px;">
                    <div class="position-relative h-100">
                        <img class="position-absolute w-100 h-100" src="img/about.jpg" style="object-fit: cover;">
                    </div>
                </div>
                <div class="col-lg-6 pb-5">
                    <h4 class="mb-4">"Baking memories since 1999,with passion and precision"</h4>
                    <p class="mb-5">"our story begins with mix of love,sugar and spice","meet our team of skilled bakers,dedicated to making your day sweeter." </p>
                    <div class="row g-5">
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center justify-content-center bg-primary border-inner mb-4" style="width: 90px; height: 90px;">
                                <i class="fa fa-heartbeat fa-2x text-white"></i>
                            </div>
                            <h4 class="text-uppercase">100% Healthy</h4>
                            <p class="mb-0">indulge in our guilt-free cakes,makes,made with wholesome ingredients for a healthier treat.</p>
                        </div>
                        <div class="col-sm-6">
                            <div class="d-flex align-items-center justify-content-center bg-primary border-inner mb-4" style="width: 90px; height: 90px;">
                                <i class="fa fa-award fa-2x text-white"></i>
                            </div>
                            <h4 class="text-uppercase">Award Winning</h4>
                            <p class="mb-0">sweet success:voted best cake shop of the year</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- About End -->


    <!-- Facts Start -->
    <div class="container-fluid bg-img py-5 mb-5">
        <div class="container py-5">
            <div class="row gx-5 gy-4">
                <div class="col-lg-3 col-md-6">
                    <div class="d-flex">
                        <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            <i class="fa fa-star text-white"></i>
                        </div>
                        <div class="ps-4">
                            <h6 class="text-primary text-uppercase">Our Experience</h6>
                            <h1 class="display-5 text-white mb-0" data-toggle="counter-up">167</h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="d-flex">
                        <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            <i class="fa fa-users text-white"></i>
                        </div>
                        <div class="ps-4">
                            <h6 class="text-primary text-uppercase">Cake Specialist</h6>
                            <h1 class="display-5 text-white mb-0" data-toggle="counter-up">300</h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="d-flex">
                        <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            <i class="fa fa-check text-white"></i>
                        </div>
                        <div class="ps-4">
                            <h6 class="text-primary text-uppercase">Complete Project</h6>
                            <h1 class="display-5 text-white mb-0" data-toggle="counter-up">700</h1>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="d-flex">
                        <div class="bg-primary border-inner d-flex align-items-center justify-content-center mb-3" style="width: 60px; height: 60px;">
                            <i class="fa fa-mug-hot text-white"></i>
                        </div>
                        <div class="ps-4">
                            <h6 class="text-primary text-uppercase">Happy Clients</h6>
                            <h1 class="display-5 text-white mb-0" data-toggle="counter-up">400</h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Facts End -->


    <!-- Products Start -->
    <div class="container-fluid about py-5">
        <div class="container">
            <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
                <h2 class="text-primary font-secondary">Menu & Pricing</h2>
                <h1 class="display-4 text-uppercase">Explore Our Cakes</h1>
            </div>
            <div class="tab-class text-center">
                <ul class="nav nav-pills d-inline-flex justify-content-center bg-dark text-uppercase border-inner p-4 mb-5">
                    <li class="nav-item">
                        <a class="nav-link text-white active" data-bs-toggle="pill" href="#tab-1">Birthday</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" data-bs-toggle="pill" href="#tab-2">Wedding</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" data-bs-toggle="pill" href="#tab-3">Custom</a>
                    </li>
                </ul>
                <div class="tab-content">
                    <div id="tab-1" class="tab-pane fade show p-0 active">
                        <div class="row g-3">
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/brithday/brithday1.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Birthday Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/brithday/brithday2.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Birthday Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/brithday/brithday3.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Birthday Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/brithday/brithday4.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Birthday Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/brithday/brithday5.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Birthday Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                         <img class="img-fluid" src="img/brithday/brithday6.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Birthday Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane fade show p-0">
                        <div class="row g-3">
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/wedding/wedding1.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Wedding Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/wedding/wedding2.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Wedding Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/wedding/wedding3.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Wedding Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/wedding/wedding4.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Wedding Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/wedding/wedding5.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Wedding Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/wedding/wedding6.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Wedding Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="tab-3" class="tab-pane fade show p-0">
                        <div class="row g-3">
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/cake-3.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Custom Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/cake-3.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Custom Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/cake-3.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Custom Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/cake-3.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Custom Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/cake-3.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Custom Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="d-flex h-100">
                                    <div class="flex-shrink-0">
                                        <img class="img-fluid" src="img/cake-3.jpg" alt="" style="width: 150px; height: 85px;">
                                        <h4 class="bg-dark text-primary p-2 m-0">$99.00</h4>
                                    </div>
                                    <div class="d-flex flex-column justify-content-center text-start bg-secondary border-inner px-4">
                                        <h5 class="text-uppercase">Custom Cake</h5>
                                        <span>Ipsum ipsum clita erat amet dolor sit justo sea eirmod diam stet sit justo</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->


    <!-- Service Start -->
    <div class="container-fluid service position-relative px-5 mt-5" style="margin-bottom: 135px;">
        <div class="container">
            <div class="row g-5">
                <div class="col-lg-4 col-md-6">
                    <div class="bg-primary border-inner text-center text-white p-5">
                        <h4 class="text-uppercase mb-3">Birthday Cake</h4>
                        <p>The cake is the crown jewel of every brithday celebration.A brithday is not complete without a delicious slice.</p>
                        <a class="text-uppercase text-dark" href="">Read More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="bg-primary border-inner text-center text-white p-5">
                        <h4 class="text-uppercase mb-3">Wedding Cake</h4>
                        <p>May your love grow stronger wiyh each passing year,and each delicious slice.A cake that celebrates the sweetness of marriage.</p>
                        <a class="text-uppercase text-dark" href="">Read More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="bg-primary border-inner text-center text-white p-5">
                        <h4 class="text-uppercase mb-3">Custom Cake</h4>
                        <p>Bring your dream cake to life with our custom designs.Every cake a masterpiece,every masterpiece yours.</p>
                        <a class="text-uppercase text-dark" href="">Read More <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
                <div class="col-lg-12 col-md-6 text-center">
                    <h1 class="text-uppercase text-light mb-4">
                        <asp:Label ID="lbl_Discount" runat="server" Text=""></asp:Label>%  Discount For This Summer</h1>
                    <a href="menu.aspx" class="btn btn-primary border-inner py-3 px-5">Order Now</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Service Start -->


    <!-- Team Start -->
    <div id="team" class="container-fluid py-5">
        <div class="container">
            <div class="section-title position-relative text-center mx-auto mb-5 pb-3" style="max-width: 600px;">
                <h2 class="text-primary font-secondary">Team Members</h2>
                <h1 class="display-4 text-uppercase">Our Master Chefs</h1>
            </div>
            <div class="row g-5">
                <div class="col-lg-4 col-md-6">
                    <div class="team-item">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/team-1.jpg" alt="">
                            <div class="team-overlay w-100 h-100 position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
                                <div class="d-flex align-items-center justify-content-start">
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="bg-dark border-inner text-center p-4">
                            <h4 class="text-uppercase text-primary">david</h4>
                            <p class="text-white m-0">master cook</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="team-item">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/team-2.jpg" alt="">
                            <div class="team-overlay w-100 h-100 position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
                                <div class="d-flex align-items-center justify-content-start">
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="bg-dark border-inner text-center p-4">
                            <h4 class="text-uppercase text-primary">john</h4>
                            <p class="text-white m-0">cheif cook</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6">
                    <div class="team-item">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid w-100" src="img/team-3.jpg" alt="">
                            <div class="team-overlay w-100 h-100 position-absolute top-50 start-50 translate-middle d-flex align-items-center justify-content-center">
                                <div class="d-flex align-items-center justify-content-start">
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                    <a class="btn btn-lg btn-primary btn-lg-square border-inner rounded-0 mx-1" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="bg-dark border-inner text-center p-4">
                            <h4 class="text-uppercase text-primary">lara</h4>
                            <p class="text-white m-0">cook</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Team End -->


    <!-- Offer Start -->
    <div class="container-fluid bg-offer my-5 py-5">
        <div class="container py-5">
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-7 text-center">
                    <div class="section-title position-relative text-center mx-auto mb-4 pb-3" style="max-width: 600px;">
                        <h2 class="text-primary font-secondary">Special Kombo Pack</h2>
                        <h1 class="display-4 text-uppercase text-white">Super Crispy Cakes</h1>
                    </div>
                    <p class="text-white mb-4"></p>
                    <a href="menu.aspx" class="btn btn-primary border-inner py-3 px-5 me-3">Shop Now</a>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- Offer End -->


    

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
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-primary border-inner py-3 fs-4 back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
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
