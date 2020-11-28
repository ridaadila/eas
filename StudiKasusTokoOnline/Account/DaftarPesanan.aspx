<%@ Page Title="Daftar Pesanan" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DaftarPesanan.aspx.cs" Inherits="StudiKasusTokoOnline.Account.DaftarPesanan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="container">
            <h3>List of Orders</h3><br />

            <asp:GridView runat="server" ID="gvDaftar" CssClass="table table-striped"
               ItemType="StudiKasusTokoOnline.Models.OrderDetail" AutoGenerateColumns="false"
                 SelectMethod="gvDaftar_GetData" >
                <Columns>
                    <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                    <asp:BoundField DataField="Order.CustomerName" DataFormatString="{0:d}" HeaderText="Customer Name" />
                    <asp:BoundField DataField="Order.ShipDate" DataFormatString="{0:d}" HeaderText="Ship Date" />
                    <asp:TemplateField ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <a href="<%# GetRouteUrl("DetailPesanan", new { id=Item.OrderID }) %>" class="btn btn-warning btn-xs">show details</a>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
