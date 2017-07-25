<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCCustomerInformationTAB.ascx" TagPrefix="uc1" TagName="CDCCustomerInformationTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCTransactionTAB.ascx" TagPrefix="uc1" TagName="CDCTransactionTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCReportingDateTAB.ascx" TagPrefix="uc1" TagName="CDCReportingDateTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCSBPFinancial.ascx" TagPrefix="uc1" TagName="CDCSBPFinancial" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCStaffDetails.ascx" TagPrefix="uc1" TagName="CDCStaffDetails" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCFactsAndFinding.ascx" TagPrefix="uc1" TagName="CDCFactsAndFinding" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCFRMUInternalInformation.ascx" TagPrefix="uc1" TagName="CDCFRMUInternalInformation" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCCaseInvestigationComments.ascx" TagPrefix="uc1" TagName="CDCCaseInvestigationComments" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCCaseCloseConfirmation.ascx" TagPrefix="uc1" TagName="CDCCaseCloseConfirmation" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/CDCDecisionInformation.ascx" TagPrefix="uc1" TagName="CDCDecisionInformation" %>



<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCCreateCardDisputeCases.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.UCCreateCardDisputeCases" %>

<script type="text/javascript">
    function pageLoad(sender, args) {
        $(".datepickercss").datepicker();
    }
</script>

<div class="row">
    <div class="col-lg-12 wp-h1">
        <asp:Label ID="lblHeading" runat="server" Text="Add Card Dispute Cases"></asp:Label><br />
        <asp:Label ID="lblMsg" runat="server" CssClass="normal-text-2" ForeColor="Red"></asp:Label>
    </div>
</div>

<div class="panel-group" id="accordion">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlCustomerInformation">Customer Information</a>
            </h4>
        </div>
        <div id="pnlCustomerInformation" class="panel-collapse collapse ">
            <uc1:CDCCustomerInformationTAB runat="server" id="CDCCustomerInformationTAB" />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlTransaction">Transaction</a>
            </h4>
        </div>
        <div id="pnlTransaction" class="panel-collapse collapse">
            <uc1:CDCTransactionTAB runat="server" id="CDCTransactionTAB" />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlReporting">Reporting Date</a>
            </h4>
        </div>
        <div id="pnlReporting" class="panel-collapse collapse">
            <uc1:CDCReportingDateTAB runat="server" id="CDCReportingDateTAB" />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlSBPFinancial">SBP Financial</a>
            </h4>
        </div>
        <div id="pnlSBPFinancial" class="panel-collapse collapse">
            <uc1:CDCSBPFinancial runat="server" id="CDCSBPFinancial" />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlStaffDetails">Staff Details</a>
            </h4>
        </div>
        <div id="pnlStaffDetails" class="panel-collapse collapse">
            <uc1:CDCStaffDetails runat="server" id="CDCStaffDetails" />
        </div>

    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlFactsNFinding">Facts & Finding</a>
            </h4>
        </div>
        <div id="pnlFactsNFinding" class="panel-collapse collapse">
            <uc1:CDCFactsAndFinding runat="server" id="CDCFactsAndFinding" />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlFRMUInternalInformation">FRMU Internal Information</a>
            </h4>
        </div>
        <div id="pnlFRMUInternalInformation" class="panel-collapse collapse">
            <uc1:CDCFRMUInternalInformation runat="server" id="CDCFRMUInternalInformation" />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlCaseInvestigationComments">Case Investigation Comments</a>
            </h4>
        </div>
        <div id="pnlCaseInvestigationComments" class="panel-collapse collapse">
            <uc1:CDCCaseInvestigationComments runat="server" id="CDCCaseInvestigationComments" />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlCaseCloseConfirmation">Case Close Confirmation</a>
            </h4>
        </div>
        <div id="pnlCaseCloseConfirmation" class="panel-collapse collapse">
            <uc1:CDCCaseCloseConfirmation runat="server" id="CDCCaseCloseConfirmation" />
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlDecisionInformation">Decision Information</a>
            </h4>
        </div>
        <div id="pnlDecisionInformation" class="panel-collapse collapse">
            <div class="panel-body">
                <uc1:CDCDecisionInformation runat="server" id="CDCDecisionInformation" />
            </div>
        </div>
    </div>
</div>
<asp:Panel ID="pnlButton" runat="server">
    <div class="row">
        <div class="col-md-12 col-sm-12 col-xs-12">
            <div class="form-group">
                <asp:LinkButton ID="lnkBtnSave" runat="server" Text="Save" class="btn request-form-btn-2 backbutton"></asp:LinkButton>
                <asp:LinkButton ID="lnkBtnCancel" runat="server" Text="Cancel" OnClick="lnkBtnCancel_Click" class="btn request-form-btn-2 backbutton" />
                <asp:LinkButton ID="lnkBtnSubmit" runat="server" Text="Submit" ValidationGroup="vgSave" class="btn request-form-btn-2 backbutton" />
                <asp:LinkButton ID="lnkBtnApprove" runat="server" Text="Approve" class="btn request-form-btn-2 backbutton" Visible="False" />
                <asp:LinkButton ID="lnkBtnValidate" runat="server" Text="Validate" class="btn request-form-btn-2 backbutton" Visible="False" />
                <asp:LinkButton ID="lnkBtnReject" runat="server" Text="Reject" class="btn request-form-btn-2 backbutton" Visible="False" />
            </div>
        </div>
    </div>
</asp:Panel>

<asp:Panel ID="pnlHistory" runat="server" CssClass="request-form-row3">
</asp:Panel>
