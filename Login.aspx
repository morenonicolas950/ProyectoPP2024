<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ProyectoPP2024.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="es-ar">
  <head>
  	<title>Ingresar</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="Estilos/login/css/Login.css">

	</head>
	<body class="vh-100" style="background-color: #CCD5AE">
    <div class="align-content-center ">
        
            <h1 class="text-center mt-5" style="background-color: #FAEDCE" > Panel de administración </h1> 
    </div>
	<section class="ftco-section mt-0">
		<div class="container">
			<div class="row justify-content-center">
			</div>
			<div class="row justify-content-center">
				<div class="col-md-7 col-lg-5">
					<div class="wrap">
						<div class="img" style="background-image: url(Estilos/login/images/portada.png);"></div>
						<div class="login-wrap p-4 p-md-5"  style="background-color:#E0E5B6" >
							<form id="Form1" action="#" class="signin-form" runat="server">
			      		<div class="form-group" >
			      			
                            <asp:TextBox ID="txtUsuario" CssClass="form-control" runat="server"></asp:TextBox>
                           
			      			<label class="form-control-placeholder" style="color: Black" for="username">Usuario</label>
                             <asp:RequiredFieldValidator ID="rfvUsuario" runat="server" ControlToValidate="txtUsuario" ErrorMessage="El campo USUARIO es obligatorio" ForeColor="Red">
                            </asp:RequiredFieldValidator>
			      		</div>
		            <div class="form-group">
		              
                      <asp:TextBox ID="txtPassword" TextMode="Password" CssClass="form-control" runat="server"></asp:TextBox>
		              <label class="form-control-placeholder" style="color: Black"  for="txtpassword">Contraseña</label>
                      <asp:RequiredFieldValidator ID="rfvPassword" runat="server" ControlToValidate="txtpassword" ErrorMessage="El campo CONTRASEÑA es obligatorio" ForeColor="Red">
                            </asp:RequiredFieldValidator>
		              <span toggle="#txtpassword" class="fa fa-fw fa-eye field-icon toggle-password"></span>
		            </div>
		            <div class="form-group">
                        <asp:Button ID="btnLogin" runat="server" Text="Ingresar" 
                            onclick="btnLogin_Click" 
                            class="form-control btn-primary rounded submit px-3" ForeColor="Black" 
                            BackColor="#FAEDCE"></asp:Button>
		            </div>
		            <div class="form-group d-md-flex flex-column">
		            	<div class="w-50 text-left">
                            <asp:Label ID="lblMensaje" runat="server" Text=""></asp:Label>
			        </div>
                    <div class="d-flex justify-content-center">
                        <a href="InicioUsuario.aspx" runat="server" class="text-center" style="color:black" > Volver a la página inicial </a>
                    </div>
		            </div>
		          </form>
		        </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script  src="Estilos/login/js/jquery.min.js"></script>
  <script  src="Estilos/login/js/popper.js"></script>
  <script  src="Estilos/login/js/bootstrap.min.js"></script>
  <script src="Estilos/login/js/main.js"></script>

	</body>
</html>

