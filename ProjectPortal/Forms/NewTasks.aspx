<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="NewTasks.aspx.cs" Inherits="ProjectPortal.WebForm4" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
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
                <asp:DropDownList ID="DdlProjectID" AppendDataBoundItems="True" runat="server" DataSourceID="ProjectDataSource" DataTextField="ProjectName" DataValueField="ProjectID">
                    <asp:ListItem Value="">Select One</asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="ProjectDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT [ProjectID], [ProjectName] FROM [Projects] WHERE ([isCompleted] = @isCompleted)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="False" Name="isCompleted" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>Task Name:</td>
            <td></td>
            <td colspan="2">
                <asp:TextBox ID="TaskTextBox" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="TaskNameValidator" runat="server" ErrorMessage="Task name is Required" ControlToValidate="TaskTextBox">*</asp:RequiredFieldValidator>
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
<TimeView CellSpacing="-1"></TimeView>

<TimePopupButton ImageUrl="" HoverImageUrl=""></TimePopupButton>

<Calendar UseRowHeadersAsSelectors="False" UseColumnHeadersAsSelectors="False" EnableWeekends="True" FastNavigationNextText="&amp;lt;&amp;lt;" enablekeyboardnavigation="True"></Calendar>

<DateInput DisplayDateFormat="M/d/yyyy" DateFormat="M/d/yyyy" LabelWidth="40%">
<EmptyMessageStyle Resize="None"></EmptyMessageStyle>

<ReadOnlyStyle Resize="None"></ReadOnlyStyle>

<FocusedStyle Resize="None"></FocusedStyle>

<DisabledStyle Resize="None"></DisabledStyle>

<InvalidStyle Resize="None"></InvalidStyle>

<HoveredStyle Resize="None"></HoveredStyle>

<EnabledStyle Resize="None"></EnabledStyle>
</DateInput>

<DatePopupButton ImageUrl="" HoverImageUrl=""></DatePopupButton>
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
            <td>
                &nbsp;</td>
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
                <asp:DropDownList ID="UserIDDDL" AppendDataBoundItems="true" runat="server">
                </asp:DropDownList>
                <%--<asp:CompareValidator ID="userValidator" runat="server" ControlToValidate="UserIDDDL" ErrorMessage="*" ValueToCompare="Select a user!">*</asp:CompareValidator>--%>
            </td>
        </tr>
        <tr>
            <td>User ID:</td>
            <td>

            </td>
            <td>    
                <asp:Label ID="userIDLabel" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>

        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
            </td>
            <td colspan="2">
                <asp:Button ID="BtnAddRecord" runat="server" OnClick="BtnAddRecord_Click" Text="Add Record" />
                &nbsp; </td>
        </tr>
    </table>
</asp:Content>
