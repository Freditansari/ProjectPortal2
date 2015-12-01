<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageProjects.aspx.cs" Inherits="ProjectPortal.WebForm6" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <telerik:RadGrid ID="RadGrid1" runat="server" DataSourceID="ProjectsDataSource" GroupPanelPosition="Top" AllowFilteringByColumn="True" AllowPaging="True" AllowSorting="True" ShowGroupPanel="True" OnSelectedIndexChanged="RadGrid1_SelectedIndexChanged">
    <GroupingSettings CollapseAllTooltip="Collapse all groups">
    </GroupingSettings>
        <ClientSettings AllowDragToGroup="True" EnablePostBackOnRowClick="True">
            <Selecting AllowRowSelect="True" />
            <Scrolling AllowScroll="True" UseStaticHeaders="True" />
        </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="ProjectID" DataSourceID="ProjectsDataSource">
        <Columns>
            <telerik:GridBoundColumn DataField="ProjectID" FilterControlWidth="15" DataType="System.Int32" FilterControlAltText="Filter ProjectID column" HeaderText="ProjectID" ReadOnly="True" SortExpression="ProjectID" UniqueName="ProjectID">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="Department" FilterControlWidth="60" FilterControlAltText="Filter Department column" HeaderText="Department" SortExpression="Department" UniqueName="Department">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="ProjectName" FilterControlAltText="Filter ProjectName column" HeaderText="ProjectName" SortExpression="ProjectName" UniqueName="ProjectName">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="StartDate" DataType="System.DateTime" FilterControlAltText="Filter StartDate column" HeaderText="StartDate" SortExpression="StartDate" UniqueName="StartDate">
            </telerik:GridBoundColumn>
            <telerik:GridBoundColumn DataField="EndDate" DataType="System.DateTime" FilterControlAltText="Filter EndDate column" HeaderText="EndDate" SortExpression="EndDate" UniqueName="EndDate">
            </telerik:GridBoundColumn>
            <telerik:GridCheckBoxColumn DataField="isCompleted" DataType="System.Boolean" FilterControlAltText="Filter isCompleted column" HeaderText="isCompleted" SortExpression="isCompleted" UniqueName="isCompleted">
            </telerik:GridCheckBoxColumn>
            <telerik:GridBoundColumn DataField="UserID" FilterControlAltText="Filter UserID column" HeaderText="UserID" SortExpression="UserID" UniqueName="UserID">
            </telerik:GridBoundColumn>
        </Columns>
    </MasterTableView>
</telerik:RadGrid>
<asp:SqlDataSource ID="ProjectsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT * FROM [Projects]"></asp:SqlDataSource>
    <br />
    <table>
       <%-- <asp:Panel ID="PnlPrimaryKey" runat="server">
            <tr>
                <td>Project ID:</td>
                <td></td>
                <td colspan="2">
                    <asp:TextBox ID="TxtProjectID" runat="server" />
                </td>
            </tr>
        </asp:Panel>--%>
        <tr>
            <td>Department:</td>
            <td></td>
            <td colspan="2">
                <asp:DropDownList ID="departmentDDL" AppendDataBoundItems="true" runat="server" DataSourceID="DepartmentDataSource" DataTextField="Department" DataValueField="Department">
                    <asp:ListItem>Select Department!</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="DepartmentDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT [Department] FROM [Departments]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Project Name:</td>
            <td></td>
            <td colspan="2">
                <telerik:RadTextBox ID="ProjectNameTextBox" Runat="server" EmptyMessage="Enter Project Name Here!" LabelWidth="64px" Resize="None" Width="160px">
                </telerik:RadTextBox>
                <asp:RequiredFieldValidator ID="ProjectNameValidator" runat="server" ControlToValidate="ProjectNameTextBox" ErrorMessage="Project Name Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Start Date:</td>
            <td></td>
            <td class="auto-style1">
                <telerik:RadDatePicker ID="StartDateDatePicker" Runat="server" Culture="en-US">
                    <Calendar enablekeyboardnavigation="True" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DateInput DateFormat="M/d/yyyy" DisplayDateFormat="M/d/yyyy" LabelWidth="40%">
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </DateInput>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="StartDateValidator" runat="server" ControlToValidate="StartDateDatePicker" ErrorMessage="Start Date Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>End Date:</td>
            <td></td>
            <td class="auto-style1">
                <telerik:RadDatePicker ID="EndDateDatePicker" Runat="server" Culture="en-US">
                    <Calendar enablekeyboardnavigation="True" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False">
                    </Calendar>
                    <DateInput DateFormat="M/d/yyyy" DisplayDateFormat="M/d/yyyy" LabelWidth="40%">
                        <EmptyMessageStyle Resize="None" />
                        <ReadOnlyStyle Resize="None" />
                        <FocusedStyle Resize="None" />
                        <DisabledStyle Resize="None" />
                        <InvalidStyle Resize="None" />
                        <HoveredStyle Resize="None" />
                        <EnabledStyle Resize="None" />
                    </DateInput>
                    <DatePopupButton HoverImageUrl="" ImageUrl="" />
                </telerik:RadDatePicker>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="EndDateValidator" runat="server" ControlToValidate="EndDateDatePicker" ErrorMessage="End Date Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Is Completed:</td>
            <td></td>
            <td colspan="2">
                <asp:CheckBox ID="CbxIsCompleted" runat="server" />
            </td>
        </tr>
        <tr>
            <td>User ID:</td>
            <td></td>
            <td colspan="2">
                <asp:Label ID="UserIDLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2"></td>
            <td colspan="2">
                <asp:Button ID="BtnAddRecord" runat="server" OnClick="BtnAddRecord_Click" Text="Update" />
                &nbsp; </td>
        </tr>
    </table>
</asp:Content>
