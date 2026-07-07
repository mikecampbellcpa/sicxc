<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="trainingplaninsert.aspx.vb" Inherits="WebApplication1.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="TrainingDate" DataSourceID="SqlDataSource1">
                <Fields>
                    <asp:BoundField DataField="TrainingDate" HeaderText="TrainingDate" ReadOnly="True" SortExpression="TrainingDate" />
                    <asp:BoundField DataField="Miles" HeaderText="Miles" SortExpression="Miles" />
                    <asp:BoundField DataField="RunType" HeaderText="RunType" SortExpression="RunType" />
                    <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                    <asp:CommandField ShowEditButton="True" ShowInsertButton="True" />
                </Fields>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:SICXCConnectionString %>" DeleteCommand="DELETE FROM [Training] WHERE [TrainingDate] = @TrainingDate" InsertCommand="INSERT INTO [Training] ([TrainingDate], [Miles], [RunType], [Notes]) VALUES (@TrainingDate, @Miles, @RunType, @Notes)" SelectCommand="SELECT * FROM [Training] where trainingdate = @trainingdate" UpdateCommand="UPDATE [Training] SET [Miles] = @Miles, [RunType] = @RunType, [Notes] = @Notes WHERE [TrainingDate] = @TrainingDate">
                <DeleteParameters>
                    <asp:Parameter DbType="Date" Name="TrainingDate" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter DbType="Date" Name="TrainingDate" />
                    <asp:Parameter Name="Miles" Type="Decimal" />
                    <asp:Parameter Name="RunType" Type="String" />
                    <asp:Parameter Name="Notes" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Miles" Type="Decimal" />
                    <asp:Parameter Name="RunType" Type="String" />
                    <asp:Parameter Name="Notes" Type="String" />
                    <asp:Parameter DbType="Date" Name="TrainingDate" />
                </UpdateParameters>
                <SelectParameters>
                    <asp:QueryStringParameter Name="TrainingDate" Type="String" QueryStringField="TrainingDate" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
