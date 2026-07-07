<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="WebForm2.aspx.vb" Inherits="WebApplication1.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="TrainingDate" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:HyperLinkField Text="Select" DataNavigateUrlFields="TrainingDate" DataNavigateUrlFormatString="trainingplaninsert.aspx?trainingdate={0}" />
                    <asp:BoundField DataField="TrainingDate" HeaderText="TrainingDate" ReadOnly="True" SortExpression="TrainingDate" />
                    <asp:BoundField DataField="Miles" HeaderText="Miles" SortExpression="Miles" />
                    <asp:BoundField DataField="RunType" HeaderText="RunType" SortExpression="RunType" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SICXCConnectionString %>" SelectCommand="select convert(varchar,trainingdate,121) as TrainingDate,Miles,RunType,Notes from training where datepart(week,trainingdate) = @week">
                <SelectParameters>
                    <asp:QueryStringParameter Name="Week" QueryStringField="week" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
