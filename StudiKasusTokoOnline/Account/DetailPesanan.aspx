<%@ Page Title="Detail Pesanan" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DetailPesanan.aspx.cs" Inherits="StudiKasusTokoOnline.Account.DetailPesanan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="thumbnail">
        <div class="container">
            <h3>Detail Pemesanan</h3>
            <br />
                <asp:FormView runat="server" ID="frmDetail" ItemType="StudiKasusTokoOnline.Models.Order"
                    SelectMethod="frmDetail_GetItem" RenderOuterTable="false">
                    <ItemTemplate>
                        <div class="form-horizontal">
                            <div class="form-group">
                                <span class="col-sm-4 control-label">Order ID :</span>
                                <div class="col-sm-6">
                                    <span><%# Item.OrderID %></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <span class="col-sm-4 control-label">Customer Name :</span>
                                <div class="col-sm-6">
                                    <span><%# Item.CustomerName %></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <span class="col-sm-4 control-label">Order Date :</span>
                                <div class="col-sm-6">
                                    <span><%# Item.OrderDate %></span>
                                </div>
                            </div>
                            <div class="form-group">
                                <span class="col-sm-4 control-label">Ship Date :</span>
                                <div class="col-sm-6">
                                    <span><%# Item.ShipDate %></span>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:FormView><br />

            <asp:GridView runat="server" ID="gvBookDetail" ItemType="StudiKasusTokoOnline.Models.OrderDetail" 
                AutoGenerateColumns="false" SelectMethod="gvBookDetail_GetData" CssClass="table table-striped">
                <Columns>
                    <asp:TemplateField>
                         <ItemTemplate>
                             <img src="<%# ResolveUrl(string.Format("~/Catalog/Images/Thumbs/{0}",Item.Book.CoverImage)) %>" style="width:50px;"  alt="book cover" />
                         </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Book.Title" HeaderText="Title" />
                    <asp:BoundField DataField="Price" HeaderText="Price" DataFormatString="{0:N0}" ItemStyle-HorizontalAlign="Right" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" ItemStyle-HorizontalAlign="Right" />
                    <asp:TemplateField HeaderText="Total" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <%# string.Format("{0:N0}",Convert.ToDecimal(Item.Price) * Convert.ToDecimal(Item.Quantity)) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
             <div class="pull-right">
                <strong>Total :</strong>
                <asp:Label ID="lblTotalOrder" EnableViewState="false" runat="server" />
            </div>
        </div>
    </div>
</asp:Content>
