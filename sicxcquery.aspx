<%@ Page Language="VB" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>Results</title>    
</head>
<body>
    <a href="Default">Home</a>
    <hr />
    <form id="form1" runat="server">
        <%=Request.QueryString("athletename")%>
        <br />
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="Date" HeaderText="Date" ReadOnly="True" SortExpression="Date"></asp:BoundField>
                <asp:BoundField DataField="Course" HeaderText="Course" SortExpression="Course"></asp:BoundField>
                <asp:BoundField DataField="Distance" HeaderText="Distance" SortExpression="Distance"></asp:BoundField>
                <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" SortExpression="Time"></asp:BoundField>
                <asp:BoundField DataField="PB" HeaderText="PB" ReadOnly="True" SortExpression="PB"></asp:BoundField>
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
    
            CONVERT(varchar,Date,101) as Date, course,events.distance,
            substring(CONVERT(varchar, DATEADD(ms, Seconds * 1000, 0), 121), 15, 7) as Time,
            substring(CONVERT(varchar, DATEADD(ms, Seconds / distances.miles * 1000, 0), 121), 15, 7) as Pace, 
            case when min(Seconds) over(partition by events.distance) = events.Seconds then 'PB' else '' end PB
            from events
            inner join distances on events.distance = distances.distance
            where events.name = @Name and events.team in ( 'SIC', 'USA' )
            order by events.Date">
            <SelectParameters>
                <asp:QueryStringParameter Name="Name" Type="String" QueryStringField="athletename"></asp:QueryStringParameter>
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
