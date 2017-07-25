<%@ Page MasterPageFile="~masterurl/default.master" Language="C#" Inherits="Microsoft.SharePoint.WebPartPages.WebPartPage, Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" meta:webpartpageexpansion="full" meta:progid="SharePoint.WebPartPage.Document" %>

<%@ Register Src="~/_controltemplates/15/UBL-FRMS/UCLoanDisputeCases.ascx" TagPrefix="uc1" TagName="UCLoanDisputeCases" %>

<asp:Content runat="server" ContentPlaceHolderID="PlaceHolderMain">
    <div class="container">
        <uc1:UCLoanDisputeCases id="UCLoanDisputeCases" runat="server" />
    </div>
</asp:Content>
