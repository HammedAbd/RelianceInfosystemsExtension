page 70976593 REIDocumentApprovalCues
{
    Caption = 'Document Approvals';
    PageType = CardPart;
    RefreshOnActivate = true;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            cuegroup(DocAppCueGroup)
            {
                Caption = 'Requisition Document Approvals';
                ShowCaption = false;
                field(MyPendingReq; MyPendingReq)
                {
                    Caption = 'My Approval Requests';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the My Approval Requests field.';

                    #region OnDrillDown
                    trigger OnDrillDown()
                    var
                        DocAppEntry: Record "REIDocumentApprovalEntry";
                        ReqPage: Page REIRequesterDocEntries;
                    begin
                        DocAppEntry.Reset();
                        DocAppEntry.FilterGroup(20);
                        DocAppEntry.SetRange(Sender, UserId);
                        DocAppEntry.SetFilter("Approval Status", '%1|%2',
                                        DocAppEntry."Approval Status"::Pending,
                                        DocAppEntry."Approval Status"::Rejected);
                        DocAppEntry.FilterGroup(0);
                        ReqPage.InitializeRecord(DocAppEntry);
                        ReqPage.SetTableView(DocAppEntry);
                        ReqPage.Run();
                    end;
                    #endregion OnDrillDown
                }
                field(PendingApproval; PendingApproval)
                {
                    Caption = 'Pending Approvals';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pending Approvals field.';

                    #region OnDrillDown
                    trigger OnDrillDown()
                    var
                        DocAppEntry: Record "REIDocumentApprovalEntry";
                        AppPage: Page REIApproverDocEntries;
                    begin
                        DocAppEntry.Reset();
                        DocAppEntry.FilterGroup(20);
                        DocAppEntry.SetRange(Approver, UserId);
                        DocAppEntry.SetFilter("Approval Status", '%1',
                                        DocAppEntry."Approval Status"::Pending);
                        DocAppEntry.FilterGroup(0);
                        AppPage.InitializeRecord(DocAppEntry);
                        AppPage.SetTableView(DocAppEntry);
                        AppPage.Run();
                    end;
                    #endregion OnDrillDown
                }
                field(MyApprovedReq; MyApprovedReq)
                {
                    Caption = 'My Approved Requests';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the My Approved Requests field.';

                    #region OnDrillDown
                    trigger OnDrillDown()
                    var
                        DocAppEntry: Record "REIDocumentApprovalEntry";
                        ReqPage: Page REIRequesterDocEntries;
                    begin
                        DocAppEntry.Reset();
                        DocAppEntry.FilterGroup(20);
                        DocAppEntry.SetRange(Sender, UserId);
                        DocAppEntry.SetFilter("Approval Status", '%1',
                                        DocAppEntry."Approval Status"::Approved);
                        DocAppEntry.FilterGroup(0);
                        ReqPage.InitializeRecord(DocAppEntry);
                        ReqPage.SetTableView(DocAppEntry);
                        ReqPage.Run();
                    end;
                    #endregion OnDrillDown
                }
                field(ApprovalHistory; ApprovalHistory)
                {
                    Caption = 'Historical Approved Requests';
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Historical Approved Requests field.';

                    #region OnDrillDown
                    trigger OnDrillDown()
                    var
                        DocAppEntry: Record "REIDocumentApprovalEntry";
                        AppPage: Page REIApproverDocEntries;
                    begin
                        DocAppEntry.Reset();
                        DocAppEntry.FilterGroup(20);
                        DocAppEntry.SetRange(Approver, UserId);
                        DocAppEntry.SetFilter("Approval Status", '%1',
                                        DocAppEntry."Approval Status"::Approved);
                        DocAppEntry.FilterGroup(0);
                        AppPage.InitializeRecord(DocAppEntry);
                        AppPage.SetTableView(DocAppEntry);
                        AppPage.Run();
                    end;
                    #endregion OnDrillDown
                }

            }

        }
    }

    #region OnOpenPage
    trigger OnOpenPage()
    begin
        UpdatePersonalizedCue();
    end;
    #endregion OnOpenPage

    #region OnAfterGetRecord
    trigger OnAfterGetRecord()
    begin
        UpdatePersonalizedCue();
    end;
    #endregion OnAfterGetRecord

    #region OnAfterGetCurrRecord
    trigger OnAfterGetCurrRecord()
    begin
        UpdatePersonalizedCue();
    end;
    #endregion OnAfterGetCurrRecord

    var
        UserSetup: Record "User Setup";
        DocAppEntry, DocAppEntry1, DocAppEntry2: Record "REIDocumentApprovalEntry";
        MyPendingReq, PendingApproval, MyApprovedReq, ApprovalHistory : integer;
        DocNoFilter: Text;

    #region UpdatePersonalizedCue
    procedure UpdatePersonalizedCue()
    begin
        UserSetup.Reset();
        if UserSetup.Get(UserId) then begin

            //Note: if Current User is Requester
            DocAppEntry.Reset();
            DocAppEntry.FilterGroup(20);
            DocAppEntry.SetRange(Sender, UserSetup."User ID");
            DocAppEntry.FilterGroup(0);

            //Getting Current Users Requisitions yet to be approved or Rejected by others 
            DocAppEntry.SetFilter("Approval Status", '%1|%2', DocAppEntry."Approval Status"::Pending, DocAppEntry."Approval Status"::Rejected);
            if DocAppEntry.FindSet() then begin
                Clear(DocNoFilter);
                Clear(MyPendingReq);
                repeat
                    if DocNoFilter = '' then begin
                        DocNoFilter := DocAppEntry."Document No.";
                        MyPendingReq := 1;
                    end else
                        if StrPos(DocNoFilter, DocAppEntry."Document No.") <= 0 then begin
                            DocNoFilter += '|' + DocAppEntry."Document No.";
                            MyPendingReq += 1;
                        end;
                until DocAppEntry.Next() = 0;
            end;

            //Getting Current Users Requisitions already approved by others
            DocAppEntry.SetRange("Approval Status");
            DocAppEntry.SetRange("Approval Status", DocAppEntry."Approval Status"::Approved);
            if DocAppEntry.FindSet() then begin
                Clear(DocNoFilter);
                Clear(MyApprovedReq);
                repeat
                    if DocNoFilter = '' then begin
                        DocNoFilter := DocAppEntry."Document No.";
                        MyApprovedReq := 1;
                    end else
                        if StrPos(DocNoFilter, DocAppEntry."Document No.") <= 0 then begin
                            DocNoFilter += '|' + DocAppEntry."Document No.";
                            MyApprovedReq += 1;
                        end;
                until DocAppEntry.Next() = 0;

            end;


            //Note: if Current User is an Approver
            DocAppEntry1.Reset();
            DocAppEntry1.FilterGroup(20);
            DocAppEntry1.SetRange(Approver, UserSetup."User ID");
            DocAppEntry1.FilterGroup(0);

            //Getting Current Users Requisitions to approve
            DocAppEntry1.SetRange("Approval Status", DocAppEntry1."Approval Status"::Pending);
            if DocAppEntry1.FindSet() then begin
                Clear(DocNoFilter);
                Clear(PendingApproval);
                repeat
                    if DocNoFilter = '' then begin
                        DocNoFilter := DocAppEntry1."Document No.";
                        PendingApproval := 1;
                    end else
                        if StrPos(DocNoFilter, DocAppEntry1."Document No.") <= 0 then begin
                            DocNoFilter += '|' + DocAppEntry1."Document No.";
                            PendingApproval += 1;
                        end;
                until DocAppEntry1.Next() = 0;

            end;

            //Getting requisition that Current User Has Approved
            DocAppEntry1.SetRange("Approval Status");
            DocAppEntry1.SetRange("Approval Status", DocAppEntry1."Approval Status"::Approved);
            if DocAppEntry1.FindSet() then begin
                Clear(DocNoFilter);
                Clear(ApprovalHistory);
                repeat
                    if DocNoFilter = '' then begin
                        DocNoFilter := DocAppEntry1."Document No.";
                        ApprovalHistory := 1;
                    end else
                        if StrPos(DocNoFilter, DocAppEntry1."Document No.") <= 0 then begin
                            DocNoFilter += '|' + DocAppEntry1."Document No.";
                            ApprovalHistory += 1;
                        end;
                until DocAppEntry1.Next() = 0;

            end;

        end;
    end;
    #endregion UpdatePersonalizedCue


}
