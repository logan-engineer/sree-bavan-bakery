<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="sree_bavan_bakery.contact1" %>

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
            <h1 class="m-0 text-uppercase text-white"><i class="fa fa-birthday-cake fs-1 text-primary me-3"></i>CakeZone</h1>
        </a>

        <div class="collapse navbar-collapse" id="navbarCollapse">
            <div class="navbar-nav ms-auto mx-lg-auto py-0">
                <a href="index.aspx" class="nav-item nav-link">Home</a>
               
                <a href="menu.aspx" class="nav-item nav-link">Menu & Pricing</a>
               
               
               
                <a href="contact.aspx" class="nav-item nav-link active">Contact Us</a>
               
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
   
        <asp:Label ID="lblmsg" runat="server" Text="" Visible="false"></asp:Label>
       <div class="container bg-secondary py-5 my-5">
           <h2 class="text-primary font-secondary text-center mb-3">Give Your Feedback</h2>
            <div class="row justify-content-center">
                <div class="col-lg-6">
                    <form runat="server" method="post">
                        <div class="row g-3">
                            <div class="col-sm-12">

                                <asp:TextBox ID="txt_Name" runat="server" type="text" class="form-control bg-light border-0 px-4" placeholder="Your Name" Style="height: 55px;"></asp:TextBox>
                                
                                
                                <asp:RequiredFieldValidator ID="rfvname" runat="server" ErrorMessage="name is required" ControlToValidate="txt_Name"
                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-12">

                                <asp:TextBox ID="txt_Email" runat="server" textmode="Email" class="form-control bg-light border-0 px-4" placeholder="Your Email" Style="height: 55px;"></asp:TextBox>
   
                                <asp:RequiredFieldValidator ID="rfvemail" runat="server" ErrorMessage="email is required" ControlToValidate="txt_Email"
                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-12">
                                <asp:TextBox ID="txt_Subject" runat="server" type="text" class="form-control bg-light border-0 px-4" placeholder="Subject" Style="height: 55px;"></asp:TextBox>
        
                                <asp:RequiredFieldValidator ID="rfvsubject" runat="server" ErrorMessage="subject is required" ControlToValidate="txt_Subject"
                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-12">

                                <asp:TextBox ID="txt_Message" runat="server" class="form-control bg-light border-0 px-4 py-3" Rows="4" TextMode="MultiLine" placeholder="Message"></asp:TextBox>
                                
                                <asp:RequiredFieldValidator  ID="rvfmessage" runat="server" ErrorMessage="message is required" ControlToValidate="txt_Message"
                                    ForeColor="Red" Display="Dynamic" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-12">

                                <asp:Button ID="btn_Submit" runat="server" Text="Send Message" class="btn btn-primary border-inner w-100 py-3" type="submit" OnClick="btn_Submit_Click" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
           </div>
        
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
