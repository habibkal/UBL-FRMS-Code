<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CDCFRMUInternalInformation.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.CDCFRMUInternalInformation" %>

<div class="panel-body">
    <div class="row">
        <div class="form-group col-lg-3">
            <label id="lblDetectionMode" class="normal-text-2" style="width: 250px">Detection Mode<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlDetectionMode" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvDetectionMode" runat="server" ControlToValidate="ddlDetectionMode"  Display="Dynamic"  ErrorMessage="Please select Detection Mode" ValidationGroup="vgSave"  ForeColor="Red" InitialValue=0 />
        </div>
   
        <div class="form-group col-lg-3">
            <label id="lblBlockCode" class="normal-text-2">Block Code<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlBlockCode" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvBlockCode" runat="server" ControlToValidate="ddlBlockCode"  Display="Dynamic"  ErrorMessage="Please select Block Code" ValidationGroup="vgSave"  ForeColor="Red" InitialValue=0 />
        </div>
 
        <div class="form-group col-lg-3">
            <label id="lblBlockCodeDate" class="normal-text-2">Block Code Date<span class="Validatetext">*</span></label>
            <div class="input-group date" data-provide="datepicker">
                <asp:TextBox ID="txtBlockCodeDate" runat="server" CssClass="form-control  datepickercss"/>
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
                <asp:RequiredFieldValidator id="rfvBlockCodeDate" runat="server" ControlToValidate="txtBlockCodeDate" Display="Dynamic" ErrorMessage="Please Enter Block Code Date" ValidationGroup="vgSave"  ForeColor="Red"/>



            </div>
        </div>
    </div>
</div>
