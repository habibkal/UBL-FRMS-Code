<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCLoanDisputeCases.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.UCLoanDisputeCases" %>


<script type="text/javascript">
    function pageLoad(sender, args) {
        $(".datepickercss").datepicker();
    }
</script>
<br />
<br />
<div class="panel-group" id="accordion" style="display: none;">
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4 class="panel-title">
                <a data-toggle="collapse" data-parent="#accordion" href="#pnlSearchAddCases">Search / Add Cases</a>
            </h4>
        </div>
        <div id="pnlSearchAddCases" class="panel-collapse collapse ">
            <div class="panel-body">
                <div class="row">
                    <div class="form-group col-lg-2" style="width: 270px">
                        <label id="lblFraudIdentificationNumber" class="normal-text-2">Fraud Identification Number</label>
                        <asp:TextBox ID="txtFraudIdentificationNumber" runat="server" CssClass="form-control" placeholder="Fraud Identification Number" />
                    </div>
                    <div class="form-group col-lg-2" style="width: 270px">
                        <label id="lblApplicationID" class="normal-text-2">Application ID</label>
                        <asp:TextBox ID="txtApplicationID" runat="server" CssClass="form-control" placeholder="Application ID" />
                    </div>
                    <div class="form-group col-lg-2">
                        <label id="lblCNIC" class="normal-text-2">CNIC</label>
                        <asp:DropDownList ID="ddlCNIC" runat="server" CssClass="form-control" Style="width: 250px">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-lg-1">
                    </div>
                    <div class="form-group col-lg-2" style="padding-top: 26px;">
                        <asp:Button ID="btnAddCase" runat="server" Text="Add Case" class="btn btn-info btn-md" />
                    </div>


                </div>

                <div class="row">
                    <div class="form-group col-lg-2" style="width: 270px">
                        <label id="lblFromDate" class="normal-text-2">From Date</label>

                        <div class="input-group date" data-provide="datepicker">
                            <asp:TextBox ID="txtFromDate" runat="server" CssClass="form-control datepickercss" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>

                        </div>
                    </div>
                    <div class="form-group col-lg-2" style="width: 270px">
                        <label id="lblToDate" class="normal-text-2">To Date</label>

                        <div class="input-group date" data-provide="datepicker">
                            <asp:TextBox ID="txtToDate" runat="server" CssClass="form-control datepickercss" />
                            <span class="input-group-addon">
                                <span class="glyphicon glyphicon-calendar"></span>
                            </span>

                        </div>
                    </div>
                    <div class="form-group col-lg-2">
                        <label id="lblCaseStatus" class="normal-text-2">Case Status</label>
                        <asp:DropDownList ID="ddlCaseStatus" runat="server" CssClass="form-control" Style="width: 250px">
                        </asp:DropDownList>
                    </div>
                    <div class="form-group col-lg-1">
                    </div>
                    <div class="form-group col-lg-1" style="padding-top: 26px;">
                        <asp:Button ID="btnSearchCase" runat="server" Text="Search Case" class="btn btn-info btn-md" />
                    </div>

                    <div class="form-group col-lg-1" style="padding-top: 26px; padding-left: 50px;">
                        <asp:Button ID="btnMyBucket" runat="server" Text="My Bucket" class="btn btn-info btn-md" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12 wp-h2">
        <div class="col-lg-12 wp-h2">
            <asp:Label ID="lblHeading" runat="server" Text="Loan Dispute Cases"></asp:Label>
            <asp:HyperLink CssClass="plus-trc" ID="lnkbtnCreateCPCRequest" runat="server" Width="230px" Text="Create Loan Dispute Cases"></asp:HyperLink>
        </div>
        <br />
        <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
    </div>
</div>
<hr />
<!-- Start Of Grid div -->
<div class="table-responsive">
    <asp:UpdatePanel ID="upBucket" runat="server">
        <ContentTemplate>
            <asp:GridView
                ID="grdBucket"
                runat="server"
                class="table table-striped table-bordered table-hover table-highlight table-checkable"
                AutoGenerateColumns="false"
                EmptyDataText="No Record"
                AllowPaging="True"
                AllowSorting="false"
                ShowHeaderWhenEmpty="true"
                PageSize="10"
                Width="100%">
                <Columns>
                    <asp:BoundField DataField="FruadIdenNo" HeaderText="Fruad Identification Number" />
                    <asp:BoundField DataField="ApplicationID" HeaderText="Application ID" />
                    <asp:BoundField DataField="ApplicationName" HeaderText="Application Name" />
                    <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
                    <asp:BoundField DataField="NIC" HeaderText="NIC" />
                    <asp:BoundField DataField="Region" HeaderText="Region" />
                    <asp:BoundField DataField="CaseDate" HeaderText="Case Date" />
                    <asp:BoundField DataField="Aging" HeaderText="Aging" />
                    <asp:BoundField DataField="Bucket" HeaderText="Bucket" />
                    <asp:BoundField DataField="CaseStatus" HeaderText="Case Status" />
                </Columns>
                <RowStyle CssClass="normal-text-4" />
                <HeaderStyle CssClass="normal-text-2" />
                <PagerStyle CssClass="paging_numbers" HorizontalAlign="Right" />
            </asp:GridView>
        </ContentTemplate>
        <Triggers>
            <%--<asp:AsyncPostBackTrigger ControlID="" EventName="" />--%>
        </Triggers>
    </asp:UpdatePanel>
</div>
<!-- End Of Grid div -->
