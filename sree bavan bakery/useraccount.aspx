<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="useraccount.aspx.cs" Inherits="sree_bavan_bakery.useraccount" %>

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


    <link href="css/style.css" rel="stylesheet" />

    <script src="maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://bootswatch.com/4/simplex/bootstrap.min.css" />
    <link href="css/StyleSheet1.css" rel="stylesheet" />
    <script src="js/JavaScript.js"></script>

</head>
<body class="bg bg-light">
    <section class="book_section layout_padding">
        <div class="container bg-transparent">

            <h1 class="bg bg-secondary border-2">User Information</h1>
        </div>

        <div class="row justify-content-center">
            <div class="col-8">
                <div class="card shadow">

                    <div class="card-body ">
                        <div class="card-title mb-4">
                            <div class="d-flex justify-content-start">
                                <div class="image-container">
                                    <img src="img/user.png" alt="http://placehold.it/150x150" id="imgProfile" style="width: 150px; height: 150px" class="img-thumbnail" />
                                    <div class="middle">
                                        <input type="button" class="btn btn-secondary" id="btnChangePicture" value="Change" />
                                        <input type="file" style="display: none;" id="profilePicture" name="file" />
                                    </div>
                                </div>
                                <div class="userData ml-3">
                                    <h2 class="d-block  justify-end" style="font-size: 1.5rem; font-weight: bold"><a href="javascript:void(0);"></a>ID : <%Response.Write(Session["Id"]); %></h2>
                                    <h6 class="d-block"><a href="javascript:void(0);"></a><i class="bi bi-person text-primary me-2 "></i><%Response.Write(Session["Name"]); %></h6>
                                    <h6 class="d-block"><a href="javascript:void(0);"></a><i class="bi bi-envelope-open text-primary me-2"></i><%Response.Write(Session["Email"]); %></h6>
                                    <h6 class="d-block"><a href="javascript:void(0);"></a><i class="bi bi-geo-alt text-primary me-2"></i><%Response.Write(Session["Address"]); %></h6>
                                    <h6 class="d-block"><a href="javascript:void(0);"></a><i class="bi bi-telephone text-primary me-2"></i><%Response.Write(Session["Phone"]); %></h6>
                                </div>
                                <div class="ml-auto">
                                    <input type="button" class="btn btn-primary d-none" id="btnDiscard" value="Discard Changes" />
                                </div>
                            </div>
                        </div>
                        <form method="post" runat="server">
                            <div class="row">
                                <div class="col-12">
                                    <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                                        <li class="nav-item">
                                            <a class="nav-link text-dark" data-bs-toggle="pill" href="#tab-1">basic info</a>
                                        </li>
                                        <li class="nav-item">
                                            <a class="nav-link text-dark" data-bs-toggle="pill" href="#tab-2">orderdetails</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div id="tab-1" class="tab-pane fade show p-0 active">


                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Full Name</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <%Response.Write(Session["Name"]); %>
                                                </div>
                                            </div>
                                            <hr />

                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Email Id</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <%Response.Write(Session["Email"]); %>
                                                </div>
                                            </div>
                                            <hr />


                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">Address</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <%Response.Write(Session["Address"]); %>
                                                </div>
                                            </div>
                                            <hr />
                                            <div class="row">
                                                <div class="col-sm-3 col-md-2 col-5">
                                                    <label style="font-weight: bold;">phone</label>
                                                </div>
                                                <div class="col-md-8 col-6">
                                                    <%Response.Write(Session["Phone"]); %>
                                                </div>
                                            </div>
                                            <hr />

                                        </div>



                                        <div id="tab-2" class="tab-pane fade show p-0 active">
                                            <asp:Repeater ID="Repeater1" runat="server" OnItemDataBound="Repeater1_ItemDataBound">
                                                <ItemTemplate>
                                                    <div class="row pt-1 pb-1" style="background-color: lightgray">
                                                        <div class="col-4">
                                                            <span class="bg bg-fill bg-dark text-white">
                                                                <%#Eval("srno") %>
                                                            </span>
                                                            payment mode:<%# Eval("paymentmode").ToString()=="card"?"card payment":Eval("paymenymode").ToString().ToUpper() %>
                                                        </div>
                                                        <div class="col-6">
                                                            <%# string.IsNullOrEmpty (Eval("cardno").ToString())? "":"cardno:"+Eval("cardno")%>
                                                        </div>
                                                        <div class="col-2">
                                                            <a href="#"><i class="bi bi-download mr-2"></i>Invoice</a>
                                                        </div>
                                                        <asp:HiddenField ID="hdpaymentid" runat="server" Value='<%#Eval("paymentid").ToString() %>' />
                                                        <asp:Repeater ID="rorder" runat="server">
                                                            <HeaderTemplate>
                                                                <table class="table table-responsive table-hover">

                                                                    <thead>
                                                                        <tr>
                                                                            <th>orderno</th>
                                                                            <th>name</th>
                                                                            <th>unit price</th>
                                                                            <th>qty</th>
                                                                            <th>total price</th>
                                                                            <th>status</th>

                                                                        </tr>
                                                                    </thead>
                                                                    <tbody>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>


                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="lbl1" runat="server" Text='<%#Eval("orderno") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lbl2" runat="server" Text='<%#Eval("name") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lbl3" runat="server" Text='<%#Eval("cost") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lbl4" runat="server" Text='<%#Eval("quantity") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lbl5" runat="server" Text='<%#Eval("totalprice") %>'></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="lbl6" runat="server" Text='<%#Eval("status") %>' CssClass='<%#Eval("status")%>'></asp:Label>
                                                                    </td>
                                                                </tr>

                                                            </ItemTemplate>
                                                            <FooterTemplate>
                                                                </tbody>
                                                       </table>
                                                            </FooterTemplate>
                                                        </asp:Repeater>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>

                                        </div>
                                    </div>
                                </div>


                            </div>
                            <div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>

    </section>
</body>
</html>
