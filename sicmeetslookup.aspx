<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="sicxcmeetslookup.aspx.vb" Inherits="WebApplication1.sicxcmeetslookup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>

                <a href="Default">Home</a>
    <hr />
    <form id="form2" runat="server">
        <div>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
            <asp:ListItem Selected="True">2019</asp:ListItem>
            <asp:ListItem>2018</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2014</asp:ListItem>
        </asp:DropDownList> 
        <br />
            <asp:GridView ID="GridView1" runat="server" CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" ></asp:BoundField>
                    <asp:BoundField DataField="Meet" HeaderText="Meet" ReadOnly="true"></asp:BoundField>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:HyperLinkField Text="Select" DataNavigateUrlFields="Meet" DataNavigateUrlFormatString="sicxcmeets.aspx?Meet={0}" /> 
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:SICXCConnectionString %>' SelectCommand="select
                distinct convert(varchar, date, 101)as 'Date', course as 'Meet'
                from events
                where team = 'SIC'
                    and year(date) = @Year
                order by convert(varchar, date, 101)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" PropertyName="Text" Name="Year" Type="String" DefaultValue="2019"></asp:ControlParameter>
            </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>

</body>
</html>
