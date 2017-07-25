<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCApplicationDetailTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.LDCApplicationDetailTAB" %>


<div class="panel-body">

    <div class="row">

        <div class="form-group col-lg-2">
            <label id="lblApprovedLimit" class="normal-text-2">Approved Limit<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtApprovedLimit" runat="server" CssClass="form-control" placeholder="Approved Limit" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvApprovedLimit" runat="server" ControlToValidate="txtApprovedLimit" Display="Dynamic" ErrorMessage="Please Enter Approved Limit" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group col-lg-2">
            <label id="lblDateofBirth" class="normal-text-2">Date of Birth</label>
            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtDateofBirth" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

            </div>
        </div>

        <div class="form-group col-lg-2">
            <label id="lblIncome" class="normal-text-2">Income</label>
            <asp:TextBox ID="txtIncome" runat="server" CssClass="form-control" placeholder="Income" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblEmployeeDesignation" class="normal-text-2">Employee Designation<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlEmployeeDesignation" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvEmployeeDesignation" runat="server" ControlToValidate="ddlEmployeeDesignation" Display="Dynamic" ErrorMessage="Please select Employee Designation" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2">
            <label id="lblEducationLevel" class="normal-text-2">Education Level</label>
            <asp:TextBox ID="txtEducationLevel" runat="server" CssClass="form-control" placeholder="Education Level" Style="width: 250px" />

        </div>

        <div class="form-group col-lg-2">
            <label id="lblAge" class="normal-text-2">Age</label>
            <asp:TextBox ID="txtAge" runat="server" CssClass="form-control" placeholder="Age" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblBusinessType" class="normal-text-2">Business Type</label>
            <asp:TextBox ID="txtBusinessType" runat="server" CssClass="form-control" placeholder="Business Type" Style="width: 250px" />

        </div>

        <div class="form-group col-lg-2">
            <label id="lblCoBorrowerName" class="normal-text-2">Co-Borrower Name</label>
            <asp:TextBox ID="txtCoBorrowerName" runat="server" CssClass="form-control" placeholder="Co-Borrower Name" Style="width: 250px" />
        </div>
    </div>

    <div class="row">

        <div class="form-group col-lg-2">
            <label id="lblCoBorrowerCNIC" class="normal-text-2">Co-Borrower CNIC</label>
            <asp:TextBox ID="txtCoBorrowerCNIC" runat="server" CssClass="form-control" placeholder="Co-Borrower CNIC" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblRelationshipwithCoBorrower" class="normal-text-2">Relationship with Co-Borrower</label>
            <asp:DropDownList ID="ddlRelationshipwithCoBorrower" runat="server" CssClass="form-control" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblCompanyName" class="normal-text-2">Company Name<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" placeholder="Company Name" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" ControlToValidate="txtCompanyName" Display="Dynamic" ErrorMessage="Please Enter Company Name" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group col-lg-2">
            <label id="lblDepartmentName" class="normal-text-2">Department Name</label>
            <asp:TextBox ID="txtDepartmentName" runat="server" CssClass="form-control" placeholder="Department Name" Style="width: 250px" />
        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2">
            <label id="lblApplicantOfficeAddress" class="normal-text-2">Applicant Office Address<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtApplicantOfficeAddress" runat="server" CssClass="form-control" placeholder="Applicant Office Address" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvApplicantOfficeAddress" runat="server" ControlToValidate="txtApplicantOfficeAddress" Display="Dynamic" ErrorMessage="Please Enter Applicant Office Address" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblApplicantOfficeNumber" class="normal-text-2">Applicant Office Number</label>
            <asp:TextBox ID="txtApplicantOfficeNumber" runat="server" CssClass="form-control" placeholder="Applicant Office Number" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblApplicantResidenceAddress" class="normal-text-2">Applicant Residence Address<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtApplicantResidenceAddress" runat="server" CssClass="form-control" placeholder="Applicant Residence Address" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvApplicantResidenceAddress" runat="server" ControlToValidate="txtApplicantResidenceAddress" Display="Dynamic" ErrorMessage="Please Enter Applicant Residence Address" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblApplicantMobileNumber" class="normal-text-2">Applicant Mobile Number<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtApplicantMobileNumber" runat="server" CssClass="form-control" placeholder="Applicant Mobile Number" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvApplicantMobileNumber" runat="server" ControlToValidate="txtApplicantMobileNumber" Display="Dynamic" ErrorMessage="Please Enter Applicant Mobile Number" ValidationGroup="vgSave" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblReferenceName" class="normal-text-2">Reference Name</label>
            <asp:TextBox ID="txtReferenceName" runat="server" CssClass="form-control" placeholder="Reference Name" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblReferenceContact" class="normal-text-2">Reference Contact</label>
            <asp:TextBox ID="txtReferenceContact" runat="server" CssClass="form-control" placeholder="Reference Contact" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2" >

            <label id="lblDocumentsProvided" class="normal-text-2">Documents Provided</label>
            <asp:TextBox ID="txtDocumentsProvided" runat="server" CssClass="form-control" placeholder="Documents Provided" Style="width: 250px" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblDeviation" class="normal-text-2">Deviation<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlDeviation" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvDeviation" runat="server" ControlToValidate="ddlDeviation" Display="Dynamic" ErrorMessage="Please select Deviation" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2" >
            <label id="lblDecision" class="normal-text-2">Decision<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlDecision" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvDecision" runat="server" ControlToValidate="ddlDecision" Display="Dynamic" ErrorMessage="Please select Decision" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblDiscrepancy" class="normal-text-2">Discrepancy<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlDiscrepancy" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvDiscrepancy" runat="server" ControlToValidate="ddlDiscrepancy" Display="Dynamic" ErrorMessage="Please select Discrepancy" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>

    </div>
</div>
