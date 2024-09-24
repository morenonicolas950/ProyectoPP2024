<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nuevoprofesor.aspx.cs" Inherits="ProyectoPP2024.nuevoprofesor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nuevo Profesor</title>
    <style type="text/css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"/>
        #Select1
        {
            width: 243px;
        }
        .btn-success
        {}
    </style>
</head>
<body>
    <h1> NUEVO PROFESOR</h1>
    <form id="form1" runat="server">
   <div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
                    <h4 class="text-center mb-4">Registrar Profesor</h4>

                    <!-- Nombre -->
                    <div class="form-group">
                        <label for="txtNombre">Nombre</label>
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre" ErrorMessage="El nombre es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Apellido -->
                    <div class="form-group">
                        <label for="txtApellido">Apellido</label>
                        <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido" ErrorMessage="El apellido es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Email -->
                    <div class="form-group">
                        <label for="txtEmail">Correo Electrónico</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" ErrorMessage="El correo es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Teléfono -->
                    <div class="form-group">
                        <label for="txtTelefono">Teléfono</label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono" ErrorMessage="El teléfono es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Localidad -->
                    <div class="form-group">
                        <label for="ddlLocalidad">Localidad</label>
                        <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="form-control" 
                            DataSourceID="SqlDataSource2" DataTextField="DESCRIPCION" 
                            DataValueField="ID_LOCALIDAD">  </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                            SelectCommand="SELECT * FROM [LOCALIDAD]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad" InitialValue="" ErrorMessage="Debe seleccionar una localidad" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Materia -->
                    <div class="form-group">
                        <label for="ddlMateria">Materia</label>
                        <asp:DropDownList ID="ddlMateria" runat="server" CssClass="form-control" 
                            DataSourceID="SqlDataSource1" DataTextField="DESCRIPCION" 
                            DataValueField="ID_MATERIA"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                            SelectCommand="SELECT * FROM [MATERIA]"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="rfvMateria" runat="server" ControlToValidate="ddlMateria" InitialValue="" ErrorMessage="Debe seleccionar una materia" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Precio -->
                    <div class="form-group">
                        <label for="txtPrecio">Precio por Hora</label>
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control" Placeholder="Precio" type="number"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio" ErrorMessage="El precio es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>

                    <!-- Botón para registrar el profesor -->
                    <div class="form-group text-center">
                        <asp:Button ID="btnRegistrarProfesor" runat="server" CssClass="btn btn-primary" Text="Registrar Profesor" OnClick="btnRegistrarProfesor_Click" />
                    </div>

                    <!-- Mensaje de resultado -->
                    <div class="form-group text-center">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
    <asp:Button ID="Btn_Volver" runat="server" Text="Volver" onclick="Btn_Volver_Click" CausesValidation="false" />
    </form>
   
   
</body>
</html>
