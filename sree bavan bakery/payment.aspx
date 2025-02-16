<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="sree_bavan_bakery.payment" %>

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
    
    <div>
        <section class="gradient-custom">
            <div class="container">
                <div class="row col-12">
                    <div class="d-flex align-items-end mb-3">
                        <asp:Label ID="lblmsg" runat="server" Text="Label" Visible="false"></asp:Label>
                    </div>
                </div>
            </div>


            <div class="container my-5 py-5">
                <div class="row mb-4">
                    <div class="col-lg-8 mx-auto text-center">
                        <h1 class="display-6">Order Payment</h1>
                    </div>
                </div>



                <div class="row pb-5">
                    <div class="col-md-7 col-lg-6 mx-auto">
                        <div class="card" style="border-radius: 15px;">
                            <div class="card-header">
                                <div class="bd-white shadow-sm pt-4 pl-2 pr-2 pb-2">
                                    <ul role="tablist" class="nav bg-light nav-pills rounded nav-fill mb-3">
                                        <li class="nav-item"><a data-toggle="pill" href="#credit-card" class="nav-link active "><i class="fas fa-credit-card mr-2"></i>Credit Card </a></li>
                                        <li class="nav-item"><a data-toggle="pill" href="#cashondelivery" class="nav-link "><i class="fab fa-money mr-2"></i>cash</a></li>

                                    </ul>
                                </div>


                                <div class="tab-content">
                                    <div id="credit-card" class="tab-pane fade show active pt-3">
                                        <form role="form" runat="server" method="post">
                                          
                                            <div class="d-flex justify-content-between align-items-center mb-3">
                                                <div data-mdb-input-init class="form-outline">

                                                    <asp:TextBox ID="txtcardno" runat="server" class="form-control form-control-lg" siez="17"
                                                        placeholder="1234 5678 9012 3457" minlength="16" MaxLength="16"></asp:TextBox>

                                                    <asp:Label ID="lblcardnumber" runat="server" Text="Card Number" class="form-label" for="txtcardno"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="rfvcardno" runat="server" ErrorMessage="Card number is required" ControlToValidate="txtcardno" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                        ValidationGroup="card">*

                                                    </asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Card Nunber must be of 16 digits" ForeColor="Red" Display="Dynamic" SetFocusOnError="true"
                                                        ValidationExpression="[0-9]{16}" ControlToValidate="txtCardNo" ValidationGroup="card">*
                                                    </asp:RegularExpressionValidator>
                                                </div>

                                                <img src="https://img.icons8.com/color/48/000000/visa.png" alt="visa" width="64px" />
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <div data-mdb-input-init class="form-outline">

                                                    <asp:TextBox runat="server" ID="txtname" class="form-control form-control-lg" siez="17"
                                                        placeholder="Cardholder's Name" ></asp:TextBox>

                                                    <asp:Label ID="Label1" runat="server" Text="Cardholder's Name" class="form-label" for="txtname"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="rfvname" runat="server" ErrorMessages="Name is required" ControlToValidate="txtname"
                                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Name must be in characters" ValidationExpression="^[A-Za-z][A-Za-z0-9_]{7,29}$"
                                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtname" ValidationGroup="card">*
                                                    </asp:RegularExpressionValidator>
                                                </div>
                                            </div>

                                            <div class="d-flex justify-content-between align-items-center pb-2">
                                                <div data-mdb-input-init class="form-outline">
                                                   
                                                        <asp:TextBox type="text" ID="txtexpmonth" class="form-control form-control-lg" placeholder="MM"
                                                            size="3" minlength="2" MaxLength="2" runat="server"></asp:TextBox>
                                                        <asp:TextBox type="text" ID="txtexpyear" class="form-control form-control-lg" placeholder="YYYY"
                                                            size="3" minlength="4" MaxLength="4" runat="server"></asp:TextBox>

                                                        <asp:Label ID="Label3" runat="server" Text="Expiration" class="form-label" for="txtexpdate"></asp:Label>
                                                        <asp:RequiredFieldValidator ID="rfvexpmonth" runat="server" ErrorMessages=" exp month required" ControlToValidate="txtexpmonth"
                                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="exp month must be of 2 digits" ValidationExpression="[0-9]{2}"
                                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtexpmonth" ValidationGroup="card">*
                                                        </asp:RegularExpressionValidator>
                                                        <asp:RequiredFieldValidator ID="rfvexpyear" runat="server" ErrorMessages=" exp month required" ControlToValidate="txtexpyear"
                                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="exp year must be of 4 digits" ValidationExpression="[0-9]{4}"
                                                            ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtexpyear" ValidationGroup="card">*
                                                        </asp:RegularExpressionValidator>
                                                   
                                                </div>
                                                <div data-mdb-input-init class="form-outline">

                                                    <asp:TextBox type="password" ID="txtcvv" class="form-control form-control-lg"
                                                        placeholder="&#9679;&#9679;&#9679;" size="3" minlength="3" MaxLength="3" runat="server"></asp:TextBox>
                                                    <asp:Label ID="Label2" runat="server" Text="Cvv" class="form-label" for="typeText2"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="rfvcvv" runat="server" ErrorMessages="cvv id required" ControlToValidate="txtcvv"
                                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="cvv no.must be of 3 digits" ValidationExpression="[0-9]{3}"
                                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ControlToValidate="txtcvv" ValidationGroup="card">*
                                                    </asp:RegularExpressionValidator>
                                                </div>

                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mb-4">
                                                <div data-mdb-input-init class="form-outline">

                                                    <asp:TextBox runat="server" ID="txtaddress" class="form-control form-control-lg" siez="17"
                                                        placeholder="delivery address" TextMode="MultiLine" ValidationGroup="card"></asp:TextBox>

                                                    <asp:Label ID="Label4" runat="server" Text="delivery address" class="form-label" for="txtaddress"></asp:Label>
                                                    <asp:RequiredFieldValidator ID="rfvaddress" runat="server" ErrorMessages="address is required" ControlToValidate="txtaddress"
                                                        ForeColor="Red" Display="Dynamic" SetFocusOnError="true" ValidationGroup="card">*</asp:RequiredFieldValidator>

                                                </div>
                                                <asp:Button ID="Button1" runat="server" class="btn btn-info btn-lg btn-rounded" ValidationGroup="card" Text="pay" OnClick="Button1_Click" />

                          
                                            </div>
                                      
                                        <div class="card-footer">
                                            <b class="text text-black alert-success"> Order total:  <%Response.Write(Session["grandtotalprice"]); %> </b>
                                            <div class="pt-1">
                                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="card" HeaderText="fix following errors"
                                                    Font-Names="segoe script" />
                                            </div>
                                        </div>
                                          </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
    </div>

</body>
</html>
