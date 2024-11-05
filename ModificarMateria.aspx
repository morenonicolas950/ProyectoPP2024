<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="ModificarMateria.aspx.cs" Inherits="ProyectoPP2024.ModificarMateria" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="container d-flex align-items-center ml-5">
    <div class="p-4" style="width:auto;">
        <h3 class="text-center">Modificar Materia</h3>
                <div class="form-group mb-5">
                    <label for="txtMateria">Materia</label>
                    <asp:TextBox ID="txtMateria" runat="server" CssClass="form-control bg-light"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvMateria" runat="server" ControlToValidate="txtMateria"
                        ErrorMessage="El nombre de la materia es obligatorio" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>
                <div class="d-flex justify-content-center">
                    <asp:Button ID="btnModificarMateria" runat="server" Text="Modificar" 
                        CssClass="btn btn-primary w-100" onclick="btnModificarMateria_Click"/>
                </div>
                <div class="mt-3 text-center">
                    <asp:Label ID="lblMensaje" runat="server" CssClass="text-success"></asp:Label>
                </div>
    </div>
</div>
  <div class="d-flex justify-content-end" >
    <asp:Button ID="Btn_Volver" CssClass="btn-light w-5 h-10" runat="server" Text="Volver" onclick="Btn_Volver_Click" CausesValidation="false" />
    </div>
</asp:Content>
