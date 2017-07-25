<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CDCCaseCloseConfirmation.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.CDCCaseCloseConfirmation" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>


<div class="panel-body">

    <div class="row">
        <div class="form-group col-lg-2">
            <label id="lblFruadIdenNoCaseClose" class="normal-text-2">Fraud Identification Number</label>
            <asp:TextBox ID="txtFruadIdenNoCaseClose" runat="server" CssClass="form-control" placeholder="Fraud Identification Number" Style="width: 250px" />

        </div>
        <div class="form-group col-lg-2">
            <label id="lblCardNumberCaseClose" class="normal-text-2">Card Number</label>
            <asp:TextBox ID="txtlCardNumberCaseClose" runat="server" CssClass="form-control" placeholder="Card Number" Style="width: 250px" />
        </div>
        <div class="form-group col-lg-2">
            <label id="lblCustNameCaseClose" class="normal-text-2">Customer Name</label>
            <asp:TextBox ID="txtCustNameCaseClose" runat="server" CssClass="form-control" placeholder="Customer" Style="width: 250px" />
        </div>

    </div>

    <div class="row">
        <hr />
    </div>

    <div class="row">
        <div class="form-group col-lg-2">
            <label id="lblCustomerLiability" class="normal-text-2">Customer Liability<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlCustomerLiability" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCustomerLiability" runat="server" ControlToValidate="ddlCustomerLiability" Display="Dynamic" ErrorMessage="Please select Customer Liability" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />

        </div>
       
        <div class="form-group col-lg-2">
            <label id="lblCustomerLiabilityAmount" class="normal-text-2">Customer Liability Amount<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCustomerLiabilityAmount" runat="server" CssClass="form-control" placeholder="Customer Liability Amount" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCustomerLiabilityAmount" runat="server" ControlToValidate="txtCustomerLiabilityAmount" Display="Dynamic" ErrorMessage="Please Enter Customer Liability Amount" ValidationGroup="vgSave" ForeColor="Red" />
        </div>

        <div class="form-group col-lg-2">
            <label id="lbl" class="normal-text-2">Counterfeit Skimmed Amount<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCounterfeitSkimmedAmount" runat="server" CssClass="form-control" placeholder="Counterfeit Skimmed Amount" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCounterfeitSkimmedAmount" runat="server" ControlToValidate="txtCounterfeitSkimmedAmount" Display="Dynamic" ErrorMessage="Please Enter Counterfeit Skimmed Amount" ValidationGroup="vgSave" ForeColor="Red" />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblInternalProcessError" class="normal-text-2">Internal Process Error<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtInternalProcessError" runat="server" CssClass="form-control" placeholder="Internal Process Error" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvInternalProcessError" runat="server" ControlToValidate="txtInternalProcessError" Display="Dynamic" ErrorMessage="Please Enter Internal Process Error" ValidationGroup="vgSave" ForeColor="Red" />
        </div>

    </div>

    <div class="row">

        <div class="form-group col-lg-2">
            <label id="lblBacktoSource" class="normal-text-2">Back to Source<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtBacktoSource" runat="server" CssClass="form-control" placeholder="Back to Source" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvBacktoSource" runat="server" ControlToValidate="txtBacktoSource" Display="Dynamic" ErrorMessage="Please Enter Back to Source" ValidationGroup="vgSave" ForeColor="Red" />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblChargeBackRaised" class="normal-text-2">Charge Back Raised<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlChargeBackRaised" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvChargeBackRaised" runat="server" ControlToValidate="ddlChargeBackRaised" Display="Dynamic" ErrorMessage="Please select Charge Back Raised" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>

        <div class="form-group col-lg-2">
            <label id="lblChargeBackRaisedDate" class="normal-text-2">Charge Back Raised Date<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtChargeBackRaisedDate" runat="server" CssClass="form-control" placeholder="Charge Back Raised Date" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvChargeBackRaisedDate" runat="server" ControlToValidate="txtChargeBackRaisedDate" Display="Dynamic" ErrorMessage="Please Enter Charge Back Raised Date" ValidationGroup="vgSave" ForeColor="Red" />

        </div>

        <div class="form-group col-lg-2">
            <label id="lblCaseClosedStatus" class="normal-text-2">Case Closed Status<span class="Validatetext">*</span></label>
            <asp:DropDownList ID="ddlCaseClosedStatus" runat="server" CssClass="form-control" Style="width: 250px">
            </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvCaseClosedStatus" runat="server" ControlToValidate="ddlCaseClosedStatus" Display="Dynamic" ErrorMessage="Please select Case Closed Status" ValidationGroup="vgSave" ForeColor="Red" InitialValue="0" />
        </div>
    </div>

    <div class="row">

        <div class="form-group col-lg-2">
            <label id="lblCaseConclusion" class="normal-text-2">Case Conclusion<span class="Validatetext">*</span></label>
            <asp:TextBox ID="txtCaseConclusion" runat="server" CssClass="form-control" placeholder="Case Conclusion" Style="width: 250px" />
            <asp:RequiredFieldValidator ID="rfvCaseConclusion" runat="server" ControlToValidate="txtCaseConclusion" Display="Dynamic" ErrorMessage="Please Enter Case Conclusion" ValidationGroup="vgSave" ForeColor="Red" />
        </div>


    </div>

    <%--<div class="row">

                                        <div class="form-group col-lg-3">

                                            <label id="lblFileUpload" class="normal-text-2">Document</label>
                                            <asp:TextBox ID="txtFileUpload" runat="server" type="file" CssClass="custom-file-input"></asp:TextBox>
                                            <span class="custom-file-control"></span>


                                        </div>

                                    </div>--%>

    <hr />
    <div class="row">

        <div class="form-group col-lg-2">
            <label id="lblFileUpload" style="font-weight: 700">Upload Document</label>
        </div>
        <div class="form-group col-lg-2">
            <%--<asp:AsyncFileUpload ID="btnbrowse" runat="server" OnUploadedComplete="btnbrowse_UploadedComplete" />--%>
            <asp:FileUpload ID="btnDownload" runat="server" AllowMultiple="true" />
            <%--<asp:Button ID="btnAddUploadedFile" runat="server" Text="Add File" OnClick="btnAddUploadedFile_Click" />--%>
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
                            <asp:LinkButton ID="btnDownload" runat="server" CommandArgument='<%#Container.DataItemIndex%>' CommandName="download">Download</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' CommandName="deleteRecord" CssClass="btn btn-danger" />
                            <asp:HiddenField runat="server" ID="hdFullPath" />
                            <asp:HiddenField runat="server" ID="hdCheckFile" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <RowStyle CssClass="normal-text-4" />
                <HeaderStyle CssClass="normal-text-2" />
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <%-- <asp:AsyncPostBackTrigger ControlID="btnAddUploadedFile" EventName="Click" />--%>
            <%--<asp:PostBackTrigger ControlID="grdUploadDoc" />--%>
            <%--<asp:AsyncPostBackTrigger ControlID="grdUploadDoc" EventName="RowCommand" />--%>
        </Triggers>
    </asp:UpdatePanel>
</div>

