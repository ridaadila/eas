<%@ Page Title="Shopping Cart" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCartPage.aspx.cs" Inherits="StudiKasusTokoOnline.ShoppingCartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="container">
            <h3>Shopping Cart</h3>
            <asp:UpdatePanel ID="upCart" runat="server">
                <ContentTemplate>
                     <asp:ValidationSummary runat="server" ShowModelStateErrors="true" /><br />
                    <asp:GridView runat="server" ID="gvCart" ItemType="StudiKasusTokoOnline.Models.ShoppingCart" DataKeyNames="RecordID"
                SelectMethod="gvCart_GetData" CssClass="table table-striped" 
                        UpdateMethod="gvCart_UpdateItem" DeleteMethod="gvCart_DeleteItem" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField HeaderText="Book ID" DataField="BookID" ReadOnly="true" />
                    <asp:BoundField HeaderText="Title" DataField="Book.Title" ReadOnly="true" />
                    <asp:TemplateField HeaderText="Price" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <%# string.Format("{0:N0}",Item.Book.Price) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Qty">
                        <ItemTemplate>
                            <div style="text-align:right">
                                <%# string.Format("{0:N0}",Item.Quantity) %>
                            </div>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox runat="server" ID="txtQty" Width="40" Text='<%# BindItem.Quantity %>'
                                Style="text-align: right" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <%# string.Format("{0:N0}",Convert.ToDouble(Item.Book.Price)*Convert.ToDouble(Item.Quantity)) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:Button Text="Edit" ID="btnEdit" CommandName="Edit" CssClass="btn btn-warning btn-xs" runat="server" />&nbsp;
                            <asp:Button Text="Delete" ID="btnDelete" OnClientClick="return confirm('Apakah anda yakin untuk delete data ini?')" CommandName="Delete" CssClass="btn btn-success btn-xs" runat="server" />
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:Button Text="Update" ID="btnUpdate" CommandName="Update" CssClass="btn btn-warning btn-xs" runat="server" />&nbsp;
                            <asp:Button Text="Cancel" ID="btnCancel" CommandName="Cancel" CssClass="btn btn-danger btn-xs" runat="server" />
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <div class="pull-right">
                <strong>Order Total :</strong>
                <asp:Label ID="lblTotalOrder" EnableViewState="false" runat="server" />
            </div>
                </ContentTemplate>
            </asp:UpdatePanel>

            <asp:Button Text="Final Check Out" ID="btnCheckout" PostBackUrl="~/Checkout.aspx"
                    runat="server" CssClass="btn btn-success" /><br />
        </div>
    </div>
</asp:Content>
