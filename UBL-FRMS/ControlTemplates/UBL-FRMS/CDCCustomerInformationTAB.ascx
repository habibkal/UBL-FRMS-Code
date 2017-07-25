<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CDCCustomerInformationTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.CDCCustomerInformationTAB" %>

<div class="panel-body">
    <div class="row">
        <div class="form-group col-lg-2">
            <label id="lblCardType" class="normal-text-2">Card Type<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlCardType" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCardType" runat="server" ControlToValidate="ddlCardType"  Display="Dynamic"  ErrorMessage="Please select Card Type" ValidationGroup="vgSave"  ForeColor="Red" InitialValue=0 />
        </div>
      
        <div class="form-group col-lg-2">
            <label id="lblCardNumber" class="normal-text-2">Card Number<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCardNumber" runat="server" CssClass="form-control" placeholder="Card Number" Style="width: 250px" />
            <asp:RequiredFieldValidator id="rfvCardNumber" runat="server" ControlToValidate="txtCardNumber" Display="Dynamic" ErrorMessage="Please Enter Card Number" ValidationGroup="vgSave"  ForeColor="Red"></asp:RequiredFieldValidator>

        </div>
 
        <div class="form-group col-lg-2">
            <label id="lblCustomerName" class="normal-text-2">Customer Name <span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCustomerName" runat="server" CssClass="form-control" placeholder="Customer Name" Style="width: 250px" />
            <asp:RequiredFieldValidator id="rfvCustomerName" runat="server" ControlToValidate="txtCustomerName" Display="Dynamic" ErrorMessage="Please Enter Customer Name" ValidationGroup="vgSave"  ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group col-lg-2">
            <label id="lblRegion" class="normal-text-2">Region <span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlRegion" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvRegion" runat="server" ControlToValidate="ddlRegion"  Display="Dynamic"  ErrorMessage="Please select Region" ValidationGroup="vgSave"  ForeColor="Red" InitialValue=0 />

        </div>
    </div>

    <div class="row">
        <div class="form-group col-lg-2">
            <label id="lblCity" class="normal-text-2">City <span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCity" runat="server" ControlToValidate="ddlCity"  Display="Dynamic"  ErrorMessage="Please select City" ValidationGroup="vgSave"  ForeColor="Red" InitialValue=0 />

        </div>
 
        <div class="form-group col-lg-2">
            <label id="lblFraudTypeCode" class="normal-text-2">Fraud Type Code <span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlFraudTypeCode" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvFraudTypeCode" runat="server" ControlToValidate="ddlFraudTypeCode"  Display="Dynamic"  ErrorMessage="Please select Fraud Type Code" ValidationGroup="vgSave"  ForeColor="Red" InitialValue=0 />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblFraudIncidence" class="normal-text-2">Fraud Incidence <span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlFraudIncidence" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvFraudIncidence" runat="server" ControlToValidate="ddlFraudIncidence"  Display="Dynamic"  ErrorMessage="Please select Fraud Incidence" ValidationGroup="vgSave"  ForeColor="Red" InitialValue=0 />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblPotentialSaving" class="normal-text-2">Potential Saving <span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtPotentialSaving" runat="server" CssClass="form-control" placeholder="Potential Saving" Style="width: 250px" />
            <asp:RequiredFieldValidator id="rfvPotentialSaving" runat="server" ControlToValidate="txtPotentialSaving" Display="Dynamic" ErrorMessage="Please Enter Potential Saving" ValidationGroup="vgSave"  ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-lg-2">
            <label id="lblMonth"class="normal-text-2">Month <span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtMonth" runat="server" CssClass="form-control" placeholder="Month" Style="width: 250px" />
            <asp:RequiredFieldValidator id="rfvMonth" runat="server" ControlToValidate="txtMonth" Display="Dynamic" ErrorMessage="Please Enter Month" ValidationGroup="vgSave"  ForeColor="Red"></asp:RequiredFieldValidator>
        </div>

        <div class="form-group col-lg-2">
            <label id="lblQuarter" class="normal-text-2">Quarter <span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtQuarter" runat="server" CssClass="form-control" placeholder="Quarter" Style="width: 250px" />
            <asp:RequiredFieldValidator id="rfvQuarter" runat="server" ControlToValidate="txtQuarter" Display="Dynamic" ErrorMessage="Please Enter Quarter" ValidationGroup="vgSave"  ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
    </div>
</div>
