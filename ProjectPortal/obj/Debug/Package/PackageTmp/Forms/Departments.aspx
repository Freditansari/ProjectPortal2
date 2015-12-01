<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Departments.aspx.cs" Inherits="ProjectPortal.WebForm3" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadGrid ID="DeptDataGrid" runat="server" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" DataSourceID="DepartmentsDS" GroupPanelPosition="Top">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="Department" DataSourceID="DepartmentsDS">
        <Columns>
            <telerik:GridBoundColumn DataField="Department" FilterControlAltText="Filter Department column" HeaderText="Department" ReadOnly="True" SortExpression="Department" UniqueName="Department">
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="DepartmentsDS" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT [Department] FROM [Departments]"></asp:SqlDataSource>
<telerik:RadTextBox ID="DepartmentTextBox" Runat="server" EmptyMessage="New Deparments Name" LabelWidth="64px" Resize="None" Width="160px">
</telerik:RadTextBox>
    <telerik:RadButton ID="addNewDepartmentsButton" runat="server" Height="34px" OnClick="addNewDepartmentsButton_Click" Text="Add Departments">
    </telerik:RadButton>
</asp:Content>
