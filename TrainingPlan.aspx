<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="TrainingPlan.aspx.vb" Inherits="WebApplication1.TrainingPlan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Training Plan</title>
</head>
<body>
    Current Week: <% Response.Write(DatePart("ww", Now())) %> 
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="5" CellSpacing="1" BackColor="LightGray" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:HyperLinkField Text="Select" DataNavigateUrlFields="Week" DataNavigateUrlFormatString="trainingplanweek.aspx?week={0}" />
                    <asp:BoundField DataField="Week" HeaderText="Week" ReadOnly="True" SortExpression="Week" />
                    <asp:BoundField DataField="Mon" HeaderText="Mon" ReadOnly="True" SortExpression="Mon" />
                    <asp:BoundField DataField="Tue" HeaderText="Tue" ReadOnly="True" SortExpression="Tue" />
                    <asp:BoundField DataField="Wed" HeaderText="Wed" ReadOnly="True" SortExpression="Wed" />
                    <asp:BoundField DataField="Thu" HeaderText="Thu" ReadOnly="True" SortExpression="Thu" />
                    <asp:BoundField DataField="Fri" HeaderText="Fri" ReadOnly="True" SortExpression="Fri" />
                    <asp:BoundField DataField="Sat" HeaderText="Sat" ReadOnly="True" SortExpression="Sat" />
                    <asp:BoundField DataField="Sun" HeaderText="Sun" ReadOnly="True" SortExpression="Sun" />
                    <asp:BoundField DataField="Total" HeaderText="Total" ReadOnly="True" SortExpression="Total" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" ReadOnly="true" SortExpression="Notes" ItemStyle-HorizontalAlign="Left" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" HorizontalAlign="Right"/>
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SICXCConnectionString %>" SelectCommand="select datepart(week,TrainingDate) as 'Week', 
    sum(case when datepart(weekday,TrainingDate) = 2 then miles else null end) as 'Mon',
    sum(case when datepart(weekday,TrainingDate) = 3 then miles else null end) as 'Tue',
    sum(case when datepart(weekday,TrainingDate) = 4 then miles else null end) as 'Wed',
    sum(case when datepart(weekday,TrainingDate) = 5 then miles else null end) as 'Thu',
    sum(case when datepart(weekday,TrainingDate) = 6 then miles else null end) as 'Fri',
    sum(case when datepart(weekday,TrainingDate) = 7 then miles else null end) as 'Sat',
    sum(case when datepart(weekday,TrainingDate) = 1 then miles else null end) as 'Sun',
    sum(miles) as 'Total',
    max(notes) as 'Notes'
from training
where year(TrainingDate) = '2019'
group by datepart(week,TrainingDate)
union all
select null, 
    sum(case when datepart(weekday,TrainingDate) = 2 then miles else 0 end) as 'Mon',
    sum(case when datepart(weekday,TrainingDate) = 3 then miles else 0 end) as 'Tue',
    sum(case when datepart(weekday,TrainingDate) = 4 then miles else 0 end) as 'Wed',
    sum(case when datepart(weekday,TrainingDate) = 5 then miles else 0 end) as 'Thu',
    sum(case when datepart(weekday,TrainingDate) = 6 then miles else 0 end) as 'Fri',
    sum(case when datepart(weekday,TrainingDate) = 7 then miles else 0 end) as 'Sat',
    sum(case when datepart(weekday,TrainingDate) = 1 then miles else 0 end) as 'Sun',
    sum(miles),
    null
from training
where year(TrainingDate) = '2019'"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
