<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCReportingDateTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.LDCReportingDateTAB" %>

<div class="panel-body">
    <div class="row">
        <div class="form-group col-lg-2" >
            <label id="lblDateOfOccurrenceFraud" class="normal-text-2">Date of Occurrence of Fraud</label>
            <asp:TextBox ID="txtDateOfOccurrenceFraud" runat="server" CssClass="form-control" placeholder="Date of Occurrence of Fraud" />

        </div>

        <div class="form-group col-lg-2" >
            <label id="lblDateofDetection" class="normal-text-2">Date of Detection</label>
            <asp:TextBox ID="txtDateofDetection" runat="server" CssClass="form-control" placeholder="Date of Detection" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblDateofAccounting" class="normal-text-2">Date of Accounting</label>
            <asp:TextBox ID="txtDateofAccounting" runat="server" CssClass="form-control" placeholder="Date of Accounting" />
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblDateofreporting" class="normal-text-2">Date of reporting to SBP</label>
            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtDateofreporting" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>

    </div>

    <div class="row">
        <div class="form-group col-lg-2" >
            <label id="lbl15DayReportingDate" class="normal-text-2">15 days reporting to SBP date</label>

            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txt15DayReportingDate" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

            </div>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblCIDAuditDate" class="normal-text-2">Send to CID Audit for investigation Date</label>
            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtCIDAuditDate" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

            </div>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblCompletingInvestigatingDate" class="normal-text-2">Date of Completing of Investigation</label>
            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtCompletingInvestigatingDate" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

            </div>
        </div>

        <div class="form-group col-lg-2" >
            <label id="lblWriteoffDate" class="normal-text-2">Write-off Date</label>
            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtWriteoffDate" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>

            </div>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-lg-2" >
            <label id="lblClosingDate" class="normal-text-2">Date of Closing of Case</label>
            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtClosingDate" runat="server" CssClass="form-control datepickercss" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
</div>
