<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="productdetails.aspx.cs" Inherits="sree_bavan_bakery.productdetails" %>

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
             <a href="productdetails.aspx" class="nav-item nav-link active">productdetails</a>
             
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
           <a class="dropdown-item" href="useraccount.aspx"><i class="bi bi-person-gear"></i> My profile</a>
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
    <button class="btn btn-success" onclick="window.print()">print</button>
    <div class="container-fluid ">
        <div class="row justify-content-center">

            <form id="form1" runat="server" method="post">

                <asp:GridView ID="GridView1" CssClass="table table-bordered table-responsive" runat="server" AutoGenerateColumns="False" BorderWidth="2px" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" BorderStyle="Solid" ShowFooter="True" DataKeyNames="id" OnRowEditing="InkBtnEdit" OnRowCommand="GridView1_RowCommand" ShowHeaderWhenEmpty="true" OnRowCancelingEdit="InkBinCancel" OnRowDeleting="InkBtnDelete" OnRowUpdating="Inkitnupdate">
                    <Columns>


                        <asp:TemplateField HeaderText="ID">

                            <EditItemTemplate>

                                <asp:TextBox ID="txt_Id" runat="server" Text='<%# Bind("id") %>'></asp:TextBox>
                            </EditItemTemplate>



                            <ItemTemplate>

                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>

                            </ItemTemplate>

                            <FooterTemplate>

                                <asp:TextBox ID="txtID" runat="server"></asp:TextBox>

                            </FooterTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Name">

                            <EditItemTemplate>

                                <asp:TextBox ID="txt_Name" runat="server" Text='<%#Bind("name")%>'></asp:TextBox>

                            </EditItemTemplate>


                            <ItemTemplate>

                                <asp:Label ID="Label2" runat="server" Text='<%#Bind("name")%>'></asp:Label>

                            </ItemTemplate>
                            <FooterTemplate>

                                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

                            </FooterTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Cost">

                            <EditItemTemplate>

                                <asp:TextBox ID="txt_Cost" runat="server" Text='<%#Bind("cost")%>'></asp:TextBox>

                            </EditItemTemplate>


                            <ItemTemplate>

                                <asp:Label ID="Label3" runat="server" Text='<%#Bind("cost")%>'></asp:Label>

                            </ItemTemplate>
                            <FooterTemplate>

                                <asp:TextBox ID="txtCost" runat="server"></asp:TextBox>

                            </FooterTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Quantity">

                            <EditItemTemplate>

                                <asp:TextBox ID="txt_Quantity" runat="server" Text='<%#Bind("quantity")%>'></asp:TextBox>

                            </EditItemTemplate>


                            <ItemTemplate>

                                <asp:Label ID="Label6" runat="server" Text='<%#Bind("quantity")%>'></asp:Label>

                            </ItemTemplate>
                            <FooterTemplate>

                                <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>

                            </FooterTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Manufacturing">

                            <EditItemTemplate>

                                <asp:TextBox ID="txt_Manufacturing" runat="server" Text='<%#Bind("manufacturing")%>'></asp:TextBox>

                            </EditItemTemplate>


                            <ItemTemplate>

                                <asp:Label ID="Label4" runat="server" Text='<%#Bind("manufacturing")%>'></asp:Label>

                            </ItemTemplate>
                            <FooterTemplate>

                                <asp:TextBox ID="txtManufacturing" runat="server"></asp:TextBox>

                            </FooterTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Exp_date">

                            <EditItemTemplate>

                                <asp:TextBox ID="txt_Exp_Date" runat="server" Text='<%#Bind("exp_date")%>'></asp:TextBox>

                            </EditItemTemplate>


                            <ItemTemplate>

                                <asp:Label ID="Label5" runat="server" Text='<%#Bind("exp_date")%>'></asp:Label>

                            </ItemTemplate>
                            <FooterTemplate>

                                <asp:TextBox ID="txtExp_date" runat="server"></asp:TextBox>

                            </FooterTemplate>

                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="ProductImage">

                            <EditItemTemplate>

                                <asp:FileUpload ID="fu1" runat="server" />

                            </EditItemTemplate>


                            <ItemTemplate>

                                <asp:Image ID="img1" runat="server" ImageUrl='<%# "~/img/"+Eval("product_image") %>' Width="60px" />

                            </ItemTemplate>
                            <FooterTemplate>

                                <asp:FileUpload ID="fileupload" runat="server" />

                            </FooterTemplate>

                        </asp:TemplateField>

                        <asp:TemplateField>

                            <EditItemTemplate>

                                <asp:LinkButton ID="Inkitnupdate" runat="server" CausesValidation="True" CommandName="Update" Text="Update"></asp:LinkButton>
                                &nbsp;
                                <br />
                                <asp:LinkButton ID="InkBinCancel" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel"></asp:LinkButton>

                            </EditItemTemplate>



                            <ItemTemplate>

                                <asp:LinkButton ID="InkBtnEdit" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit"></asp:LinkButton>
                                &nbsp;<br />
                                <asp:LinkButton ID="InkBtnDelete" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete"></asp:LinkButton>

                            </ItemTemplate>
                            <FooterTemplate>

                                <asp:LinkButton ID="InkBtnInsert" runat="server" CommandName="insert"> Insert</asp:LinkButton>

                            </FooterTemplate>


                        </asp:TemplateField>

                    </Columns>


                </asp:GridView>
        </div>
        </form>
              
    </div>
    </div>
</body>
</html>
