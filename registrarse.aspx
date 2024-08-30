<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrarse.aspx.cs" Inherits="ProyectoPP2024.registrarse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registrarse</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table style="height: 398px; width: 542px">
            <tr>
                <td style="width: 126px"
>
                    <asp:Label Text="Nombre de Usuario" ID="lblUsuario" runat="server" />
                </td>
                <td>
                    <asp:TextBox CssClass="form-control" ID="txtUsuario" runat="server" 
                        placeholder="ej. Juan123" Height="30px" Width="241px" />
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ID="rfvUsuario" ControlToValidate="txtUsuario" runat="server" ErrorMessage="Debe ingresar un usuario" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style= height="30px" width="241px">
                    <asp:Label Text="Email" ID="lblEmail" runat="server" />
                </td>
                <td style= height="30px" width="241px">
                    <asp:TextBox CssClass="form-control" ID="txtEmail" runat="server" Height="30px" 
                        Width="241px" />
                </td>
                 <td class="style1">
                    <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail" type="email" runat="server" ErrorMessage="Debe ingresar un email" Text="*" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style= Height="30px" Width="241px">
                    <asp:Label Text="Contraseña" ID="lblContraseña" runat="server" />
                </td>
                <td>
                    <asp:TextBox TextMode="Password" CssClass="form-control" ID="txtPass" 
                        runat="server" Height="30px" Width="241px" />
                </td>
                <td class="style1">
                    <asp:RequiredFieldValidator ErrorMessage="Debe ingresar contraseña" ID="RfvContraseña" ControlToValidate="txtPass" runat="server" Text="*" ForeColor="Red" />
                </td>
            </tr>
            <tr>
                <td style="width: 126px">
                    <asp:Label Text=" Repetir Contraseña" ID="LblRepContraseña" runat="server" />
                </td>
                <td>
                    <asp:TextBox TextMode="Password" CssClass="form-control" ID="txtRepPass" 
                        runat="server" Height="30px" Width="241px"/>
                </td>
                 <td class="style1">
                    <asp:RequiredFieldValidator ErrorMessage="Debe repetir contraseña" ID="RfvRepContraseña" ControlToValidate="txtRepPass" runat="server" Text="*" ForeColor="Red"/>
                    <asp:CompareValidator ID="CvContraseñas" runat="server" ErrorMessage="Las contraseñas deben ser iguales" ControlToValidate="txtPass" ControlToCompare="txtRepPass" Text="*" ForeColor="Red"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblTexto" Font-Bold="true" ForeColor="red" Text="" runat="server" />
                </td>
            </tr>
        </table>
        <br />
        <asp:Button Text="Registrar" CssClass="btn btn-success" ID="btnRegistrar" runat="server" OnClick="btnRegistrar_Click" />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
    </div>
    <p>
        <asp:Button ID="btnVolver" runat="server" Text="Volver" onclick="btnVolver_Click" />
    </p>
    </form>
</body>
</html>
