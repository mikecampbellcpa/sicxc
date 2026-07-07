<%@ Page Language="VB" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>Records</title>    
</head>
<body>
    <a href="Default">Home</a>
    <hr />
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name"></asp:BoundField>
                <asp:BoundField DataField="Distance" HeaderText="Distance" SortExpression="Distance"></asp:BoundField>
                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course"></asp:BoundField>
                <asp:BoundField DataField="Year" HeaderText="Year" SortExpression="Year"></asp:BoundField>
                <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" SortExpression="Time"></asp:BoundField>
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
            events.name, events.distance, events.course, year(events.date) as 'Year',
            substring(CONVERT(varchar, DATEADD(ms, events.Seconds * 1000, 0), 121), 15, 7) as Time
         from events
         inner join (
            select sex, distance, min(seconds) as Seconds
            from events
            where Team = 'SIC'
                and Distance in ('1k','2k','3k','4k','5k','800m','1600m','1mi')
            group by sex, distance) as Records
        on Records.Seconds = Events.Seconds 
            and Records.distance = Events.distance
        order by events.sex, events.Seconds">
        </asp:SqlDataSource>
    </form>
</body>
</html>
