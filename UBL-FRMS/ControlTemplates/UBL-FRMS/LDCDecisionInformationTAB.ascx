<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCDecisionInformationTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.LDCDecisionInformationTAB" %>
<div class="panel-body">
    <div class="row">
        <div class="form-group" style="width: 250px">
            <label id="lblCardType" class="normal-text-2">Case Status <span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlCaseStatus" runat="server" CssClass="form-control">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCaseStatus" runat="server" ControlToValidate="ddlCaseStatus" Display="Dynamic" ErrorMessage="Please select Case Status" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>
    </div>
    <div class="row">
        <div class="form-group" style="width: 370px">
            <label id="lblCaseComments" class="normal-text-2">Remarks <span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtRemarks" runat="server" TextMode="multiline" CssClass="form-control" placeholder="Enter the remarks" lines="5" cols="20" Wrap="true" />
            <asp:RequiredFieldValidator ID="rfvRemarks" runat="server" ControlToValidate="txtRemarks" Display="Dynamic" ErrorMessage="Please Enter Remarks" ValidationGroup="vgSave" ForeColor="Red" />
        </div>
    </div>
</div>
