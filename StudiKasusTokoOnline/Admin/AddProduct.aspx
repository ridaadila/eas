<%@ Page Title="Add Product" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddProduct.aspx.cs" Inherits="StudiKasusTokoOnline.Admin.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="container">
            <h3>Add Product</h3><br />
            <asp:Literal ID="ltMessage" runat="server" />
            <br />
            <div class="form-group">
                <label for="txtTitle">Title</label>
                <asp:TextBox runat="server" ID="txtTitle" CssClass="form-control" placeholder="Title" />
            </div>
            <div class="form-group">
                <label for="ddCategory">Category</label>
                <asp:DropDownList runat="server" ID="ddCategory" ItemType="StudiKasusTokoOnline.Models.Category" Width="150" CssClass="form-control"
                    SelectMethod="ddCategory_GetItem" DataValueField="CategoryID" DataTextField="CategoryName">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtAuthor">Author</label>
                <asp:DropDownList runat="server" ID="ddAuthor" ItemType="StudiKasusTokoOnline.Models.Author" Width="150" CssClass="form-control"
                    SelectMethod="ddAuthor_GetItem" DataValueField="AuthorID" DataTextField="FirstName">
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtIsbn">ISBN</label>
                <asp:TextBox runat="server" ID="txtIsbn" CssClass="form-control" placeholder="ISBN" />
            </div>
            <div class="form-group">
                <label for="txtPrice">Price</label>
                <asp:TextBox runat="server" ID="txtPrice" TextMode="Number" Width="100" CssClass="form-control" placeholder="Price" />
            </div>

            <div class="form-group">
                <label for="txtPublisher">Publisher</label>
                <asp:TextBox runat="server" ID="txtPublisher" CssClass="form-control" placeholder="Publisher" />
            </div>
            <div class="form-group">
                <label for="txtDate">Publication Date</label>
                <asp:TextBox runat="server" ID="txtDate" TextMode="Date" CssClass="form-control" placeholder="Publication Date" />
            </div>
            <div class="form-group">
                <label for="fpCover">Cover Image</label>
                <asp:FileUpload runat="server" ID="fpCover" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="fpThumbs">Cover Thumbs</label>
                <asp:FileUpload runat="server" ID="fpThumbs" CssClass="form-control" />
            </div>
            <div class="form-group">
                <label for="txtDescription">Description</label>
                <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" TextMode="MultiLine" Width="400" placeholder="Description" />
            </div>
            <asp:Button Text="Submit" ID="btnSubmit" CssClass="btn btn-success" runat="server" OnClick="btnSubmit_Click" />
        </div>
    </div>
</asp:Content>
