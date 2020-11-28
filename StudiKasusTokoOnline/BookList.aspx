<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookList.aspx.cs" Inherits="StudiKasusTokoOnline.BookList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="row">
            <br /><br /> 
            <asp:ListView runat="server" ID="lvBook" ItemType="StudiKasusTokoOnline.Models.Book"
                SelectMethod="lvBook_GetData">

                <ItemTemplate>
                    <div class="col-md-6" style="height:200px;">
                        <div class="col-md-4">
                            <img src="<%# ResolveUrl(string.Format("~/Catalog/Images/Thumbs/{0}",Item.CoverImage)) %>" alt="book cover" />
                        </div>
                        <div class="col-md-8">
                            <h4><a href="<%# GetRouteUrl("BookDetail", new {id = Item.BookID}) %>"><%# Item.Title %></a></h4>
                            <strong>ISBN :</strong><%# Item.ISBN %><br />
                            <strong>Author :</strong> <%# Item.Author.FirstName %>&nbsp;
                            <%# Item.Author.LastName %><br />
                            <strong>Publisher :</strong><%# Item.Publisher %> (<%# Convert.ToDateTime(Item.PublicationDate).Year %>)<br />
                            <strong>Price :</strong> Rp.<%# string.Format("{0:N0}",Item.Price) %><br />
                            <a href="<%# GetRouteUrl("AddToCart", new { id=Item.BookID }) %>" class="btn btn-success btn-xs">Add To Cart</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:ListView>
        </div>
    </div>
</asp:Content>
