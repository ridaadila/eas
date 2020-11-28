<%@ Page Title="Checkout" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CheckOut.aspx.cs" Inherits="StudiKasusTokoOnline.CheckOut" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="container">
            <asp:Literal ID="ltHeader" runat="server" />

            <asp:Literal ID="ltPesanSukses" runat="server" />
            
            <p class="alert alert-warning">
                <strong>Nama Pemesan :</strong><asp:Literal ID="ltUsername" runat="server" />
            </p><br />
             <asp:GridView runat="server" ID="gvCart" ItemType="StudiKasusTokoOnline.Models.ShoppingCart" DataKeyNames="RecordID"
                SelectMethod="gvCart_GetData" CssClass="table table-striped" 
                AutoGenerateColumns="false">
                <Columns>
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
                </Columns>
            </asp:GridView>
            <div class="pull-right">
                <strong>Total :</strong>
                <asp:Label ID="lblTotalOrder" EnableViewState="false" runat="server" />
            </div>
            <div class="pull-left">
                <asp:Button Text="Submit" ID="btnSubmit" CssClass="btn btn-success" runat="server" OnClick="btnSubmit_Click" />
            </div>
            <div class="pull-left">
                <asp:Literal ID="ltLinkInvoice" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
