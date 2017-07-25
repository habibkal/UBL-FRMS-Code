<%@ Assembly Name="$SharePoint.Project.AssemblyFullName$" %>
<%@ Assembly Name="Microsoft.Web.CommandUI, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="SharePoint" Namespace="Microsoft.SharePoint.WebControls" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="Utilities" Namespace="Microsoft.SharePoint.Utilities" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Register TagPrefix="asp" Namespace="System.Web.UI" Assembly="System.Web.Extensions, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" %>
<%@ Import Namespace="Microsoft.SharePoint" %>
<%@ Register TagPrefix="WebPartPages" Namespace="Microsoft.SharePoint.WebPartPages" Assembly="Microsoft.SharePoint, Version=15.0.0.0, Culture=neutral, PublicKeyToken=71e9bce111e9429c" %>
<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LDCCheckFraudDBTAB.ascx.cs" Inherits="UBL_FRMS.ControlTemplates.UBL_FRMS.LDCCheckFraudDBTAB" %>

<div class="panel-body">

    <div class="row">

        <div class="form-group col-lg-3">
            <label id="lblApplicantName" class="normal-text-2">Applicant Name</label>
            <asp:TextBox ID="txtApplicantName" runat="server" CssClass="form-control" placeholder="Applicant Name" Style="width: 250px" Enabled="false" />
        </div>
        <div class="form-group col-lg-3">
            <label id="lblCNIC" class="normal-text-2">CNIC</label>
            <asp:TextBox ID="txtCNIC" runat="server" CssClass="form-control" placeholder="CNIC" Style="width: 250px" Enabled="false" />
        </div>
        <div class="form-group col-lg-3">
            <label id="lblNIC" class="normal-text-2">NIC</label>
            <asp:TextBox ID="txtNIC" runat="server" CssClass="form-control" placeholder="NIC" Style="width: 250px" Enabled="false" />
        </div>
    </div>
    <hr />
    <div class="table-responsive">
        <asp:UpdatePanel ID="upCheckFraudDB" runat="server">
            <ContentTemplate>
                <asp:GridView
                    ID="grdCheckFraudDB"
                    runat="server"
                    class="table table-striped table-bordered table-hover table-highlight table-checkable"
                    AutoGenerateColumns="false"
                    EmptyDataText="No Record"
                    ShowHeaderWhenEmpty="true"
                    Width="100%">
                    <RowStyle CssClass="normal-text-3" />
                    <Columns>
                        <asp:BoundField DataField="CulpritName" HeaderText="Culprit Name" />
                        <asp:BoundField DataField="Product" HeaderText="Product" />
                        <asp:BoundField DataField="CNIC" HeaderText="CNIC" />
                        <asp:BoundField DataField="NIC" HeaderText="NIC" />
                        <asp:BoundField DataField="ReceivedDate" HeaderText="Received Date" />
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:LinkButton ID="btnViewDetail" runat="server" Text="ViewDetail" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle CssClass="normal-text-4" />
                    <HeaderStyle CssClass="normal-text-2" />
                </asp:GridView>
            </ContentTemplate>
            <Triggers>
                <%--<asp:AsyncPostBackTrigger ControlID="" EventName="" />--%>
            </Triggers>
        </asp:UpdatePanel>
    </div>


</div>

