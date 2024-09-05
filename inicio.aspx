<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="inicio.aspx.cs" Inherits="ProyectoPP2024.inicio" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Id_Usuario" DataSourceID="SqlDataSource1" Width="932px">
        <Columns>
            <asp:BoundField DataField="Id_Usuario" HeaderText="Id_Usuario" 
                InsertVisible="False" ReadOnly="True" SortExpression="Id_Usuario" />
            <asp:BoundField DataField="NombreUsuario" HeaderText="NombreUsuario" 
                SortExpression="NombreUsuario" />
            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="Contrasena" HeaderText="Contrasena" 
                SortExpression="Contrasena" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString %>" 
        SelectCommand="SELECT * FROM [USUARIOS]"></asp:SqlDataSource>
 
</asp:Content>
