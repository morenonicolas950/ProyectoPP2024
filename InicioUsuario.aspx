﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario.Master" AutoEventWireup="true" CodeBehind="InicioUsuario.aspx.cs" Inherits="ProyectoPP2024.InicioUsuario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta http-equiv="x-ua-compatible" content="ie=edge" />
    <title>Material Design for Bootstrap</title>
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.11.2/css/all.css" />
    <!-- Google Fonts Roboto -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" />
    <!-- MDB -->
    <link rel="stylesheet" href="Estilos/Usuario/css/mdb.min.css" />
    <!-- Custom styles -->
    <link rel="stylesheet" href="Estilos/Usuario/css/style.css" />
</head>
<body>
    <!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top bg-light navbar-light">
  <div class="container">
    <a class="navbar-brand" href="#"
      ><img
        id="MDB-logo"
        src="https://mdbcdn.b-cdn.net/wp-content/uploads/2018/06/logo-mdb-jquery-small.png"
        alt="MDB Logo"
        draggable="false"
        height="30"
    /></a>
    <button
      class="navbar-toggler"
      type="button"
      data-mdb-toggle="collapse"
      data-mdb-target="#navbarSupportedContent"
      aria-controls="navbarSupportedContent"
      aria-expanded="false"
      aria-label="Toggle navigation"
    >
      <i class="fas fa-bars"></i>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ms-auto align-items-center">
        <li class="nav-item">
          <a class="nav-link mx-2" href="#!"><i class="fas fa-plus-circle pe-2"></i>Post</a>
        </li>
        <li class="nav-item">
          <a class="nav-link mx-2" href="#!"><i class="fas fa-bell pe-2"></i>Alerts</a>
        </li>
        <li class="nav-item">
          <a class="nav-link mx-2" href="#!"><i class="fas fa-heart pe-2"></i>Trips</a>
        </li>
        <li class="nav-item ms-3">
          <a class="btn btn-black btn-rounded" href="#!">Sign in</a>
        </li>
      </ul>
    </div>
  </div>
</nav>
<!-- Navbar -->
    <!-- MDB -->
    <script type="text/javascript" src="Estilos/Usuario/js/mdb.min.js"></script>
    <!-- Custom scripts -->
    <script type="text/javascript" src="Estilos/Usuario/js/script.js"></script>
</body>
</html>


</asp:Content>
