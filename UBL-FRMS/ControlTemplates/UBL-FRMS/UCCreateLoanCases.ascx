<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>

<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCCaseBriefingTAB.ascx" TagPrefix="uc1" TagName="LDCCaseBriefingTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCApplicationDetailTAB.ascx" TagPrefix="uc1" TagName="LDCApplicationDetailTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCReportingDateTAB.ascx" TagPrefix="uc1" TagName="LDCReportingDateTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCSBPFinancialTAB.ascx" TagPrefix="uc1" TagName="LDCSBPFinancialTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCStaffDetailTAB.ascx" TagPrefix="uc1" TagName="LDCStaffDetailTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCFactsAndFindingTAB.ascx" TagPrefix="uc1" TagName="LDCFactsAndFindingTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCCaseInvestigationCommentsTAB.ascx" TagPrefix="uc1" TagName="LDCCaseInvestigationCommentsTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCCheckFraudDBTAB.ascx" TagPrefix="uc1" TagName="LDCCheckFraudDBTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCCaseCloseConfirmationTAB.ascx" TagPrefix="uc1" TagName="LDCCaseCloseConfirmationTAB" %>
<%@ Register Src="~/_controltemplates/15/UBL-FRMS/LDCDecisionInformationTAB.ascx" TagPrefix="uc1" TagName="LDCDecisionInformationTAB" %>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCCreateLoanCases.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.UCCreateLoanCases" %>

<script type="text/javascript">
    function pageLoad(sender, args) {
        $(".datepickercss").datepicker();
    }
</script>

<div class="row">
    <div class="col-lg-12 wp-h1">
        <asp:Label ID="lblHeading" runat="server" Text="Add Loan Dispute Cases"></asp:Label><br />
        <asp:Label ID="lblMsg" runat="server" CssClass="normal-text-2" ForeColor="Red"></asp:Label>
    </div>
</div>

<div class="panel-group" id="accordion">

    <%--Case Briefing Tab--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlCaseBriefing">Case Briefing</a>
            </h4>
        </div>
        <div id="pnlCaseBriefing" class="panel-collapse collapse ">
            <uc1:LDCCaseBriefingTAB runat="server" id="LDCCaseBriefingTAB" />
        </div>
    </div>

    <%--ApplicationDetail Tab--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlApplicationDetail">Application Detail</a>
            </h4>
        </div>
        <div id="pnlApplicationDetail" class="panel-collapse collapse">
            <uc1:LDCApplicationDetailTAB runat="server" id="LDCApplicationDetailTAB" />
        </div>
    </div>

    <%--Reporting Date Tab--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlReporting">Reporting Date</a>
            </h4>
        </div>
        <div id="pnlReporting" class="panel-collapse collapse">
            <uc1:LDCReportingDateTAB runat="server" id="LDCReportingDateTAB" />
        </div>
    </div>

    <%--SBP Financial TAB--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlSBPFinancial">SBP Financial</a>
            </h4>
        </div>
        <div id="pnlSBPFinancial" class="panel-collapse collapse">
            <uc1:LDCSBPFinancialTAB runat="server" id="LDCSBPFinancialTAB" />
        </div>
    </div>

    <%--Staff Detail TAB--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlStaffDetails">Staff Details</a>
            </h4>
        </div>
        <div id="pnlStaffDetails" class="panel-collapse collapse">
            <uc1:LDCStaffDetailTAB runat="server" id="LDCStaffDetailTAB" />
        </div>

    </div>

    <%--Facts & Finding Tab--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlFactsNFinding">Facts & Finding</a>
            </h4>
        </div>
        <div id="pnlFactsNFinding" class="panel-collapse collapse">
            <uc1:LDCFactsAndFindingTAB runat="server" id="LDCFactsAndFindingTAB" />
        </div>
    </div>

    <%--Case Investigation Comments Tab--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlCaseInvestigationComments">Case Investigation Comments</a>
            </h4>
        </div>
        <div id="pnlCaseInvestigationComments" class="panel-collapse collapse">
            <uc1:LDCCaseInvestigationCommentsTAB runat="server" id="LDCCaseInvestigationCommentsTAB" />
        </div>
    </div>

    <%--Check Fraud DB Tab--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlCheckFraudDB">Check Fraud DB</a>
            </h4>
        </div>
        <div id="pnlCheckFraudDB" class="panel-collapse collapse">
            <uc1:LDCCheckFraudDBTAB runat="server" id="LDCCheckFraudDBTAB" />
        </div>
    </div>

    <%--Case Close Confirmation--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlCaseCloseConfirmation">Case Close Confirmation</a>
            </h4>
        </div>
        <div id="pnlCaseCloseConfirmation" class="panel-collapse collapse">
            <uc1:LDCCaseCloseConfirmationTAB runat="server" id="LDCCaseCloseConfirmationTAB" />
        </div>
    </div>

    <%--Decision Information TAB--%>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title normal-text-2">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlDecisionInformation">Decision Information</a>
            </h4>
        </div>
        <div id="pnlDecisionInformation" class="panel-collapse collapse">
            <div class="panel-body">
                <uc1:LDCDecisionInformationTAB runat="server" id="LDCDecisionInformationTAB" />
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

