<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCFeatureCategory.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.UCFeatureCategory" %>

<div class="container">
    <div class="row">
        <asp:Repeater ID="rptFeature" runat="server" OnItemDataBound="rptFeature_ItemDataBound">
            <ItemTemplate>
                <div class="col-lg-3 col-xs-12 center">
                    <div class="gen-webpart">
                        <asp:HyperLink ID="hypAnchor" runat="server" NavigateUrl="#">
                            <div class="gen-icon-1">
                                <asp:Image ID="imgFeature" runat="server" ImageUrl="#" AlternateText="Feature Image" />
                            </div>
                            <div class="gen-heading-1">
                                <asp:Label ID="lblHeading" runat="server"></asp:Label>
                            </div>
                            <div class="gen-text-1">
                                <asp:Label ID="lblDescr" runat="server"></asp:Label>
                            </div>
                        </asp:HyperLink>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
