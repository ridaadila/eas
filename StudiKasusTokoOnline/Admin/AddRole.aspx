<%@ Page Title="Add Role" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddRole.aspx.cs" Inherits="StudiKasusTokoOnline.Admin.AddRole" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="container">
            <h3>Add Role</h3><br />

            <div class="col-md-8">
            <div class="form-horizontal">
                <p class="text-success">
                    <asp:Literal ID="SuccessText" runat="server" />
                </p>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="txtRole" CssClass="col-md-4 control-label">Role Name :</asp:Label>
                    <div class="col-md-8">
                        <asp:TextBox runat="server" ID="txtRole" CssClass="form-control" />
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="txtRole"
                           CssClass="text-danger" ErrorMessage="The role field is required." />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-4 col-md-8">
                        <asp:Button runat="server" ID="btnAddRole" Text="Add Role" CssClass="btn btn-default" OnClick="btnAddRole_Click" />
                    </div>
                </div>
                <br /><br />
                 <asp:GridView runat="server" CssClass="table table-striped" ID="gvRole" ItemType="Microsoft.AspNet.Identity.EntityFramework.IdentityRole"
                    SelectMethod="gvRole_GetData" >
                </asp:GridView>
            </div>
        </div>

        </div>
    </div>
</asp:Content>
