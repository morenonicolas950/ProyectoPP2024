<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario.Master" AutoEventWireup="true" CodeBehind="InicioUsuario.aspx.cs" Inherits="ProyectoPP2024.InicioUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <!-- Incluimos los estilos de MDB y personalización -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.css" />
    <link rel="stylesheet" href="Estilos/Usuario/css/style.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-mdb-toggle="collapse" data-mdb-target="#navbarExample01" aria-controls="navbarExample01" aria-expanded="false" aria-label="Toggle navigation">
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarExample01">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" href="inicio.aspx">Inicio</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Características</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Precios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Contacto</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- Navbar -->

    <!-- Background image -->
    <div class="bg-image" style="background-image: url('https://images.vexels.com/media/users/3/144625/raw/61722030e99d83dbcc215a0633b6bf21-ilustraci-n-del-profesor-de-la-universidad-con-los-alumnos.jpg'); height: 400px;">
        <div class="mask d-flex justify-content-center align-items-center h-100" style="background-color: rgba(0, 0, 0, 0.5);">
            
            <div class="d-flex justify-content-center align-items-center h-100">
                <div class="text-center text-white">
                    <h1 class="mb-3">Contactá al profesor que estás buscando</h1>
                    <div class="search-container">
        
                        
                        <form id="Form2" action="#" class="signin-form">
                            <div class="filter-options">
                                <label for="tipo">Buscar por materia</label>
                                <asp:DropDownList ID="tipo" runat="server">
                                    <asp:ListItem Value="todos">Todos</asp:ListItem>
                                    <asp:ListItem Value="matematica">Análisis Matemático</asp:ListItem>
                                    <asp:ListItem Value="programacion">Programación</asp:ListItem>
                                    <asp:ListItem Value="algebra">Álgebra</asp:ListItem>
                                    <asp:ListItem Value="bdatos">Base de Datos</asp:ListItem>
                                </asp:DropDownList>
    
                                <label for="zona">Zonas</label>
                                <asp:DropDownList ID="zona" runat="server">
                                    <asp:ListItem Value="todas">Todas</asp:ListItem>
                                    <asp:ListItem Value="norte">Zona Norte</asp:ListItem>
                                    <asp:ListItem Value="sur">Zona Sur</asp:ListItem>
                                    <asp:ListItem Value="oeste">Zona Oeste</asp:ListItem>
                                    <asp:ListItem Value="centro">Zona Centro</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                                <div>
                                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" onclick="btnBuscar_Click" class="btn btn-outline-light btn-lg"></asp:Button>
                                </div>

                               <!-- <button type="submit">Buscar</button> -->
                            </div>
                        </form>
                    <!-- <a class="btn btn-outline-light btn-lg" href="#!" role="button">LLAMADA A LA ACCIÓN</a> -->
                </div>
            </div>
        </div>

    </div>
    <!-- Background image -->

    <!-- MDB Scripts -->
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/mdb-ui-kit/3.10.2/mdb.min.js"></script>
    <script type="text/javascript" src="Estilos/Usuario/js/script.js"></script>
</asp:Content>
