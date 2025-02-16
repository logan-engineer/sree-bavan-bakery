<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forgotpassword.aspx.cs" Inherits="sree_bavan_bakery.forgotpassword" %>

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
     <nav class="navbar navbar-expand-lg bg-dark navbar-dark shadow-sm py-3 py-lg-0 px-3 px-lg-0">
     <a href="index.html" class="navbar-brand d-block d-lg-none">
         <h1 class="m-0 text-uppercase text-white"><i class="fa fa-birthday-cake fs-1 text-primary me-3"></i>sree bavan bakery</h1>
     </a>
      </nav>
    
    <!-- Topbar Start -->
    <div class="container-fluid px-0 d-none d-lg-block">
        <div class="row gx-0">
            <div class="col-lg-4 text-center bg-secondary py-3">
                <div class="d-inline-flex align-items-center justify-content-center">
                    <i class="bi bi-envelope fs-1 text-primary me-3"></i>
                    <div class="text-start">
                        <h6 class="text-uppercase mb-1">Email Us</h6>
                        <span>info@example.com</span>
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
                        <span>+012 345 6789</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->




    <!-- Page Header Start -->
    <div class="container-fluid bg-dark bg-img p-5 mb-5">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="display-4 text-uppercase text-white">Recover Password</h1>
               
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    
    <div class="container-fluid bg-light position-relative px-5" style="margin-top: 90px;">
    <div class="container">
    
         <!-- Navbar End -->
 <div class="container-fluid p-5 bg-secondary">
     <div class="card p-5 rounded">
        <div class="row justify-content-center">
            <div class="col-lg-12">
                 <form id="form1" runat="server" action="" method="post">
                       
  <div class="row col-md-12 col-lg-12 justify-content-center">
      <div class="col-sm-10">
          <asp:TextBox ID="txt_Forgot" runat="server" class="form-control bg-light border-1 px-4 text-center" placeholder="Enter Register Email" style="height: 55px;" BorderColor="blue"></asp:TextBox>
       
      </div>
       <div class="col-sm-2">
     <asp:Button ID="btn_Forgot" runat="server" Text="sent" class="btn btn-primary border-inner w-100 py-3" OnClick="btn_Forgot_Click" />
  
 </div>
     
    
     
  </div>
       <br />
         <br />
  
  <div class="row col-md-12 col-lg-12 justify-content-center">
     <div class="col-sm-10">
         <asp:TextBox ID="txt_verify" runat="server" class="form-control bg-light border-1 px-4 text-center" placeholder="Enter OTP" style="height: 55px;" BorderColor="blue" Visible="false"></asp:TextBox>
      
     </div>
      <div class="col-sm-2">
    <asp:Button ID="btn_verify" runat="server" Text="verify" class="btn btn-primary border-inner w-100 py-3" OnClick="btn_verify_Click" Visible="false" />
 
</div>
    
   
    
 </div>
 
             </form>
              
            </div>
        </div>
    </div>
</div>
          
    <!-- Contact End -->


    <!-- Footer Start -->
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    

    
   
    <!-- Footer End -->

         <div class="container-fluid text-secondary py-4" style="background: #111111;">
    
         <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">Your Site Name</a>. All Rights Reserved. Designed by logu</p>
   
 </div>
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
