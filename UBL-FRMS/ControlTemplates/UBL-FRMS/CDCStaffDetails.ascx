<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CDCStaffDetails.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.CDCStaffDetails" %>

<script type="text/javascript">
    function CloseStaffDetailPopup() {
        if (Page_ClientValidate('vgStaffDetailSave')) {
            $('#StaffWindow').modal('hide');
        }
    }
    function ShowStaffDetailPopup() {
        $('#StaffWindow').modal('show');
    }
</script>


<div class="panel-body">

    <%--<button type="button" class="btn btn-info btn-md" data-toggle="modal" data-target="#StaffWindow">Add Staff</button>--%>
    <asp:Button ID="btnAddStaff" runat="server" Text="Add Staff" CssClass="btn btn-info btn-md" OnClick="btnAddStaff_Click" OnClientClick="ShowStaffDetailPopup();" />
    <hr />
    <asp:UpdatePanel ID="upStaff" runat="server">
        <ContentTemplate>
            <div style="overflow-x: auto; width: auto">
                <asp:GridView ID="grdStaffDetails" runat="server" class="table-responsive table table-striped table-bordered table-hover table-highlight table-checkable"
                    OnRowCommand="grdStaffDetails_RowCommand" AutoGenerateColumns="false" EmptyDataText="No Records" ShowHeaderWhenEmpty="True">
                    <Columns>
                        <asp:BoundField DataField="StaffName" HeaderText="Staff Name" />
                        <asp:BoundField DataField="StaffNumber" HeaderText="Staff Number" />
                        <asp:BoundField DataField="StaffStatus" HeaderText="Staff Status" />
                        <asp:BoundField DataField="FatherHusbandName" HeaderText="Father’s Name / Husband Name" />
                        <asp:BoundField DataField="CNIC" HeaderText="CNIC #" />
                        <asp:BoundField DataField="PeriodofServices" HeaderText="Period of Services" />
                        <asp:BoundField DataField="Designation" HeaderText="Designation" />
                        <asp:BoundField DataField="Grade" HeaderText="Grade" />
                        <asp:BoundField DataField="ActionTaken" HeaderText="Action Taken" />
                        <asp:TemplateField HeaderText="Action">
                            <ItemTemplate>
                                <asp:Button ID="btnEdit" runat="server" Text="Edit" CommandArgument='<%# Container.DataItemIndex %>' CommandName="editRecord" CssClass="btn btn-defualt" OnClientClick="ShowStaffDetailPopup();" />
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
            <asp:AsyncPostBackTrigger ControlID="btnAddStaff" EventName="Click" />
        </Triggers>
    </asp:UpdatePanel>

    <div class="modal fade" id="StaffWindow" role="dialog">
        <div class="modal-dialog  modal-lg">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Staff Detail</h4>
                </div>
                <asp:UpdatePanel ID="upStaffModal" runat="server">
                    <ContentTemplate>
                        <div class="modal-body">

                            <div class="row">
                                <div class="form-group col-lg-2">
                                    <label id="lblStaffName" class="normal-text-2" style="width: 250px">Staff Name<span class="Validatetext">*</span></label>
                                    <asp:TextBox ID="txtStaffName" runat="server" CssClass="form-control" placeholder="Staff Name" Style="width: 250px" />
                                    <asp:RequiredFieldValidator ID="rfvStaffName" runat="server" ControlToValidate="txtStaffName" Display="Dynamic" ErrorMessage="Please Enter Staff Name" ValidationGroup="vgStaffDetailSave" ForeColor="Red" />
                                </div>

                      
                                <div class="form-group col-lg-2">
                                    <label id="lblStaffNumber" class="normal-text-2">Staff Number</label>
                                    <asp:TextBox ID="txtStaffNumber" runat="server" CssClass="form-control" placeholder="Staff Number" Style="width: 250px" />
                                </div>
                              
                                <div class="form-group col-lg-2">
                                    <label id="lblStaffStatus" class="normal-text-2">Staff Status<span class="Validatetext">*</span></label>
                                    <asp:DropDownList ID="ddlStaffStatus" runat="server" CssClass="form-control" Style="width: 250px">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvStaffStatus" runat="server" ControlToValidate="ddlStaffStatus" Display="Dynamic" ErrorMessage="Please select Staff Status" ValidationGroup="vgStaffDetailSave" ForeColor="Red" InitialValue="0" />
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group col-lg-2">
                                    <label id="lblFatherHusbandName" class="normal-text-2" style="width: 250px">Father’s Name / Husband Name</label>
                                    <asp:TextBox ID="txtFatherHusbandName" runat="server" CssClass="form-control" placeholder="Father’s Name / Husband Name" Style="width: 250px" />
                                </div>

                            
                                <div class="form-group col-lg-2">
                                    <label id="lblCNIC" class="normal-text-2">CNIC #</label>
                                    <asp:TextBox ID="txtCNIC" runat="server" CssClass="form-control" placeholder="CNIC #" Style="width: 250px" />
                                </div>
                          
                                <div class="form-group col-lg-2">
                                    <label id="lblPeriodOfServices" class="normal-text-2">Period of Services</label>
                                    <asp:TextBox ID="txtPeriodOfServices" runat="server" CssClass="form-control" placeholder="Period of Services" Style="width: 250px" />
                                </div>

                            </div>

                            <div class="row">
                                <div class="form-group col-lg-2">
                                    <label id="lblDesignation" class="normal-text-2" style="width: 250px">Designation</label>
                                    <asp:TextBox ID="txtDesignation" runat="server" CssClass="form-control" placeholder="Designation" Style="width: 250px" />
                                </div>

                           
                                <div class="form-group col-lg-2">
                                    <label id="lblGrade" class="normal-text-2">Grade</label>
                                    <asp:TextBox ID="txtGrade" runat="server" CssClass="form-control" placeholder="Grade" Style="width: 250px" />
                                </div>
                           
                                <div class="form-group col-lg-2">
                                    <label id="lblActionTaken" class="normal-text-2">Action Taken</label>

                                    <asp:TextBox ID="txtActionTaken" runat="server" TextMode="multiline" CssClass="form-control" placeholder="Action Taken" lines="5" cols="20" Wrap="true" Style="width: 250px" />

                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnStaffSave" runat="server" Text="Save" class="btn btn-info btn-md" ValidationGroup="vgStaffDetailSave" OnClientClick="CloseStaffDetailPopup();" OnClick="btnStaffSave_Click" />
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:AsyncPostBackTrigger ControlID="grdStaffDetails" EventName="RowCommand" />
                        <asp:AsyncPostBackTrigger ControlID="btnStaffSave" EventName="Click" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>

        </div>
    </div>

</div>
