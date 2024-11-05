<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="ProyectoPP2024.inicio" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container d-flex justify-content-between m-5 vh-100 vw-80">

        <div class="card text-white bg-primary h-25">
          <div class="card-header">Usuarios</div>
          <div class="card-body">
            <label id="lblUsuarios" class="d-flex justify-content-end">N</label>
          </div>
        </div>
        <div class="card text-white bg-secondary h-25" style="max-width:200px; max-height:200px;">
          <div class="card-header">Profesores</div>
          <div class="card-body">
            <label id="lblProfesores" class="d-flex justify-content-end">N</label>
          </div>
        </div>
        <div class="card text-white bg-success mb-3 h-25" style="max-width:200px;">
          <div class="card-header">Materias</div>
          <div class="card-body">
            <label id="lblMaterias" class="d-flex justify-content-end">N</label>
          </div>
  </div>
      </div>
</asp:Content>
