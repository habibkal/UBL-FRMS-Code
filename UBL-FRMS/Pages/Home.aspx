<%@ Page MasterPageFile="~masterurl/default.master" Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" meta:webpartpageexpansion="full" meta:progid="SharePoint.WebPartPage.Document" %>

<%@ Register Src="~/_controltemplates/15/UBL-FRMS/UCBanner.ascx" TagPrefix="uc1" TagName="UCBanner" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/UCFeatureCategory.ascx" TagPrefix="uc1" TagName="UCFeatureCategory" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/UCAnnouncement.ascx" TagPrefix="uc1" TagName="UCAnnouncement" %>

<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <uc1:UCBanner runat="server" id="UCBanner" />
    <br />
    <uc1:UCAnnouncement runat="server" id="UCAnnouncement" />
    <uc1:UCFeatureCategory runat="server" id="UCFeatureCategory" />
</asp:Content>
