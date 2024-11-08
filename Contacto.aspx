<%@ Page Title="" Language="C#" MasterPageFile="~/Usuario.Master" AutoEventWireup="true" CodeBehind="Contacto.aspx.cs" Inherits="ProyectoPP2024.Contacto" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <table class= "table">
            <tr>
                <td>
                    <asp:Label runat="server" Text="Nombre: "></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblNombre" runat="server" ></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Apellido: " runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblApellido" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Email: " runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblEmail" runat="server"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label Text="Telefono: " runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label  ID="lblTelefono" runat="server"></asp:Label>
                </td>
            </tr>
    </table>
    
    <div class="d-flex ml-4 mt-5 flex-column border-dark mb-4">
        <asp:Button ID="btnVolver2" runat="server" Text="Volver" OnClick="btnVolver_Click"
            CssClass="btn-outline-secondary" />
    </div>



</asp:Content>
