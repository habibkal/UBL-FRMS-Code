<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CDCTransactionTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.CDCTransactionTAB" %>

<script type="text/javascript">
    function TranClosePopup() {
        if (Page_ClientValidate('vgTranSave')) {
            $('#AddTransaction').modal('hide');
        }

    }
    function TranShowPopup() {
        $('#AddTransaction').modal('show');
    }
</script>


<div class="panel-body">

    <asp:Button ID="btnAddTrans" runat="server" Text="Add Transaction" CssClass="btn btn-info btn-md" OnClientClick="TranShowPopup();" OnClick="btnAddTrans_Click" />

    <div class="modal fade" id="AddTransaction" role="dialog">
        <div class="modal-dialog  modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Transaction</h4>
                </div>
                <asp:UpdatePanel ID="upTransModal" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">

                            <div class="row">
                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionStatus" class="normal-text-2">Transaction Status<span class="Validatetext">*</span></label>
                                    <asp:DropDownList ID="ddlTransactionStatus" runat="server" CssClass="form-control" Style="width: 250px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvTransactionStatus" runat="server" ControlToValidate="ddlTransactionStatus" Display="Dynamic" ErrorMessage="Please select Transaction Status" ValidationGroup="vgTranSave" ForeColor="Red" InitialValue="0" />

                                </div>

                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionDate" class="normal-text-2">Transaction Date<span class="Validatetext">*</span></label>
                                    <div class="input-group date" data-provide="datepicker-inline">
                                        <asp:TextBox ID="txtTransactionDate" runat="server" CssClass="form-control datepickercss" Style="width: 212px; z-index: 1050" />
                                        <asp:RequiredFieldValidator ID="rfvTransactionDate" runat="server" ControlToValidate="txtTransactionDate" Display="Dynamic" ErrorMessage="Please Select Transaction Date" ValidationGroup="vgTranSave" ForeColor="Red" />
                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>
                                    </div>
                                </div>

                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionTime" class="normal-text-2">Transaction Time<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtTransactionTime" runat="server" CssClass="form-control" placeholder="Transaction Time" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvTransactionTime" runat="server" ControlToValidate="txtTransactionTime" Display="Dynamic" ErrorMessage="Please Enter Transaction Time" ValidationGroup="vgTranSave" ForeColor="Red" />
                                </div>


                            </div>
                            <div class="row">
                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionAmount" class="normal-text-2">Transaction Amount (PKR)<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtTransactionAmount" runat="server" CssClass="form-control" placeholder="Transaction Amount (PKR)" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvTransactionAmount" runat="server" ControlToValidate="txtTransactionAmount" Display="Dynamic" ErrorMessage="Please Enter Transaction Amount" ValidationGroup="vgTranSave" ForeColor="Red" />
                                </div>
                               
                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionBaseAmount" class="normal-text-2">Trans. Base Amount<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtTransactionBaseAmount" runat="server" CssClass="form-control" placeholder="Transaction Base Amount" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvTransactionBaseAmount" runat="server" ControlToValidate="txtTransactionBaseAmount" Display="Dynamic" ErrorMessage="Please Enter Transaction Base Amount" ValidationGroup="vgTranSave" ForeColor="Red" />
                                </div>
                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionBaseCurrency" class="normal-text-2" style="width: 250px">Trans. Base Currency<span class="Validatetext">*</span></label>
                                    <asp:DropDownList ID="ddlTransactionBaseCurrency" runat="server" CssClass="form-control" Style="width: 250px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvTransactionBaseCurrency" runat="server" ControlToValidate="ddlTransactionBaseCurrency" Display="Dynamic" ErrorMessage="Please select Transaction Base Currency" ValidationGroup="vgTranSave" ForeColor="Red" InitialValue="0" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionCountry" class="normal-text-2">Transaction Country<span class="Validatetext">*</span></label>
                                    <asp:DropDownList ID="ddlTransactionCountry" runat="server" CssClass="form-control" Style="width: 250px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvTransactionCountry" runat="server" ControlToValidate="ddlTransactionCountry" Display="Dynamic" ErrorMessage="Please select Transaction Country" ValidationGroup="vgTranSave" ForeColor="Red" InitialValue="0" />
                                </div>
   
                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionApprovalCode" class="normal-text-2">Transaction Approval Code<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtTransactionApprovalCode" runat="server" CssClass="form-control" placeholder="Transaction Approval Code" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvTransactionApprovalCode" runat="server" ControlToValidate="txtTransactionApprovalCode" Display="Dynamic" ErrorMessage="Please Enter Transaction Approval Code" ValidationGroup="vgTranSave" ForeColor="Red" />
                                </div>

                                <div class="form-group col-lg-2">
                                    <label id="lblTransactionApprovalMode" class="normal-text-2">Trans. Approval Mode<span class="Validatetext">*</span></label>
                                    <asp:DropDownList ID="ddlTransactionApprovalMode" runat="server" CssClass="form-control" Style="width: 250px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvTransactionApprovalMode" runat="server" ControlToValidate="ddlTransactionApprovalMode" Display="Dynamic" ErrorMessage="Please select Transaction Approval Mode" ValidationGroup="vgTranSave" ForeColor="Red" InitialValue="0" />
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-lg-2">
                                    <label id="lblMerchantNumber" class="normal-text-2">Merchant Number<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtMerchantNumber" runat="server" CssClass="form-control" placeholder="Merchant Number" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvMerchantNumber" runat="server" ControlToValidate="txtMerchantNumber" Display="Dynamic" ErrorMessage="Please Enter Merchant Number" ValidationGroup="vgTranSave" ForeColor="Red" />
                                </div>
  
                                <div class="form-group col-lg-2">
                                    <label id="lblMerchantName" class="normal-text-2">Merchant Name<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtMerchantName" runat="server" CssClass="form-control" placeholder="Merchant Name" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvMerchantName" runat="server" ControlToValidate="txtMerchantName" Display="Dynamic" ErrorMessage="Please Enter Merchant Name" ValidationGroup="vgTranSave" ForeColor="Red" />
                                </div>

                                <div class="form-group col-lg-2">
                                    <label id="lblMerchantCity" class="normal-text-2">Merchant City<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtMerchantCity" runat="server" CssClass="form-control" placeholder="Merchant City" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvMerchantCity" runat="server" ControlToValidate="txtMerchantCity" Display="Dynamic" ErrorMessage="Please Enter Merchant City" ValidationGroup="vgTranSave" ForeColor="Red" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-lg-2">
                                    <label id="lblMCC" class="normal-text-2" style="width: 250px">MCC<span class="Validatetext">*</span></label>
                                    <asp:DropDownList ID="ddlMCC" runat="server" CssClass="form-control" Style="width: 250px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvMCC" runat="server" ControlToValidate="ddlMCC" Display="Dynamic" ErrorMessage="Please select MCC" ValidationGroup="vgTranSave" ForeColor="Red" InitialValue="0" />
                                </div>


                                <div class="form-group col-lg-2">
                                    <label id="lblAcquiringBIN" class="normal-text-2">Acquiring BIN<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtAcquiringBIN" runat="server" CssClass="form-control" placeholder="Acquiring BIN" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvAcquiringBIN" runat="server" ControlToValidate="txtAcquiringBIN" Display="Dynamic" ErrorMessage="Please Enter Acquiring BIN" ValidationGroup="vgTranSave" ForeColor="Red" />

                                </div>
                        
                                <div class="form-group col-lg-2">
                                    <label id="lblUFL" class="normal-text-2">UFL<span class="Validatetext">*</span></label>
                                    <asp:DropDownList ID="ddlUFL" runat="server" CssClass="form-control" Style="width: 250px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvUFL" runat="server" ControlToValidate="ddlUFL" Display="Dynamic" ErrorMessage="Please select UFL" ValidationGroup="vgTranSave" ForeColor="Red" InitialValue="0" />
                                </div>

                            </div>

                            <div class="row">


                                <div class="form-group col-lg-2">
                                    <label id="lblSAFE" class="normal-text-2">TC40/SAFE<span class="Validatetext">*</span></label>
                                    <asp:DropDownList ID="ddlTransSAFE" runat="server" CssClass="form-control" Style="width: 250px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvTransSAFE" runat="server" ControlToValidate="ddlTransSAFE" Display="Dynamic" ErrorMessage="Please select TC40/SAFE" ValidationGroup="vgTranSave" ForeColor="Red" InitialValue="0" />
                                </div>
                  

                                <div class="form-group col-lg-2">
                                    <label id="lblSAFEDate" class="normal-text-2">TC40/SAFE Date<span class="Validatetext">*</span></label>

                                    <div class="input-group date" data-provide="datepicker">
                                        <asp:TextBox ID="txtTransSAFEDate" runat="server" CssClass="form-control datepickercss" Style="width: 212px; z-index: 1050" />
                                        <asp:RequiredFieldValidator ID="rfvSAFEDate" runat="server" ControlToValidate="txtTransSAFEDate" Display="Dynamic" ErrorMessage="Please Enter TC40/SAFE Date" ValidationGroup="vgTranSave" ForeColor="Red" />

                                        <span class="input-group-addon">
                                            <span class="glyphicon glyphicon-calendar"></span>
                                        </span>

                                    </div>

                                </div>

                            </div>


                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnTranscSave" runat="server" Text="Save" class="btn btn-info btn-md" OnClick="btnTranscSave_Click" ValidationGroup="vgTranSave" OnClientClick="TranClosePopup();" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <%--<asp:AsyncPostBackTrigger ControlID="grdStaffDetails" EventName="RowCommand" />--%>
                        <asp:AsyncPostBackTrigger ControlID="btnTranscSave" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>

    <hr />

    <div class="panel-group" id="accordion2">
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title normal-text-2">
                    <a data-toggle="collapse" data-parent="#accordion2" href="#pnlApprovedTransaction">Approved Transaction Details</a>
                </h4>
            </div>

            <div id="pnlApprovedTransaction" class="panel-collapse collapse ">
                <div class="panel-body">
                    <div class="row">
                        <asp:UpdatePanel ID="upTransApproved" runat="server">
                            <ContentTemplate>
                                <div style="overflow-x: auto; width: auto">
                                    <asp:GridView ID="grdApproved" runat="server" class="table-responsive table table-striped table-bordered table-hover table-highlight table-checkable"
                                        OnRowCommand="grdApproved_RowCommand" AutoGenerateColumns="false" EmptyDataText="No Records" ShowHeaderWhenEmpty="True">
                                        <Columns>
                                            <asp:BoundField DataField="TransDate" HeaderText="Trans. Date" />
                                            <asp:BoundField DataField="TransTime" HeaderText="Trans. Time" />
                                            <asp:BoundField DataField="TransAmount" HeaderText="Trans. Amount" />
                                            <asp:BoundField DataField="TransactionBaseAmount" HeaderText="Transaction Base Amount" />
                                            <asp:BoundField DataField="TransactionBaseCurrency" HeaderText="Transaction Base Currency" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" />
                                            <asp:BoundField DataField="ApprovalCode" HeaderText="Approval Code" />
                                            <asp:BoundField DataField="ApprovalMode" HeaderText="Approval Mode" />
                                            <asp:BoundField DataField="MerchantNumber" HeaderText="Merchant Number" />
                                            <asp:BoundField DataField="MerchantName" HeaderText="Merchant Name" />
                                            <asp:BoundField DataField="MerchantCity" HeaderText="Merchant City" />
                                            <asp:BoundField DataField="MCC" HeaderText="MCC" />
                                            <asp:BoundField DataField="AcquiringBIN" HeaderText="Acquiring BIN" />
                                            <asp:BoundField DataField="TC40SAFE" HeaderText="TC40 SAFE" />
                                            <asp:BoundField DataField="TC40Date" HeaderText="TC40 Date" />
                                            <asp:BoundField DataField="UFL" HeaderText="UFL" />
                                            <%--<asp:BoundField DataField="Total" HeaderText="Total" />--%>


                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="editRecord" CssClass="btn btn-defualt" OnClientClick="TranShowPopup();" />
                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' CommandName="deleteRecord" CssClass="btn btn-danger" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="normal-text-4" />
                                        <HeaderStyle CssClass="normal-text-2" />

                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddTrans" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>


        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title normal-text-2">
                    <a data-toggle="collapse" data-parent="#accordion2" href="#pnlDeclinedTransaction">Declined Transaction Details</a>
                </h4>
            </div>

            <div id="pnlDeclinedTransaction" class="panel-collapse collapse ">
                <div class="panel-body">
                    <div class="row">
                        <asp:UpdatePanel ID="upTransDeclined" runat="server">
                            <ContentTemplate>
                                <div style="overflow-x: auto; width: auto">
                                    <asp:GridView ID="grdDeclined" runat="server" class="table-responsive table table-striped table-bordered table-hover table-highlight table-checkable"
                                        OnRowCommand="grdDeclined_RowCommand" AutoGenerateColumns="false" EmptyDataText="No Records" ShowHeaderWhenEmpty="True">
                                        <Columns>
                                            <asp:BoundField DataField="TransDate" HeaderText="Trans. Date" />
                                            <asp:BoundField DataField="TransTime" HeaderText="Trans. Time" />
                                            <asp:BoundField DataField="TransAmount" HeaderText="Trans. Amount" />
                                            <asp:BoundField DataField="TransactionBaseAmount" HeaderText="Transaction Base Amount" />
                                            <asp:BoundField DataField="TransactionBaseCurrency" HeaderText="Transaction Base Currency" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" />
                                            <asp:BoundField DataField="ApprovalCode" HeaderText="Approval Code" />
                                            <asp:BoundField DataField="ApprovalMode" HeaderText="Approval Mode" />
                                            <asp:BoundField DataField="MerchantNumber" HeaderText="Merchant Number" />
                                            <asp:BoundField DataField="MerchantName" HeaderText="Merchant Name" />
                                            <asp:BoundField DataField="MerchantCity" HeaderText="Merchant City" />
                                            <asp:BoundField DataField="MCC" HeaderText="MCC" />
                                            <asp:BoundField DataField="AcquiringBIN" HeaderText="Acquiring BIN" />
                                            <asp:BoundField DataField="TC40SAFE" HeaderText="TC40 SAFE" />
                                            <asp:BoundField DataField="TC40Date" HeaderText="TC40 Date" />
                                            <asp:BoundField DataField="UFL" HeaderText="UFL" />
                                            <%--<asp:BoundField DataField="Total" HeaderText="Total" />--%>
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="editRecord" CssClass="btn btn-defualt" OnClientClick="TranShowPopup();" />
                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' CommandName="deleteRecord" CssClass="btn btn-danger" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="normal-text-4" />
                                        <HeaderStyle CssClass="normal-text-2" />

                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddTrans" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>


        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title normal-text-2">
                    <a data-toggle="collapse" data-parent="#accordion2" href="#pnlRejectedTransaction">Rejected Transaction Details</a>
                </h4>
            </div>

            <div id="pnlRejectedTransaction" class="panel-collapse collapse ">
                <div class="panel-body">
                    <div class="row">
                        <asp:UpdatePanel ID="upTransRejected" runat="server">
                            <ContentTemplate>
                                <div style="overflow-x: auto; width: auto">
                                    <asp:GridView ID="grdRejected" runat="server" class="table-responsive table table-striped table-bordered table-hover table-highlight table-checkable"
                                        OnRowCommand="grdRejected_RowCommand" AutoGenerateColumns="false" EmptyDataText="No Records" ShowHeaderWhenEmpty="True">
                                        <Columns>
                                            <asp:BoundField DataField="TransDate" HeaderText="Trans. Date" />
                                            <asp:BoundField DataField="TransTime" HeaderText="Trans. Time" />
                                            <asp:BoundField DataField="TransAmount" HeaderText="Trans. Amount" />
                                            <asp:BoundField DataField="TransactionBaseAmount" HeaderText="Transaction Base Amount" />
                                            <asp:BoundField DataField="TransactionBaseCurrency" HeaderText="Transaction Base Currency" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" />
                                            <asp:BoundField DataField="ApprovalCode" HeaderText="Approval Code" />
                                            <asp:BoundField DataField="ApprovalMode" HeaderText="Approval Mode" />
                                            <asp:BoundField DataField="MerchantNumber" HeaderText="Merchant Number" />
                                            <asp:BoundField DataField="MerchantName" HeaderText="Merchant Name" />
                                            <asp:BoundField DataField="MerchantCity" HeaderText="Merchant City" />
                                            <asp:BoundField DataField="MCC" HeaderText="MCC" />
                                            <asp:BoundField DataField="AcquiringBIN" HeaderText="Acquiring BIN" />
                                            <asp:BoundField DataField="TC40SAFE" HeaderText="TC40 SAFE" />
                                            <asp:BoundField DataField="TC40Date" HeaderText="TC40 Date" />
                                            <asp:BoundField DataField="UFL" HeaderText="UFL" />
                                            <%--<asp:BoundField DataField="Total" HeaderText="Total" />--%>


                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="editRecord" CssClass="btn btn-defualt" OnClientClick="TranShowPopup();" />
                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' CommandName="deleteRecord" CssClass="btn btn-danger" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="normal-text-4" />
                                        <HeaderStyle CssClass="normal-text-2" />

                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddTrans" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>


        </div>
        <div class="panel panel-info">
            <div class="panel-heading">
                <h4 class="panel-title normal-text-2">
                    <a data-toggle="collapse" data-parent="#accordion2" href="#pnlUnderAuthorization">Under Authorization Transaction Details</a>
                </h4>
            </div>

            <div id="pnlUnderAuthorization" class="panel-collapse collapse ">
                <div class="panel-body">
                    <div class="row">
                        <asp:UpdatePanel ID="upTransUnderAuth" runat="server">
                            <ContentTemplate>
                                <div style="overflow-x: auto; width: auto">
                                    <asp:GridView ID="grdUnderConsideration" runat="server" class="table-responsive table table-striped table-bordered table-hover table-highlight table-checkable"
                                        OnRowCommand="grdUnderConsideration_RowCommand" AutoGenerateColumns="false" EmptyDataText="No Records" ShowHeaderWhenEmpty="True">
                                        <Columns>
                                            <asp:BoundField DataField="TransDate" HeaderText="Trans. Date" />
                                            <asp:BoundField DataField="TransTime" HeaderText="Trans. Time" />
                                            <asp:BoundField DataField="TransAmount" HeaderText="Trans. Amount" />
                                            <asp:BoundField DataField="TransactionBaseAmount" HeaderText="Transaction Base Amount" />
                                            <asp:BoundField DataField="TransactionBaseCurrency" HeaderText="Transaction Base Currency" />
                                            <asp:BoundField DataField="Country" HeaderText="Country" />
                                            <asp:BoundField DataField="ApprovalCode" HeaderText="Approval Code" />
                                            <asp:BoundField DataField="ApprovalMode" HeaderText="Approval Mode" />
                                            <asp:BoundField DataField="MerchantNumber" HeaderText="Merchant Number" />
                                            <asp:BoundField DataField="MerchantName" HeaderText="Merchant Name" />
                                            <asp:BoundField DataField="MerchantCity" HeaderText="Merchant City" />
                                            <asp:BoundField DataField="MCC" HeaderText="MCC" />
                                            <asp:BoundField DataField="AcquiringBIN" HeaderText="Acquiring BIN" />
                                            <asp:BoundField DataField="TC40SAFE" HeaderText="TC40 SAFE" />
                                            <asp:BoundField DataField="TC40Date" HeaderText="TC40 Date" />
                                            <asp:BoundField DataField="UFL" HeaderText="UFL" />
                                            <%--<asp:BoundField DataField="Total" HeaderText="Total" />--%>


                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="editRecord" CssClass="btn btn-defualt" OnClientClick="TranShowPopup();" />
                                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" CommandArgument='<%# Container.DataItemIndex %>' CommandName="deleteRecord" CssClass="btn btn-danger" />
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                        <RowStyle CssClass="normal-text-4" />
                                        <HeaderStyle CssClass="normal-text-2" />

                                    </asp:GridView>
                                </div>

                            </ContentTemplate>
                            <Triggers>
                                <asp:AsyncPostBackTrigger ControlID="btnAddTrans" EventName="Click" />
                            </Triggers>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>

