<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageTasks.aspx.cs" Inherits="ProjectPortal.WebForm5" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <asp:DropDownList ID="ProjectDDL" runat="server" DataSourceID="ProjectDS" DataTextField="ProjectName" DataValueField="ProjectID" AutoPostBack="True">
</asp:DropDownList>
<asp:SqlDataSource ID="ProjectDS" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT [ProjectID], [ProjectName] FROM [Projects]"></asp:SqlDataSource>
<telerik:RadGrid ID="TasksRadGrid" runat="server" DataSourceID="TasksDataSource" GroupPanelPosition="Top" AllowPaging="True" AllowSorting="True" OnItemUpdated="TasksRadGrid_ItemUpdated" OnSelectedIndexChanged="TasksRadGrid_SelectedIndexChanged" ShowGroupPanel="True">
    <GroupingSettings CollapseAllTooltip="Collapse all groups">
    </GroupingSettings>
    <ClientSettings AllowDragToGroup="True" AllowColumnsReorder="True" EnablePostBackOnRowClick="True" ReorderColumnsOnClient="True">
        <Selecting AllowRowSelect="True" />
        <Scrolling AllowScroll="True" UseStaticHeaders="True" />
    </ClientSettings>
    <MasterTableView AutoGenerateColumns="False" DataKeyNames="TaskID" DataSourceID="TasksDataSource">
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
<asp:SqlDataSource ID="TasksDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT * FROM [Tasks] WHERE ([ProjectID] = @ProjectID)">
    <SelectParameters>
        <asp:ControlParameter ControlID="ProjectDDL" Name="ProjectID" PropertyName="SelectedValue" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>
    <asp:Label ID="TaskIDLabel" runat="server"></asp:Label>
    <br />
    <table>
       <%-- <asp:Panel ID="PnlPrimaryKey" runat="server">
            <tr>
                <td>Task ID:</td>
                <td></td>
                <td colspan="2">
                    <asp:TextBox ID="TxtTaskID" runat="server" />
                </td>
            </tr>
        </asp:Panel>--%>
        <tr>
            <td>Project Name:</td>
            <td></td>
            <td colspan="2">
                <asp:DropDownList ID="ProjectSelectionDDL" runat="server" DataSourceID="ProjectDS" DataTextField="ProjectName" DataValueField="ProjectID">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>Task Name:</td>
            <td></td>
            <td colspan="2">
                <asp:TextBox ID="TaskTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="TaskNameValidator" runat="server" ControlToValidate="TaskTextBox" ErrorMessage="Task name is Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Task Description:</td>
            <td></td>
            <td colspan="2">
                <asp:TextBox ID="TxtTaskDescription" runat="server" Rows="7" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td>Start Date:</td>
            <td></td>
            <td>
                <telerik:RadDateTimePicker ID="StartDateTimePicker" Runat="server" Culture="en-US">
                    <TimeView CellSpacing="-1">
                    </TimeView>
                    <TimePopupButton HoverImageUrl="" ImageUrl="" />
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
                </telerik:RadDateTimePicker>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="startDateValidator" runat="server" ControlToValidate="StartDateTimePicker" ErrorMessage="Start Date Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>End Date:</td>
            <td></td>
            <td>
                <telerik:RadDateTimePicker ID="EndDateTimePicker" Runat="server">
                </telerik:RadDateTimePicker>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>Is Completed:</td>
            <td></td>
            <td colspan="2">
                <asp:CheckBox ID="CbxIsCompleted" runat="server" />
            </td>
        </tr>
        <tr>
            <td>Asssign to:</td>
            <td></td>
            <td colspan="2">
                <asp:DropDownList ID="UserIDDDL" AppendDataBoundItems=" true" runat="server">
                    <asp:ListItem>Select A User!</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>User ID:</td>
            <td></td>
            <td>
                <asp:Label ID="userIDLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>Remarks:</td>
            <td></td>
            <td>
                  <asp:TextBox ID="RemarksTextBox" runat="server" Rows="7" TextMode="MultiLine" />
            
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td colspan="2">
                &nbsp; 
                <asp:Button ID="UpdateButton" runat="server" OnClick="UpdateButton_Click" Text="Update" Width="137px" />
            </td>
        </tr>
    </table>
</asp:Content>
