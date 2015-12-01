<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TasksDetails.aspx.cs" Inherits="ProjectPortal.WebForm7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="TaskID" DataSourceID="tasksDetailsDataSource" Height="50px" Width="453px">
    <Fields>
        <asp:BoundField DataField="TaskID" HeaderText="TaskID" InsertVisible="False" ReadOnly="True" SortExpression="TaskID" />
        <asp:BoundField DataField="ProjectID" HeaderText="ProjectID" SortExpression="ProjectID" />
        <asp:BoundField DataField="TaskName" HeaderText="TaskName" SortExpression="TaskName" />
        <asp:BoundField DataField="TaskDescription" HeaderText="TaskDescription" SortExpression="TaskDescription" />
        <asp:BoundField DataField="StartDate" HeaderText="StartDate" SortExpression="StartDate" />
        <asp:BoundField DataField="EndDate" HeaderText="EndDate" SortExpression="EndDate" />
        <asp:CheckBoxField DataField="isCompleted" HeaderText="isCompleted" SortExpression="isCompleted" />
        <asp:BoundField DataField="Creator" HeaderText="Creator" SortExpression="Creator" />
        <asp:BoundField DataField="assignedUser" HeaderText="assignedUser" SortExpression="assignedUser" />
        <asp:BoundField DataField="Remarks" HeaderText="Remarks" SortExpression="Remarks" />
    </Fields>
</asp:DetailsView>
<asp:SqlDataSource ID="tasksDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT * FROM [Tasks] WHERE ([TaskID] = @TaskID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="TaskID" QueryStringField="TaskID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>
