<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register Tagprefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %> 
<%@ Register Tagprefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCFactsAndFindingTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.LDCFactsAndFindingTAB" %>

<div class="panel-body">
    <div class="row">
        <div class="form-group col-lg-3" >
            <label id="lblMainFindingInternalInq" class="normal-text-2">Main findings of the internal inquiry</label>
            <asp:TextBox ID="txtMainFindingInternalInq" runat="server" CssClass="form-control" placeholder="Main findings of the internal inquiry" />
        </div>
        <div class="form-group col-lg-3" >
            <label id="lblTimeLag" class="normal-text-2">Reason for the time lag</label>
            <asp:TextBox ID="txtTimeLag" runat="server" CssClass="form-control" placeholder="Reason for the time lag" />
        </div>
        <div class="form-group col-lg-3" >
            <label id="lblFStatus" class="normal-text-2">Status</label>
            <asp:DropDownList ID="ddlFStatus" runat="server" CssClass="form-control">
            </asp:DropDownList>
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-3" >
            <label id="lblDetailProgressMadeInQtr" class="normal-text-2">Details of any progress made in the quarter</label>
            <asp:TextBox ID="txtDetailProgressMadeInQtr" runat="server" TextMode="multiline" CssClass="form-control" placeholder="Details of any progress made in the quarter" lines="5" cols="20" Wrap="true" />
        </div>
        <div class="form-group col-lg-3" >
            <label id="lblStepsToAvoidIncidents" class="normal-text-2">Steps taken/to be taken to avoid such incidents in future</label>
            <asp:TextBox ID="txtStepsToAvoidIncidents" runat="server" TextMode="multiline" CssClass="form-control" placeholder="Steps taken/to be taken to avoid such incidents in future" lines="5" cols="20" Wrap="true" />
        </div>
        <div class="form-group col-lg-3" >
            <label id="lblPointOfConsideration" class="normal-text-2">Points for consideration of SBP, if any</label>
            <asp:TextBox ID="txtPointOfConsideration" runat="server" TextMode="multiline" CssClass="form-control" placeholder="Points for consideration of SBP, if any" lines="5" cols="20" Wrap="true"/>
        </div>
    </div>

</div>