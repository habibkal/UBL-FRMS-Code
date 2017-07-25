<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCCaseBriefingTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.LDCCaseBriefingTAB" %>

<div class="panel-body">
    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblApplicationID" class="normal-text-2">Application ID<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtApplicationID" runat="server" CssClass="form-control" placeholder="Application ID" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvApplicationID" runat="server" ControlToValidate="txtApplicationID" Display="Dynamic" ErrorMessage="Please Enter Application ID" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

         <div class="form-group col-lg-2" >
            <label id="lblApplicationDecisionDate" class="normal-text-2">Application Decision Date<span class="Validatetext">*</span></label>

            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtApplicationDecisionDate" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

            </div>
            <asp:RequiredFieldValidator ID="rfvApplicationDecisionDate" runat="server" ControlToValidate="txtApplicationDecisionDate" Display="Dynamic" ErrorMessage="Please Enter Application Decision Date" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

         <div class="form-group col-lg-2" >
            <label id="lblApplicationReceiveDate" class="normal-text-2">Application Receive Date<span class="Validatetext">*</span></label>

            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtApplicationReceiveDate" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

            </div>
            <asp:RequiredFieldValidator ID="rfvApplicationReceiveDate" runat="server" ControlToValidate="txtApplicationReceiveDate" Display="Dynamic" ErrorMessage="Please Enter Application Receive Date" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblProduct" class="normal-text-2">Product<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlProduct" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvProduct" runat="server" ControlToValidate="ddlProduct" Display="Dynamic" ErrorMessage="Please select Product" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblApplicantName" class="normal-text-2">Applicant Name<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtApplicantName" runat="server" CssClass="form-control" placeholder="Applicant Name" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvApplicantName" runat="server" ControlToValidate="txtApplicantName" Display="Dynamic" ErrorMessage="Please Enter Applicant Name" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblApplicantMotherMaidenName" class="normal-text-2">Applicant Mother/ Maiden Name<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtApplicantMotherMaidenName" runat="server" CssClass="form-control" placeholder="Applicant Mother/ Maiden Name" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvApplicantMotherMaidenName" runat="server" ControlToValidate="txtApplicantMotherMaidenName" Display="Dynamic" ErrorMessage="Please Enter Applicant Mother/ Maiden Name" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblCNIC" class="normal-text-2">CNIC<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCNIC" runat="server" CssClass="form-control" placeholder="CNIC" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCNIC" runat="server" ControlToValidate="txtCNIC" Display="Dynamic" ErrorMessage="Please Enter CNIC" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group col-lg-2" >
            <label id="lbl" class="normal-text-2">NIC</label>
            <asp:TextBox ID="txtNIC" runat="server" CssClass="form-control" placeholder="NIC" Style="width: 250px" />
        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblCNICExpiryDate" class="normal-text-2">CNIC Expiry Date</label>
            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtCNICExpiryDate" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

            </div>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblRegion" class="normal-text-2">Region<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlRegion" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvRegion" runat="server" ControlToValidate="ddlRegion" Display="Dynamic" ErrorMessage="Please select Region" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblCity" class="normal-text-2">City<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="ddlCity" Display="Dynamic" ErrorMessage="Please select City" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblSource" class="normal-text-2">Source<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlSource" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvSource" runat="server" ControlToValidate="ddlSource" Display="Dynamic" ErrorMessage="Please select Source" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />

        </div>

    </div>


    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblUnderwritingLimitSigner" class="normal-text-2">Underwriting Limit Signer</label>
            <asp:TextBox ID="txtUnderwritingLimitSigner" runat="server" CssClass="form-control" placeholder="Underwriting Limit Signer" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblRHQAnalyst" class="normal-text-2">RHQ Analyst</label>
            <asp:TextBox ID="txtRHQAnalyst" runat="server" CssClass="form-control" placeholder="RHQ Analyst" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblSEName" class="normal-text-2">SE Name<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtSEName" runat="server" CssClass="form-control" placeholder="SE Name" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvSEName" runat="server" ControlToValidate="txtSEName" Display="Dynamic" ErrorMessage="Please Enter SE Name" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblBranchName" class="normal-text-2">Branch Name<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtBranchName" runat="server" CssClass="form-control" placeholder="Branch Name" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvBranchName" runat="server" ControlToValidate="txtBranchName" Display="Dynamic" ErrorMessage="Please Enter Branch Name" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblBranchCode" class="normal-text-2">Branch Code<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtBranchCode" runat="server" CssClass="form-control" placeholder="Branch Code" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvBranchCode" runat="server" ControlToValidate="txtBranchCode" Display="Dynamic" ErrorMessage="Please Enter Branch Code" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblVOCode" class="normal-text-2">VO Code<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtVOCode" runat="server" CssClass="form-control" placeholder="VO Code" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvVOCode" runat="server" ControlToValidate="txtVOCode" Display="Dynamic" ErrorMessage="Please Enter VO Code" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblVOName" class="normal-text-2">VO Name<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtVOName" runat="server" CssClass="form-control" placeholder="VO Name" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvVOName" runat="server" ControlToValidate="txtVOName" Display="Dynamic" ErrorMessage="Please Enter VO Name" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblCVOName" class="normal-text-2">CVO Name<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCVOName" runat="server" CssClass="form-control" placeholder="CVO Name" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCVOName" runat="server" ControlToValidate="txtCVOName" Display="Dynamic" ErrorMessage="Please Enter CVO Name" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblCrossVOCode" class="normal-text-2">Cross VO Code<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCrossVOCode" runat="server" CssClass="form-control" placeholder="Cross VO Code" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCrossVOCode" runat="server" ControlToValidate="txtCrossVOCode" Display="Dynamic" ErrorMessage="Please Enter Cross VO Code" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblInvestigationOfficer" class="normal-text-2">Investigation Officer<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlInvestigationOfficer" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvInvestigationOfficer" runat="server" ControlToValidate="ddlInvestigationOfficer" Display="Dynamic" ErrorMessage="Please select Investigation Officer" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblSegment" class="normal-text-2">Segment<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlSegment" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvSegment" runat="server" ControlToValidate="ddlSegment" Display="Dynamic" ErrorMessage="Please select Segment" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblMonth" class="normal-text-2">Month<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" placeholder="Month" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvMonth" runat="server" ControlToValidate="txtMonth" Display="Dynamic" ErrorMessage="Please Enter Month" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>

        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblQuarter" class="normal-text-2">Quarter<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtQuarter" runat="server" CssClass="form-control" placeholder="Quarter" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvQuarter" runat="server" ControlToValidate="txtQuarter" Display="Dynamic" ErrorMessage="Please Enter Quarter" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

    </div>

</div>
