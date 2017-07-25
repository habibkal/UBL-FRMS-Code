<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCAnnouncement.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.UCAnnouncement" %>

<div class="news">
    <h1 class="normal-heading">
        <asp:Label ID="lblHeading" Text="News" runat="server"></asp:Label>
    </h1>
    <asp:Repeater ID="rptAnnouncement" runat="server" OnItemDataBound="rptAnnouncement_ItemDataBound">
        <ItemTemplate>
            <div class="normal-text1">
                <p>
                    <%--<asp:Label ID="lblShortDesc" runat="server"></asp:Label>--%>
                    <asp:Literal ID="ltrShortDesc" runat="server"></asp:Literal>
                </p>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <div>
        <button class="normal-button1">
            <asp:LinkButton ID="lnkViewAll" Text="View All" runat="server" OnClick="lnkViewAll_Click"></asp:LinkButton>
        </button>
    </div>
</div>
