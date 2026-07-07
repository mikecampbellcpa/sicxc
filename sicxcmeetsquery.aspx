<%@ Page Language="VB" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>Meets</title>    
</head>
<body>
    <a href="Default">Home</a>
    <hr />
    <form id="form1" runat="server">
        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True">
            <asp:ListItem Selected="True">2019</asp:ListItem>
            <asp:ListItem>2018</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2014</asp:ListItem>
        </asp:DropDownList> 
        <br />
        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="Course" DataValueField="Course" AutoPostBack="True"></asp:DropDownList>
        <asp:Button ID="Button2" runat="server" Text="Submit" />
        <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:SICXCConnectionString %>' SelectCommand="select distinct Course from Events where Team = 'SIC' and year(date) = @Year order by Course">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList2" PropertyName="Text" Name="Year" Type="String" DefaultValue="2019"></asp:ControlParameter>
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" AllowSorting="True" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:BoundField DataField="Place" HeaderText="Place" ReadOnly="True" SortExpression="Place"></asp:BoundField>
                <asp:BoundField DataField="Name" HeaderText="Name" ReadOnly="True" SortExpression="Name"></asp:BoundField>
                <asp:BoundField DataField="Sex" HeaderText="Sex" SortExpression="Sex"></asp:BoundField>
                <asp:BoundField DataField="Distance" HeaderText="Distance" SortExpression="Distance"></asp:BoundField>
                <asp:BoundField DataField="Time" HeaderText="Time" ReadOnly="True" SortExpression="Time"></asp:BoundField>
                <asp:BoundField DataField="Pace" HeaderText="Pace" ReadOnly="True" SortExpression="Pace"></asp:BoundField>
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
    
                    Place, Name, Sex, Events.Distance, 
                    substring(CONVERT(varchar, DATEADD(ms, Seconds * 1000, 0), 121), 15, 7) as Time,
                    substring(CONVERT(varchar, DATEADD(ms, Seconds / distances.miles * 1000, 0), 121), 15, 7) as Pace
                from Events
                inner join distances on events.distance = distances.distance
                where Team = 'SIC'
                    and Year(Date) = @Year
                    and Course = @Meet
                order by Events.Sex, Events.Distance, Events.Place">
            <SelectParameters>
                <asp:QueryStringParameter Name="Meet" Type="String" QueryStringField="Meet"></asp:QueryStringParameter>
                <asp:QueryStringParameter Name="Year" Type="String" QueryStringField="Year" />
            </SelectParameters>
        </asp:SqlDataSource>

    </form>
</body>
</html>
