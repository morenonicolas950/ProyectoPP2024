<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="AsignarMateriaProfesor.aspx.cs" Inherits="ProyectoPP2024.AsignarMateriaProfesor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container d-flex flex-column align-items-center ml-5">
    <div class="p-4" style="width:auto;">
        <h3 class="text-center"> Asignar Materia a Profesor </h3>
        
                    <!-- Seleccionar profesor-->
                     <div class="form-group">
                        <label for="ddlProfesor">Profesor</label>
                        <asp:DropDownList ID="DdlProfesores" runat="server" CssClass="form-control" 
                            DataSourceID="SqlDataSource2" DataTextField="APELLIDO" 
                            DataValueField="ID_PROFESOR"></asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                            
                             SelectCommand="SELECT ID_PROFESOR, NOMBRE, APELLIDO, EMAIL, TELEFONO, ID_LOCALIDAD FROM PROFESOR WHERE (NOMBRE &lt;&gt; '')"></asp:SqlDataSource>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlMateria" InitialValue="" ErrorMessage="Debe seleccionar una materia" CssClass="text-danger"></asp:RequiredFieldValidator>
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
                        <asp:TextBox ID="txtPrecio" runat="server" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPrecio" runat="server" ControlToValidate="txtPrecio" ErrorMessage="El precio es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                     <!-- Botón para registrar la materia al profesor -->
                    <div class="form-group text-center">
                        <asp:Button ID="btnAsignar" runat="server" CssClass="btn btn-primary" Text="Asignar Materia" OnClick="btnAsignar_Click" />
                    </div>

                    <!-- Mensaje de resultado -->
                    <div class="form-group text-center">
                        <asp:Label ID="lblMensaje" runat="server" CssClass="text-danger"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>
