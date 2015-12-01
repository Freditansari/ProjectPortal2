<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="ProjectPortal.WebForm1" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="UserIDLabel" runat="server" Text="Label"></asp:Label>
<br />
Unfinished Tasks:<br />
<telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="UnfinishedDataSouce" GroupPanelPosition="Top">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
    <ClientSettings>
        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
    </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="TaskID" DataSourceID="UnfinishedDataSouce">
        <Columns>
            <telerik:GridBoundColumn DataField="TaskID" DataType="System.Int32" FilterControlAltText="Filter TaskID column" HeaderText="TaskID" ReadOnly="True" SortExpression="TaskID" UniqueName="TaskID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="ProjectID" DataType="System.Int32" FilterControlAltText="Filter ProjectID column" HeaderText="ProjectID" SortExpression="ProjectID" UniqueName="ProjectID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TaskName" FilterControlAltText="Filter TaskName column" HeaderText="TaskName" SortExpression="TaskName" UniqueName="TaskName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TaskDescription" FilterControlAltText="Filter TaskDescription column" HeaderText="TaskDescription" SortExpression="TaskDescription" UniqueName="TaskDescription">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="StartDate" DataType="System.DateTime" FilterControlAltText="Filter StartDate column" HeaderText="StartDate" SortExpression="StartDate" UniqueName="StartDate">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EndDate" DataType="System.DateTime" FilterControlAltText="Filter EndDate column" HeaderText="EndDate" SortExpression="EndDate" UniqueName="EndDate">
            </telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn DataField="isCompleted" DataType="System.Boolean" FilterControlAltText="Filter isCompleted column" HeaderText="isCompleted" SortExpression="isCompleted" UniqueName="isCompleted">
            </telerik:GridCheckBoxColumn>
            <telerik:GridBoundColumn DataField="Creator" FilterControlAltText="Filter Creator column" HeaderText="Creator" SortExpression="Creator" UniqueName="Creator">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="assignedUser" FilterControlAltText="Filter assignedUser column" HeaderText="assignedUser" SortExpression="assignedUser" UniqueName="assignedUser">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Remarks" FilterControlAltText="Filter Remarks column" HeaderText="Remarks" SortExpression="Remarks" UniqueName="Remarks">
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="UnfinishedDataSouce" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT * FROM [Tasks] WHERE (([assignedUser] = @assignedUser) AND ([isCompleted] = @isCompleted))">
    <SelectParameters>
        <asp:ControlParameter ControlID="UserIDLabel" Name="assignedUser" PropertyName="Text" Type="String" />
        <asp:Parameter DefaultValue="False" Name="isCompleted" Type="Boolean" />
    </SelectParameters>
</asp:SqlDataSource>
<br />
<br />
Late Tasks:<telerik:RadGrid ID="RadGrid2" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="lateTasksDS" GroupPanelPosition="Top">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
    <ClientSettings>
        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
    </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="TaskID" DataSourceID="lateTasksDS">
        <Columns>
            <telerik:GridBoundColumn DataField="TaskID" DataType="System.Int32" FilterControlAltText="Filter TaskID column" HeaderText="TaskID" ReadOnly="True" SortExpression="TaskID" UniqueName="TaskID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TaskName" FilterControlAltText="Filter TaskName column" HeaderText="TaskName" SortExpression="TaskName" UniqueName="TaskName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="TaskDescription" FilterControlAltText="Filter TaskDescription column" HeaderText="TaskDescription" SortExpression="TaskDescription" UniqueName="TaskDescription">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="StartDate" DataType="System.DateTime" FilterControlAltText="Filter StartDate column" HeaderText="StartDate" SortExpression="StartDate" UniqueName="StartDate">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EndDate" DataType="System.DateTime" FilterControlAltText="Filter EndDate column" HeaderText="EndDate" SortExpression="EndDate" UniqueName="EndDate">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="assignedUser" FilterControlAltText="Filter assignedUser column" HeaderText="assignedUser" SortExpression="assignedUser" UniqueName="assignedUser">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="LateDays" DataType="System.Int32" FilterControlAltText="Filter LateDays column" HeaderText="LateDays" ReadOnly="True" SortExpression="LateDays" UniqueName="LateDays">
            </telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn DataField="isCompleted" DataType="System.Boolean" FilterControlAltText="Filter isCompleted column" HeaderText="isCompleted" SortExpression="isCompleted" UniqueName="isCompleted">
            </telerik:GridCheckBoxColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="lateTasksDS" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT * FROM [LateDaysTasksView] WHERE (([LateDays] &gt; @LateDays) AND ([assignedUser] = @assignedUser))">
    <SelectParameters>
        <asp:Parameter DefaultValue="0" Name="LateDays" Type="Int32" />
        <asp:ControlParameter ControlID="UserIDLabel" Name="assignedUser" PropertyName="Text" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
