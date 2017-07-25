<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CDCCaseInvestigationComments.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.CDCCaseInvestigationComments" %>

<script type="text/javascript">
    function CommentClosePopup() {
        if (Page_ClientValidate('vgCaseCommentSave')) {
            $('#CommentsWindow').modal('hide');
        }
    }
    function CommentShowPopup() {
        $('#CommentsWindow').modal('show');
    }
</script>

<div class="panel-body">

    <asp:Button ID="btnAddCaseComments" runat="server" Text="Enter Case Comments" CssClass="btn btn-info btn-md" OnClick="btnAddCaseComments_Click" OnClientClick="CommentShowPopup();" />
    <hr />
    <asp:UpdatePanel ID="upCaseCommentsGrid" runat="server">
        <ContentTemplate>
            <div style="overflow-x: auto; width: auto">
                <asp:GridView ID="grdCaseComments" runat="server" class="table-responsive table table-striped table-bordered table-hover table-highlight table-checkable"
                    OnRowCommand="grdCaseComments_RowCommand" AutoGenerateColumns="false" EmptyDataText="No Records" ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:BoundField DataField="EnteredBy" HeaderText="Entered By" />
                        <asp:BoundField DataField="Date" HeaderText="Date" />
                        <asp:BoundField DataField="Time" HeaderText="Time" />
                        <asp:BoundField DataField="Comments" HeaderText="Comments" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="editRecord" CssClass="btn btn-defualt" OnClientClick="CommentShowPopup();" />
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
            <asp:AsyncPostBackTrigger ControlID="btnAddCaseComments" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <div class="modal fade" id="CommentsWindow" role="dialog">
        <div class="modal-dialog  modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Case Investigation Comments</h4>
                </div>
                <asp:UpdatePanel ID="upCaseCommentsModal" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">

                            <div class="row">
                                <div class="form-group col-lg-3">
                                    <label id="lblFruadIdenNo" class="normal-text-2" style="width: 250px">Fraud Identification Number</label>
                                    <asp:TextBox ID="txtFruadIdenNo" runat="server" CssClass="form-control" Enabled="false" placeholder="Fraud Identification Number" Style="width: 250px" />
                                </div>

                             
                                <div class="form-group col-lg-3">
                                    <label id="lblCaseCardNumber" class="normal-text-2">Card Number</label>
                                    <asp:TextBox ID="txtCaseCardNumber" runat="server" CssClass="form-control" Enabled="false" placeholder="Card Number" Style="width: 250px" />
                                </div>
         
                            </div>

                            <div class="row">
                                <div class="form-group col-lg-12">
                                    <label id="lblCaseComments" class="normal-text-2">Case Comments<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtCaseComments" runat="server" TextMode="multiline" CssClass="form-control" placeholder="Case Comments" Rows="5" Wrap="true" />
                                    <asp:RequiredFieldValidator ID="rfvCaseComments" runat="server" ControlToValidate="txtCaseComments" Display="Dynamic" ErrorMessage="Please Enter Case Comments" ValidationGroup="vgCaseCommentSave" ForeColor="Red" />
                                </div>

                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSaveCaseComment" runat="server" Text="Save" class="btn btn-info btn-md" ValidationGroup="vgCaseCommentSave" OnClientClick="CommentClosePopup();" OnClick="btnSaveCaseComment_Click" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grdCaseComments" EventName="RowCommand" />
                        <asp:AsyncPostBackTrigger ControlID="btnSaveCaseComment" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>

        </div>
    </div>

</div>
