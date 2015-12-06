<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TasksDetails.aspx.cs" Inherits="ProjectPortal.WebForm7" %>
<%@ Register assembly="Telerik.Web.UI" namespace="Telerik.Web.UI" tagprefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 582px;
        }
        .auto-style2 {
            width: 316px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
<asp:SqlDataSource ID="tasksDetailsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT * FROM [Tasks] WHERE ([TaskID] = @TaskID)">
    <SelectParameters>
        <asp:QueryStringParameter Name="TaskID" QueryStringField="TaskID" Type="Int32" />
    </SelectParameters>
</asp:SqlDataSource>
    <table style="width:100%;">
        <tr>
            <td class="auto-style1">
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
                
            </td>
            
            <td class="auto-style2">
                
                <table style="width: 100%; height: 235px;">
                    <tr>
                        <td>
                            <telerik:RadTextBox ID="RectificationTextBox" Runat="server" EmptyMessage="Enter Rectification Here!" LabelWidth="64px" Resize="None" Width="160px">
                            </telerik:RadTextBox>
                            <asp:Button ID="SubmitRectificationButton" runat="server" Text="Submit" OnClick="SubmitRectificationButton_Click" />
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            <telerik:RadGrid ID="RectificationsDataGrid" runat="server" AllowSorting="True" DataSourceID="RectificationsDataSource" GroupPanelPosition="Top" Width="390px">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                                <MasterTableView AutoGenerateColumns="False" DataSourceID="RectificationsDataSource">
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="RectificationDate" DataType="System.DateTime" FilterControlAltText="Filter RectificationDate column" HeaderText="RectificationDate" SortExpression="RectificationDate" UniqueName="RectificationDate">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="RectificationNotes" FilterControlAltText="Filter RectificationNotes column" HeaderText="RectificationNotes" SortExpression="RectificationNotes" UniqueName="RectificationNotes">
                                        </telerik:GridBoundColumn>
                                        <telerik:GridBoundColumn DataField="userID" FilterControlAltText="Filter userID column" HeaderText="userID" SortExpression="userID" UniqueName="userID">
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                            <asp:SqlDataSource ID="RectificationsDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:TasksConnectionString %>" SelectCommand="SELECT [RectificationDate], [RectificationNotes], [userID] FROM [Rectifications] WHERE ([TaskID] = @TaskID)">
                                <SelectParameters>
                                    <asp:QueryStringParameter Name="TaskID" QueryStringField="TaskID" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                      
                    </tr>
                    </table>
                
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">
    <telerik:RadTextBox ID="NoteTextBox" Runat="server" EmptyMessage="enter a note here!" Height="115px" TextMode="MultiLine" Width="329px">
    </telerik:RadTextBox>
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style1">

    <asp:Button ID="FinishButton" runat="server" OnClick="FinishButton_Click" Text="Finish!" />
            </td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    <br />

    </asp:Content>
