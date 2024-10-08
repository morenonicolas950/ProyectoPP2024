<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="ProyectoPP2024.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  <header>
  </header> 
   <main>
           <div class= "d-flex ml-4 mt-5 vw-100" >
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Id_Usuario" DataSourceID="SqlDataSource1" 
                EmptyDataText="No hay registros de datos para mostrar." Width="767px" CssClass="table table-bordered text-center"  >
                <Columns>
                    <asp:BoundField DataField="Id_Usuario" HeaderText="Id_Usuario" ReadOnly="True" 
                        SortExpression="Id_Usuario" />
                    <asp:BoundField DataField="NombreUsuario" HeaderText="NombreUsuario" 
                        SortExpression="NombreUsuario" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Contrasena" HeaderText="Contrasena" 
                        SortExpression="Contrasena" />
                         <asp:TemplateField HeaderText="">
                    <ItemTemplate>
                        <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Eliminar" CssClass="btn btn-danger btn-sm" OnClientClick="return confirm('¿Está seguro de que desea eliminar este registro?');" />
                    </ItemTemplate>
                </asp:TemplateField>
                </Columns>
                </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                DeleteCommand="DELETE FROM [USUARIOS] WHERE [Id_Usuario] = @Id_Usuario" 
                InsertCommand="INSERT INTO [USUARIOS] ([NombreUsuario], [Email], [Contrasena]) VALUES (@NombreUsuario, @Email, @Contrasena)" 
                ProviderName="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1.ProviderName %>" 
                SelectCommand="SELECT [Id_Usuario], [NombreUsuario], [Email], [Contrasena] FROM [USUARIOS]" 
                UpdateCommand="UPDATE [USUARIOS] SET [NombreUsuario] = @NombreUsuario, [Email] = @Email, [Contrasena] = @Contrasena WHERE [Id_Usuario] = @Id_Usuario">
                <DeleteParameters>
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="NombreUsuario" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Contrasena" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="NombreUsuario" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="Contrasena" Type="Int32" />
                    <asp:Parameter Name="Id_Usuario" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </div>
    </main>
    <footer>
    </footer>
</asp:Content>
