<%@ Page Title="Resultados de la búsqueda" Language="C#" MasterPageFile="~/Usuario.Master" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="ProyectoPP2024.Resultados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- RESULTADOS MATERIAS -->
        <asp:GridView ID="GridViewResultados" runat="server" AutoGenerateColumns="True"
            DataSourceID="SqlDataSourceResultados">
           
        </asp:GridView>

       <!--  <asp:SqlDataSource ID="SqlDataSourceResultados" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
            SelectCommand="SELECT [DESCRIPCION] FROM [MATERIA]" 
            FilterExpression="">
        </asp:SqlDataSource> -->

        <!-- RESULTADOS LOCALIDAD -->
         <!--<asp:GridView ID="GridViewResultados2" runat="server" AutoGenerateColumns="True"
            DataSourceID="SqlDataSourceResultados2">
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSourceResultados2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
            SelectCommand="SELECT [DESCRIPCION] FROM [LOCALIDAD]" 
            FilterExpression="">
        </asp:SqlDataSource> -->

        <div class= "d-flex ml-4 mt-5 flex-column border-dark mb-4">
        <asp:Button ID="btnVolver" runat="server" Text="Volver" onclick="btnVolver_Click" CssClass="btn-outline-info"/>
        </div>

</asp:Content>
