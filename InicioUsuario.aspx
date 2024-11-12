<%@ Page Title="Inicio" Language="C#" MasterPageFile="~/Usuario.Master" AutoEventWireup="true" CodeBehind="InicioUsuario.aspx.cs" Inherits="ProyectoPP2024.InicioUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  
   
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   

    <!-- Background image -->
    <div class="bg-image" style="background-image: url('https://images.vexels.com/media/users/3/144625/raw/61722030e99d83dbcc215a0633b6bf21-ilustraci-n-del-profesor-de-la-universidad-con-los-alumnos.jpg'); height: 400px;">
        <div class="mask d-flex justify-content-center align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.5);">
            
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="text-center text-white">
                    <h1 class="mb-3">Contactar al profesor que estás buscando</h1>
                    <div class="search-container">
        
                        
                        <form id="Form2" action="#" class="signin-form">
                            <div class="filter-options">
                                <label for="tipo">Buscar por materia</label>
                                <asp:DropDownList ID="tipo" runat="server" DataSourceID="SqlDataSource1" 
                                    DataTextField="DESCRIPCION" DataValueField="ID_MATERIA" 
                                    ondatabound="tipo_DataBound" >
                                    <asp:ListItem Value="0">TODOS</asp:ListItem>

                                </asp:DropDownList>
    
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                                    SelectCommand="SELECT * FROM [MATERIA]"></asp:SqlDataSource>
    
                                <label for="zona">Localidad</label>
                                <asp:DropDownList ID="zona" runat="server" DataSourceID="SqlDataSource2" 
                                    DataTextField="DESCRIPCION" DataValueField="ID_LOCALIDAD" 
                                    ondatabound="zona_DataBound">
                                    <asp:ListItem Value="0">TODAS</asp:ListItem>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                                    SelectCommand="SELECT * FROM [LOCALIDAD]"></asp:SqlDataSource>
                            </div>
                                <div>
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" onclick="btnBuscar_Click"  CssClass="btn btn-outline-light btn-lg"></asp:Button>
                                    
                                </div>

                               <!-- <button type="submit">Buscar</button> -->
                            </div>
                        </form>
                    <!-- <a class="btn btn-outline-light btn-lg" href="#!" role="button">LLAMADA A LA ACCIÓN</a> -->
                </div>
            </div>
        </div>

    </div>
    
</asp:Content>
