<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Projects.aspx.cs" Inherits="ProjectPortal.WebForm2" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 211px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
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
                <asp:DropDownList ID="departmentDDL" runat="server" DataSourceID="DepartmentDataSource" DataTextField="Department" DataValueField="Department">
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
                <asp:RequiredFieldValidator  ID="ProjectNameValidator" runat="server" ControlToValidate="ProjectNameTextBox" ErrorMessage="Project Name Required">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Start Date:</td>
            <td></td>
            <td class="auto-style1">
                <telerik:RadDatePicker ID="StartDateDatePicker" Runat="server" Culture="en-US">
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
                <asp:Button ID="BtnAddRecord" runat="server" OnClick="BtnAddRecord_Click" Text="Add Record" />
                &nbsp; </td>
        </tr>
    </table>
</asp:Content>
