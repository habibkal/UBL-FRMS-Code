<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCCaseCloseConfirmationTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.LDCCaseCloseConfirmationTAB" %>

<div class="panel-body">
    <div class="row">
        <div class="form-group col-lg-3">
            <label id="lblCaseRemarks" class="normal-text-2">Case Remarks<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlCaseRemarks" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCaseRemarks" runat="server" ControlToValidate="ddlCaseRemarks" Display="Dynamic" ErrorMessage="Please select Case Remarks" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>
        <div class="form-group col-lg-3">
            <label id="lblInvolvement" class="normal-text-2">Involvement<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlInvolvement" runat="server" CssClass="form-control" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvInvolvement" runat="server" ControlToValidate="ddlInvolvement" Display="Dynamic" ErrorMessage="Please select Involvement" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>
    </div>
    <div class="row">
        <div class="form-group col-lg-3">
            <label id="lblReason" class="normal-text-2">Reason<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtReason" runat="server" TextMode="multiline" CssClass="form-control" placeholder="Reason" Rows="5" Wrap="true" />
            <asp:RequiredFieldValidator ID="rfvReason" runat="server" ControlToValidate="txtReason" Display="Dynamic" ErrorMessage="Please Enter Reason" ValidationGroup="vgCaseCommentSave" ForeColor="Red" />
        </div>
        <div class="form-group col-lg-3">
            <label id="lblDecision" class="normal-text-2">Decision<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtDecision" runat="server" TextMode="multiline" CssClass="form-control" placeholder="Decision" Rows="5" Wrap="true" />
            <asp:RequiredFieldValidator ID="rfvDecision" runat="server" ControlToValidate="txtDecision" Display="Dynamic" ErrorMessage="Please Enter Decision" ValidationGroup="vgCaseCommentSave" ForeColor="Red" />
        </div>
    </div>

    <hr />

    <div class="row">

        <div class="form-group col-lg-2">
            <label id="lblFileUpload" style="font-weight: 700">Upload Document</label>
        </div>
        <div class="form-group col-lg-2">
            <asp:FileUpload ID="btnDownload" runat="server" AllowMultiple="true" />
        </div>

    </div>
    <asp:UpdatePanel ID="upUploadDocument" runat="server">
        <ContentTemplate>
            <asp:GridView ID="grdUploadDoc" runat="server" class="table table-striped table-bordered table-hover table-highlight table-checkable"
                OnRowCommand="grdUploadDoc_RowCommand" AutoGenerateColumns="false" EmptyDataText="No Records" ShowHeaderWhenEmpty="True">
                <Columns>
                    <asp:BoundField DataField="DocumentTitle" HeaderText="Document Title" />
                    <asp:BoundField DataField="UploadedTime" HeaderText="Uploaded Time" />
                    <asp:BoundField DataField="UploadedBy" HeaderText="Uploaded By" />

                    <asp:TemplateField HeaderText="Download">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDownload" runat="server" Text="Download" CommandArgument='<%#Container.DataItemIndex%>' CommandName="download" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' CommandName="deleteRecord" CssClass="btn btn-danger" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="normal-text-4" />
                <HeaderStyle CssClass="normal-text-2" />
            </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<div class="row">
</div>
