<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<!DOCTYPE html>
<html>
<head runat="server">
    <title>Nested GridView Insert without full page postback</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 24px; }
        .child { margin: 12px 0 24px 24px; border-left: 3px solid #ddd; padding-left: 16px; }
        .footer-input { width: 140px; }
        .note { color: #666; font-size: 12px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <h2>Customers → Orders</h2>
        <p class="note">Insert into the child GridView footer. Only the child panel updates (async).</p>

        <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvCustomers_RowDataBound">
            <Columns>
                <asp:BoundField DataField="Id" HeaderText="Customer ID" />
                <asp:BoundField DataField="Name" HeaderText="Customer Name" />
                <asp:TemplateField HeaderText="Orders">
                    <ItemTemplate>
                        <div class="child">
                            <asp:UpdatePanel ID="upChild" runat="server" UpdateMode="Conditional">
                                <ContentTemplate>
                                    <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="false" ShowFooter="true"
                                        OnRowCommand="gvOrders_RowCommand">
                                        <Columns>
                                            <asp:BoundField DataField="Id" HeaderText="Order ID" />
                                            <asp:BoundField DataField="Product" HeaderText="Product" />
                                            <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                                            <asp:TemplateField HeaderText="Actions">
                                                <FooterTemplate>
                                                    <asp:TextBox ID="txtProduct" runat="server" CssClass="footer-input" Placeholder="Product"></asp:TextBox>
                                                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="footer-input" Placeholder="Qty"></asp:TextBox>
                                                    <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="AddOrder" />
                                                </FooterTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </ContentTemplate>
                                <Triggers>
                                    <asp:AsyncPostBackTrigger ControlID="gvOrders" EventName="RowCommand" />
                                </Triggers>
                            </asp:UpdatePanel>
                            <!-- Hidden field to hold the parent CustomerId for this child grid -->
                            <asp:HiddenField ID="hfCustomerId" runat="server" Value='<%# Eval("Id") %>' />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
