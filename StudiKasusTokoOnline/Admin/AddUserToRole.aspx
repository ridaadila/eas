<%@ Page Title="Add User To Role" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddUserToRole.aspx.cs" Inherits="StudiKasusTokoOnline.Admin.AddUserToRole" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="container">
            <div class="form-horizontal">
                <p class="text-success">
                    <asp:Literal ID="SuccessText" runat="server" />
                </p>
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ddRole" CssClass="col-md-2 control-label">Role Name :</asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList runat="server" ID="ddRole" 
                            ItemType="Microsoft.AspNet.Identity.EntityFramework.IdentityRole" SelectMethod="ddRole_GetData" 
                            DataTextField="Name" DataValueField="Name">
                        </asp:DropDownList>
                    </div>
                </div>
                 <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ddUser" CssClass="col-md-2 control-label">Email of User :</asp:Label>
                    <div class="col-md-10">
                        <asp:DropDownList runat="server" ID="ddUser" 
                            ItemType="Microsoft.AspNet.Identity.EntityFramework.IdentityUser" SelectMethod="ddUser_GetData" 
                             DataTextField="Username" DataValueField="Id">
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-offset-2 col-md-10">
                        <asp:Button runat="server" ID="btnAddUserToRole" Text="Submit" CssClass="btn btn-default" OnClick="btnAddUserToRole_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>