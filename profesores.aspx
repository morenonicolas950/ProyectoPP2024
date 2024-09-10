<%@ Page Title="" Language="C#" MasterPageFile="~/Principal.Master" AutoEventWireup="true" CodeBehind="profesores.aspx.cs" Inherits="ProyectoPP2024.profesores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="ID_PROFESOR" DataSourceID="SqlDataSource1" 
        EmptyDataText="No hay registros de datos para mostrar." Width="762px">
        <Columns>
            <asp:BoundField DataField="ID_PROFESOR" HeaderText="ID_PROFESOR" 
                ReadOnly="True" SortExpression="ID_PROFESOR" />
            <asp:BoundField DataField="NOMBRE" HeaderText="NOMBRE" 
                SortExpression="NOMBRE" />
            <asp:BoundField DataField="APELLIDO" HeaderText="APELLIDO" 
                SortExpression="APELLIDO" />
            <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
            <asp:BoundField DataField="TELEFONO" HeaderText="TELEFONO" 
                SortExpression="TELEFONO" />
            <asp:BoundField DataField="ID_LOCALIDAD" HeaderText="ID_LOCALIDAD" 
                SortExpression="ID_LOCALIDAD" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
        DeleteCommand="DELETE FROM [PROFESOR] WHERE [ID_PROFESOR] = @ID_PROFESOR" 
        InsertCommand="INSERT INTO [PROFESOR] ([NOMBRE], [APELLIDO], [EMAIL], [TELEFONO], [ID_LOCALIDAD]) VALUES (@NOMBRE, @APELLIDO, @EMAIL, @TELEFONO, @ID_LOCALIDAD)" 
        ProviderName="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1.ProviderName %>" 
        SelectCommand="SELECT [ID_PROFESOR], [NOMBRE], [APELLIDO], [EMAIL], [TELEFONO], [ID_LOCALIDAD] FROM [PROFESOR]" 
        UpdateCommand="UPDATE [PROFESOR] SET [NOMBRE] = @NOMBRE, [APELLIDO] = @APELLIDO, [EMAIL] = @EMAIL, [TELEFONO] = @TELEFONO, [ID_LOCALIDAD] = @ID_LOCALIDAD WHERE [ID_PROFESOR] = @ID_PROFESOR">
        <DeleteParameters>
            <asp:Parameter Name="ID_PROFESOR" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NOMBRE" Type="String" />
            <asp:Parameter Name="APELLIDO" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="TELEFONO" Type="Int32" />
            <asp:Parameter Name="ID_LOCALIDAD" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NOMBRE" Type="String" />
            <asp:Parameter Name="APELLIDO" Type="String" />
            <asp:Parameter Name="EMAIL" Type="String" />
            <asp:Parameter Name="TELEFONO" Type="Int32" />
            <asp:Parameter Name="ID_LOCALIDAD" Type="Int32" />
            <asp:Parameter Name="ID_PROFESOR" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <br />


</asp:Content>
