<%@ Page Title="Resultados de la búsqueda" Language="C#" MasterPageFile="~/Usuario.Master" AutoEventWireup="true" CodeBehind="Resultados.aspx.cs" Inherits="ProyectoPP2024.Resultados" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <!-- RESULTADOS MATERIAS -->
        <div style="display: flex; justify-content: center; align-items: center; min-height: 100vh;">
        <asp:GridView ID="GridViewResultados" runat="server" AutoGenerateColumns="False" 
                CellPadding="10" CellSpacing="5" 
            DataSourceID="SqlDataSource1" 
                onselectedindexchanged="GridViewResultados_SelectedIndexChanged">
          
          <Columns>
                    <asp:BoundField DataField="ID_PROFESOR" HeaderText="ID_PROFESOR"
                        SortExpression="ID_PROFESOR" Visible="false" />
                    <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" SortExpression="NOMBRE"/>
                    <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" SortExpression="APELLIDO" />
                    <asp:BoundField DataField="ID_MATERIA" HeaderText="ID_MATERIA" SortExpression="ID_MATERIA" Visible="false" />
                    <asp:BoundField DataField="MATERIA" HeaderText="MATERIA" SortExpression="MATERIA" />
                    <asp:BoundField DataField="ID_LOCALIDAD" HeaderText="ID_LOCALIDAD" SortExpression="ID_LOCALIDAD" Visible="false"/>
                    <asp:BoundField DataField="LOCALIDAD" HeaderText="LOCALIDAD" SortExpression="LOCALIDAD" />
         
                   
               <asp:TemplateField HeaderText="CONTACTO">
                    <ItemTemplate>
                        <asp:ImageButton ID="btnContacto" runat="server" CssClass="btn btn-warning" CommandName="Contacto" CommandArgument='<%# Container.DataItemIndex.ToString() %>' ImageUrl='~/Estilos/Imagenes/Ojo_para_ocultar.jpg' Width="80px" Height="50px"></asp:ImageButton>
                        
                    </ItemTemplate>
                </asp:TemplateField>

                </Columns>
                
                
        </asp:GridView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
            SelectCommand="SELECT * FROM [vw_FILTRO]"></asp:SqlDataSource>

       <!--<asp:SqlDataSource ID="SqlDataSourceResultados" runat="server" 
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
