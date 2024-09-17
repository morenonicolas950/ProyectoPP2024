<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nuevoprofesor.aspx.cs" Inherits="ProyectoPP2024.nuevoprofesor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Nuevo Profesor</title>
    <style type="text/css">
        .style1
        {
            width: 111px;
        }
        .style2
        {
            width: 177px;
        }
        #Select1
        {
            width: 243px;
        }
        .btn-success
        {}
    </style>
</head>
<body>
    <h1> NUEVO PROFESOR</h1>
    <form id="form1" runat="server">
    <div>
        <table style="height: 398px; width: 542px">
            <tr>
                <td class="style2"
>
                    <asp:Label Text="Nombre" ID="lblNombreProfesor" runat="server" />
                </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="txtNombreProfesor" runat="server" 
                        placeholder="ej. Juan " Height="30px" Width="241px" />
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="rfvNombreProfesor" ControlToValidate="txtNombreProfesor" runat="server" ErrorMessage="Debe ingresar un nombre" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2"
>
                    <asp:Label Text="Apellido" ID="lblApellido" runat="server" />
                </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="txtApellidoProfesor" runat="server" placeholder="ej.Gomez" Height="30px" Width="241px" />
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="rfvApellidoProfesor" ControlToValidate="txtApellidoProfesor" runat="server" ErrorMessage="Debe ingresar un apellido" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label Text="Email" ID="lblEmailProfesor" runat="server" />
                </td>
                <td style= height="30px" width="241px">
                    <asp:TextBox CssClass="form-control" ID="txtEmailProfesor" runat="server" Height="30px" Width="241px" />
                </td>
                 <td class="style1">
                    <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmailProfesor" type="email" runat="server" ErrorMessage="Debe ingresar un email" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style2">
                    <asp:Label Text="Telefono" ID="LblTelefono" runat="server" />
                </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="txtTelefono" runat="server" Height="30px" Width="241px"/>
                </td>
                 <td class="style1">
                    <asp:RequiredFieldValidator ErrorMessage="Debe ingresar un telefono de contacto" ID="RfvTelefono" ControlToValidate="txtTelefono" type="number" runat="server" Text="*" ForeColor="Red"/>
                </td>
            </tr>
             <tr>
                <td style="width: 126px"
>
                    <asp:Label Text="Localidad" ID="lblLocalidad" runat="server" />
                </td>
                <td>
                    &nbsp;<asp:DropDownList ID="ComboboxLocalidad" runat="server" DataSourceID="SqlDataSource1" 
                        DataTextField="DESCRIPCION" DataValueField="ID_LOCALIDAD" Width="250px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:PRACTICAPROFESIONALConnectionString1 %>" 
                        SelectCommand="SELECT * FROM [LOCALIDAD]"></asp:SqlDataSource>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="RfvComboboxLocalidad" ControlToValidate="ComboboxLocalidad" runat="server" ErrorMessage="Debe seleccionar una localidad" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblTexto" Font-Bold="true" ForeColor="red" Text="" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button Text="Cargar" CssClass="btn btn-success" ID="btnCargar" 
            runat="server" OnClick="btnCargar_Click" Width="81px" />
        <asp:ValidationSummary ID="VSCarga" runat="server" ForeColor="Red" />
    </div>

    </form>
</body>
</html>
