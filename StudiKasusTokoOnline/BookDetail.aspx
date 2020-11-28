<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookDetail.aspx.cs" Inherits="StudiKasusTokoOnline.BookDetail" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="container">
            <asp:FormView runat="server" ID="fvBookDetail" ItemType="StudiKasusTokoOnline.Models.Book"
                SelectMethod="fvBookDetail_GetItem">
                <ItemTemplate>
                    <div class="col-md-4">
                        <img src="<%# ResolveUrl(string.Format("~/Catalog/Images/{0}",Item.CoverImage)) %>" alt="book cover" />
                    </div>
                    <div class="col-md-8">
                        <h3><%# Item.Title %></h3>
                        <strong>ISBN :</strong><%# Item.ISBN %><br />
                        <strong>Author :</strong> <%# Item.Author.FirstName %>&nbsp;
                            <%# Item.Author.LastName %><br />
                        <strong>Publisher :</strong><%# Item.Publisher %>(<%# Convert.ToDateTime(Item.PublicationDate).Year %>)<br />
                        <strong>Price :</strong> Rp.<%# string.Format("{0:N0}",Item.Price) %><br />
                        <br />
                        <p><%# Item.Description %></p>
                        <br />
                        <a href="<%# GetRouteUrl("AddToCart", new { id=Item.BookID }) %>" class="btn btn-success">Add To Cart</a>
                    </div>
                </ItemTemplate>
            </asp:FormView>
            <br />
            <hr />
            <asp:Literal ID="ltMessage" runat="server" />
            <asp:LoginView runat="server" ID="lvAddReview" ViewStateMode="Disabled">
                <AnonymousTemplate>
                    <p class="alert alert-warning">
                        Silahkan melakukan registrasi terlebih dahulu untuk menambahkan komentar.
                        <a href="~/Account/Register" runat="server">registrasi disini</a>
                    </p>
                </AnonymousTemplate>
                <LoggedInTemplate>
                    <h4>Add Review</h4>
                    <div class="form-horizontal">
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Rating :</span>
                            <div class="col-sm-8">
                                <cc1:Rating ID="myRating" runat="server" CssClass="ratingStar" StarCssClass="ratingItem" WaitingStarCssClass="SavedStar" EmptyStarCssClass="EmptyStar"
                                    FilledStarCssClass="FilledStar" MaxRating="5" CurrentRating="1">
                                </cc1:Rating>
                            </div>
                        </div>
                        <div class="form-group">
                            <span class="col-sm-2 control-label">Comment :</span>
                            <div class="col-sm-8">
                                <asp:TextBox runat="server" ID="txtComment" Width="450" Height="150" TextMode="MultiLine" />
                                <cc1:HtmlEditorExtender ID="heeComment" TargetControlID="txtComment" runat="server"></cc1:HtmlEditorExtender>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-10">
                                <asp:Button Text="Add Review" ID="btnReview" CssClass="btn btn-success" runat="server" OnClick="btnReview_Click" />
                            </div>
                        </div>
                    </div>
                    <hr />
                </LoggedInTemplate>
            </asp:LoginView>

            <div class="row">
                <asp:GridView runat="server" ID="gvReview" CssClass="table table-striped" AutoGenerateColumns="false" ItemType="StudiKasusTokoOnline.Models.Review"
                    SelectMethod="gvReview_GetData">
                    <Columns>
                        <asp:BoundField DataField="CustomerName" HeaderText="Customer" />
                        <asp:TemplateField HeaderText="Rating">
                            <ItemTemplate>
                                <cc1:Rating ID="ratingView" runat="server" CssClass="ratingStar" StarCssClass="ratingItem" WaitingStarCssClass="SavedStar" ReadOnly="true" EmptyStarCssClass="EmptyStar"
                                    FilledStarCssClass="FilledStar" MaxRating="5" CurrentRating='<%# Item.Rating %>'>
                                </cc1:Rating>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Comments">
                            <ItemTemplate>
                                <asp:Literal runat="server" ID="ltComment" Text='<%# Server.HtmlDecode(Item.Comments) %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
