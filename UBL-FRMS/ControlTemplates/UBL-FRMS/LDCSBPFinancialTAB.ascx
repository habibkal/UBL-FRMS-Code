<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCSBPFinancialTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.LDCSBPFinancialTAB" %>

<div class="panel-body">

    <div class="row">
        <div class="form-group col-lg-2" >
            <label id="lblAmountInvolved" class="normal-text-2">Amount involved</label>
            <asp:TextBox ID="txtAmountInvolved" runat="server" CssClass="form-control" placeholder="Amount involved" />

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblAdjustmentBfCurrentQtr" class="normal-text-2">Adjustment before Current Quarter</label>
            <asp:TextBox ID="txtAdjustmentBfCurrentQtr" runat="server" CssClass="form-control" placeholder="Adjustment before Current Quarter" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblAdjustmentDuringCurrentQtr" class="normal-text-2">Adjustment during Current Quarter</label>
            <asp:TextBox ID="txtAdjustmentDuringCurrentQtr" runat="server" CssClass="form-control" placeholder="Adjustment during Current Quarter" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblTotalAmountInvolved" class="normal-text-2">Total amount involved</label>
            <asp:TextBox ID="txtTotalAmountInvolved" runat="server" CssClass="form-control" placeholder="Total amount involved" />
        </div>

    </div>

    <div class="row">
        <div class="form-group col-lg-2" >
            <label id="lblPreviousRecoveryFromOtherSource" class="normal-text-2">Previous recovery from other source</label>
            <asp:TextBox ID="txtPreviousRecoveryFromOtherSource" runat="server" CssClass="form-control" placeholder="Previous recovery from other source" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblCurrentRecoveryFromOtherSource" class="normal-text-2">Current recovery from other source</label>
            <asp:TextBox ID="txtCurrentRecoveryFromOtherSource" runat="server" CssClass="form-control" placeholder="Current recovery from other source" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblPreviousRecoveryFromInsurance" class="normal-text-2">Previous recovery from Insurance</label>
            <asp:TextBox ID="txtPreviousRecoveryFromInsurance" runat="server" CssClass="form-control" placeholder="Previous recovery from Insurance"/>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblCurrentRecoveryFromInsurance" class="normal-text-2">Current recovery from Insurance</label>
            <asp:TextBox ID="txtCurrentRecoveryFromInsurance" runat="server" CssClass="form-control" placeholder="Current recovery from Insurance" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-lg-2" >
            <label id="lblTotalRecovery" class="normal-text-2">Total recovery</label>
            <asp:TextBox ID="txtTotalRecovery" runat="server" CssClass="form-control" placeholder="Total recovery" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblDirectWriteOff" class="normal-text-2">Direct write-off</label>
            <asp:TextBox ID="txtDirectWriteOff" runat="server" CssClass="form-control" placeholder="Direct write-off" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblWriteOffAgainstProvision" class="normal-text-2">Write-off against provision</label>
            <asp:TextBox ID="txtWriteOffAgainstProvision" runat="server" CssClass="form-control" placeholder="Write-off against provision"/>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblTotalWriteOffAmount" class="normal-text-2">Total write-off amount</label>
            <asp:TextBox ID="txtTotalWriteOffAmount" runat="server" CssClass="form-control" placeholder="Total write-off amount" />
        </div>

    </div>

    <div class="row">
        <div class="form-group col-lg-2" >
            <label id="lblAmountOutstanding" class="normal-text-2">Amount outstanding</label>
            <asp:TextBox ID="txtAmountOutstanding" runat="server" CssClass="form-control" placeholder="Amount outstanding" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblExpectedRecoveryThroughInsurance" class="normal-text-2">Expected Recovery through Insurance</label>
            <asp:TextBox ID="txtExpectedRecoveryThroughInsurance" runat="server" CssClass="form-control" placeholder="Expected Recovery through Insurance"/>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblExpectedRecoveryThroughOtherSources" class="normal-text-2">Expected Recovery through Other Sources</label>
            <asp:TextBox ID="txtExpectedRecoveryThroughOtherSources" runat="server" CssClass="form-control" placeholder="Expected Recovery through Other Sources" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblProvisionBfCurrentQtr" class="normal-text-2">Provision before Current Quarter</label>
            <asp:TextBox ID="txtProvisionBfCurrentQtr" runat="server" CssClass="form-control" placeholder="Provision before Current Quarter" />
        </div>

    </div>

    <div class="row">
        <div class="form-group col-lg-2" >
            <label id="lblProvisionDuringCurrentQtr" class="normal-text-2">Provision During Current Quarter</label>
            <asp:TextBox ID="txtProvisionDuringCurrentQtr" runat="server" CssClass="form-control" placeholder="Provision During Current Quarter" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblTotalProvision" class="normal-text-2">Total Provision</label>
            <asp:TextBox ID="txtTotalProvision" runat="server" CssClass="form-control" placeholder="Total Provision" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblNetAmount" class="normal-text-2">Net amount</label>
            <asp:TextBox ID="txtNetAmount" runat="server" CssClass="form-control" placeholder="Net amount" />
        </div>
    </div>
</div>
