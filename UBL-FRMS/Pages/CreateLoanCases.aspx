﻿<%@ Page MasterPageFile="~masterurl/default.master" Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" meta:webpartpageexpansion="full" meta:progid="SharePoint.WebPartPage.Document" %>

<%@ Register Src="~/_controltemplates/15/UBL-FRMS/UCCreateLoanCases.ascx" TagPrefix="uc1" TagName="UCCreateLoanCases" %>
<asp:Content ContentPlaceHolderID="PlaceHolderMain" runat="server">
    <div class="container">
        <uc1:UCCreateLoanCases runat="server" id="UCCreateLoanCases" />
    </div>
</asp:Content>