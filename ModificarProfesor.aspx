<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ModificarProfesor.aspx.cs" Inherits="ProyectoPP2024.ModificarProfesor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <div class="container d-flex align-items-center ml-5">
        <div class="p-4" style="width:auto;">

            <h3 class="text-center">Modificar Profesor</h3>
                <div class="form-group mb-3">
                    <label for="txtNombre">Nombre</label>
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control bg-light"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvNombre" runat="server" ControlToValidate="txtNombre"
                        ErrorMessage="El nombre es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group mb-3">
                    <label for="txtApellido">Apellido</label>
                    <asp:TextBox ID="txtApellido" runat="server" CssClass="form-control" BorderColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvApellido" runat="server" ControlToValidate="txtApellido"
                        ErrorMessage="El apellido es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group mb-3">
                    <label for="txtEmail">Email</label>
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" BorderColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                        ErrorMessage="El email es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group mb-3">
                    <label for="txtTelefono">Teléfono</label>
                    <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" BorderColor="Black"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono"
                        ErrorMessage="El teléfono es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="form-group mb-4">
                    <label for="ddlLocalidad">Localidad</label>
                    <asp:DropDownList ID="ddlLocalidad" runat="server" CssClass="form-select" 
                        DataSourceID="SqlDataSource1" DataTextField="DESCRIPCION" 
                        DataValueField="ID_LOCALIDAD"></asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                        SelectCommand="SELECT * FROM [LOCALIDAD]"></asp:SqlDataSource>
                    <asp:RequiredFieldValidator ID="rfvLocalidad" runat="server" ControlToValidate="ddlLocalidad"
                        ErrorMessage="La localidad es obligatoria" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>

                <div class="d-flex justify-content-center">
                    <asp:Button ID="btnModificarProfesor" runat="server" Text="Modificar" CssClass="btn btn-primary w-100" OnClick="btnModificarProfesor_Click" />
                </div>

                <div class="mt-3 text-center">
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-success"></asp:Label>
                </div>
        </div>
    </div>
    <div class="d-flex justify-content-end">
    <asp:Button ID="Btn_Volver" CssClass="btn-light"a runat="server" Text="Volver" onclick="Btn_Volver_Click" CausesValidation="false" />
    </div>
</asp:Content>
