codeunit 70976576 REIDocumentApprovalWorkflow
{

    trigger OnRun()
    begin
    end;

    #region GlobalVariable
    var
        DocumentApprovalEntry3: Record "REIDocumentApprovalEntry";
        DocumentWorkflow: Record "REIDocumentWorkflow";
        DocumentApprovalEntry4: Record "REIDocumentApprovalEntry";
        DocumentApprovalEntry: Record "REIDocumentApprovalEntry";
        DocumentApprovalEntry2: Record "REIDocumentApprovalEntry";
        DocumentApprovalEntry5: Record "REIDocumentApprovalEntry";
        DocumentApprovalEntry6: Record "REIDocumentApprovalEntry";
        DocumentApprovalEntry7: Record "REIDocumentApprovalEntry";
        DocumentApprovalEntryMD: Record "REIDocumentApprovalEntry";
        SentBy: Record "User Setup";
        Apprv1: Record "User Setup";
        Apprv2: Record "User Setup";
        Apprv3: Record "User Setup";
        Apprv4: Record "User Setup";
        Apprv5: Record "User Setup";
        Apprv6: Record "User Setup";
        Apprv7: Record "User Setup";
        MDUserSetup: Record "User Setup";
        DocApprv: Record "User Setup";
        HRSetup: Record REIHRSetup;
        Email: Codeunit "Email";
        EmailMessage: Codeunit "Email Message";
        ApprovalRequestMsg: Label 'Approval request has been sent.';
        ApprovaLCannotBeCancelledMsg: Label 'The approval cannot be cancelled because it has been treated by your approver.';
        HoldonMsg: Label 'Please hold on. This document requires a prior approval.';
        DocApprovedMsg: Label 'The document has been approved.';
        DocRejectedMsg: Label 'The document has been rejected.';
        DearLbl: Label 'Dear ';
        Subject: Text[150];
        Recipients: List of [Text];
        DocApprovalBodylLbl: Label '%1 requires your approval. Please click on the link below to approve or reject the document.', Comment = '%1 = Document Requires Approval';
        SystemgeneratedlLbl: Label 'This is a system generated mail.';
        ApprovalResetMsg: Label 'The document approvals has been reset and the document is reopened.';
        PaymentProcessingBodyMsg: Label '%1 requires your urgent payment processing. Kindly proceed to disburse the payment to the beneficiary on the approved payment requisition page.', Comment = '%1 = Document';
        UseAnotherMailTemplate: Boolean;
    #endregion GlobalVariable

    #region SendApprovalRequest
    procedure SendApprovalRequest(TableID: Integer; DocNo: Code[20]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[100])
    begin
        if NOT DocumentWorkflow.GET(USERID, TableID) THEN
            ERROR('No Approval Workflow is set for you on this document. Contact your system administrator!');

        if DocumentWorkflow.GET(USERID, TableID) THEN 
            if DocumentWorkflow."1st Approver" = '' THEN
                ERROR('At least One Approver must be configured for you. Contact your system administrator!');

        if DocumentWorkflow.GET(USERID, TableID) then begin
            if SentBy.GET(DocumentWorkflow."User ID") THEN;
            if Apprv1.GET(DocumentWorkflow."1st Approver") THEN;
            if Apprv2.GET(DocumentWorkflow."2nd Approver") THEN;
            if Apprv3.GET(DocumentWorkflow."3rd Approver") THEN;
            if Apprv4.GET(DocumentWorkflow."4th Approver") THEN;
            if Apprv5.GET(DocumentWorkflow."5th Approver") THEN;
            if Apprv6.GET(DocumentWorkflow."6th Approver") THEN;
            if Apprv7.GET(DocumentWorkflow."7th Approver") THEN;
            if MDUserSetup.Get(DocumentWorkflow."MD Approval") then;
            Recipients.add('');

            CheckifApprovalEntryExists(TableID,DocNo);

            if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" = '')
              AND (DocumentWorkflow."3rd Approver" = '') AND (DocumentWorkflow."4th Approver" = '')
              AND (DocumentWorkflow."5th Approver" = '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
              AND ((DocumentWorkflow."MD Approval" <> '') or (DocumentWorkflow."MD Approval" = '')) AND ((DocumentWorkflow."Approval Limit" = 0) or (DocumentWorkflow."Approval Limit" > DocAmount)) THEN
                LevelsApproval1(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc)
            //Added by Hammed    
            else
                if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" = '')
             AND (DocumentWorkflow."3rd Approver" = '') AND (DocumentWorkflow."4th Approver" = '')
             AND (DocumentWorkflow."5th Approver" = '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
             AND (DocumentWorkflow."MD Approval" <> '') AND (DocumentWorkflow."Approval Limit" < DocAmount) then
                    LevelsApproval1MD(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc);


            if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
              AND (DocumentWorkflow."3rd Approver" = '') AND (DocumentWorkflow."4th Approver" = '')
              AND (DocumentWorkflow."5th Approver" = '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
              AND ((DocumentWorkflow."MD Approval" <> '') or (DocumentWorkflow."MD Approval" = '')) AND ((DocumentWorkflow."Approval Limit" = 0) or (DocumentWorkflow."Approval Limit" > DocAmount)) THEN
                LevelsApproval2(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc)
            //Added by Hammed    
            else
                if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
             AND (DocumentWorkflow."3rd Approver" = '') AND (DocumentWorkflow."4th Approver" = '')
             AND (DocumentWorkflow."5th Approver" = '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
             AND (DocumentWorkflow."MD Approval" <> '') AND (DocumentWorkflow."Approval Limit" < DocAmount) then
                    LevelsApproval2MD(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc);

            if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
              AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" = '')
              AND (DocumentWorkflow."5th Approver" = '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
              AND ((DocumentWorkflow."MD Approval" <> '') or (DocumentWorkflow."MD Approval" = '')) AND ((DocumentWorkflow."Approval Limit" = 0) or (DocumentWorkflow."Approval Limit" > DocAmount)) THEN
                LevelsApproval3(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc)
            else
                if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
                AND (DocumentWorkflow."3rd Approver" = '') AND (DocumentWorkflow."4th Approver" = '')
                AND (DocumentWorkflow."5th Approver" = '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
                AND (DocumentWorkflow."MD Approval" <> '') AND (DocumentWorkflow."Approval Limit" < DocAmount) then
                    LevelsApproval3MD(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc);

            if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
              AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" <> '')
              AND (DocumentWorkflow."5th Approver" = '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
              AND ((DocumentWorkflow."MD Approval" <> '') or (DocumentWorkflow."MD Approval" = '')) AND ((DocumentWorkflow."Approval Limit" = 0) or (DocumentWorkflow."Approval Limit" > DocAmount)) THEN
                LevelsApproval4(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc)
            else
                if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
                AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" <> '')
                AND (DocumentWorkflow."5th Approver" = '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
                AND (DocumentWorkflow."MD Approval" <> '') AND (DocumentWorkflow."Approval Limit" < DocAmount) then
                    LevelsApproval4MD(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc);


            if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
              AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" <> '')
              AND (DocumentWorkflow."5th Approver" <> '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
              AND ((DocumentWorkflow."MD Approval" <> '') or (DocumentWorkflow."MD Approval" = '')) AND ((DocumentWorkflow."Approval Limit" = 0) or (DocumentWorkflow."Approval Limit" > DocAmount)) THEN
                LevelsApproval5(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc)
            else
                if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
                  AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" <> '')
                  AND (DocumentWorkflow."5th Approver" <> '') AND (DocumentWorkflow."6th Approver" = '') AND (DocumentWorkflow."7th Approver" = '')
                  AND (DocumentWorkflow."MD Approval" <> '') AND (DocumentWorkflow."Approval Limit" < DocAmount) THEN
                    LevelsApproval5MD(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc);

            if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
              AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" <> '')
              AND (DocumentWorkflow."5th Approver" <> '') AND (DocumentWorkflow."6th Approver" <> '') AND (DocumentWorkflow."7th Approver" = '')
              AND ((DocumentWorkflow."MD Approval" <> '') or (DocumentWorkflow."MD Approval" = '')) AND ((DocumentWorkflow."Approval Limit" = 0) or (DocumentWorkflow."Approval Limit" > DocAmount)) THEN
                LevelsApproval6(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc)
            else
                if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
                  AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" <> '')
                  AND (DocumentWorkflow."5th Approver" <> '') AND (DocumentWorkflow."6th Approver" <> '') AND (DocumentWorkflow."7th Approver" = '')
                  AND (DocumentWorkflow."MD Approval" <> '') AND (DocumentWorkflow."Approval Limit" < DocAmount) THEN
                    LevelsApproval6MD(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc);

            if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
              AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" <> '')
              AND (DocumentWorkflow."5th Approver" <> '') AND (DocumentWorkflow."6th Approver" <> '') AND (DocumentWorkflow."7th Approver" <> '')
              AND ((DocumentWorkflow."MD Approval" <> '') or (DocumentWorkflow."MD Approval" = '')) AND ((DocumentWorkflow."Approval Limit" = 0) or (DocumentWorkflow."Approval Limit" > DocAmount)) THEN
                LevelsApproval7(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc)
            else
                if (DocumentWorkflow."1st Approver" <> '') AND (DocumentWorkflow."2nd Approver" <> '')
                  AND (DocumentWorkflow."3rd Approver" <> '') AND (DocumentWorkflow."4th Approver" <> '')
                  AND (DocumentWorkflow."5th Approver" <> '') AND (DocumentWorkflow."6th Approver" <> '') AND (DocumentWorkflow."7th Approver" <> '')
                  AND (DocumentWorkflow."MD Approval" <> '') AND (DocumentWorkflow."Approval Limit" < DocAmount) THEN
                    LevelsApproval7MD(TableID, DocNo, RecID, DocDate, DocAmount, DocDesc);


            //SendApprovalRequestNotification(Apprv1,DocNo,DocDesc);

            //Checks first if Table ID is listed among those that
            //uses another email notification template while sending
            //for approval request
            UseAnotherApprovalNotificationTemplate(TableID);
            if UseAnotherMailTemplate <> true THEN //if table ID is not listed,
                                                   //the default Document Workflow
                                                   //Notification template is used
                SendApprovalRequestNotification(Apprv1, DocNo, DocDesc);
        end;
    end;
    #endregion SendApprovalRequest

    #region LevelsApproval1
    procedure LevelsApproval1(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;
    #endregion LevelsApproval1

    procedure LevelsApproval1MD(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntryMD.INIT();
            DocumentApprovalEntryMD.Sequence := 2;
            DocumentApprovalEntryMD."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntryMD."Document No." := DocNo;
            DocumentApprovalEntryMD."Record ID to Approve" := RecID;
            DocumentApprovalEntryMD.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntryMD.Approver := DocumentWorkflow."MD Approval";
            DocumentApprovalEntryMD."Approval Status" := DocumentApprovalEntryMD."Approval Status"::Pending;
            DocumentApprovalEntryMD."Document Date" := DocDate;
            DocumentApprovalEntryMD."Document Amount" := DocAmount;
            DocumentApprovalEntryMD."Document Description" := DocDesc;
            DocumentApprovalEntryMD."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntryMD.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;

    #region LevelsApproval2    
    procedure LevelsApproval2(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry2."Document Description" := DocDesc;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;
    #endregion LevelsApproval2

    procedure LevelsApproval2MD(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry2."Document Description" := DocDesc;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntryMD.INIT();
            DocumentApprovalEntryMD.Sequence := 3;
            DocumentApprovalEntryMD."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntryMD."Document No." := DocNo;
            DocumentApprovalEntryMD."Record ID to Approve" := RecID;
            DocumentApprovalEntryMD.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntryMD.Approver := DocumentWorkflow."MD Approval";
            DocumentApprovalEntryMD."Approval Status" := DocumentApprovalEntryMD."Approval Status"::Pending;
            DocumentApprovalEntryMD."Document Date" := DocDate;
            DocumentApprovalEntryMD."Document Amount" := DocAmount;
            DocumentApprovalEntryMD."Document Description" := DocDesc;
            DocumentApprovalEntryMD."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntryMD.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;

    #region LevelsApproval3
    procedure LevelsApproval3(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry2."Document Description" := DocDesc;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry3."Document Description" := DocDesc;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;
    #endregion LevelsApproval3

    procedure LevelsApproval3MD(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry2."Document Description" := DocDesc;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry3."Document Description" := DocDesc;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntryMD.INIT();
            DocumentApprovalEntryMD.Sequence := 4;
            DocumentApprovalEntryMD."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntryMD."Document No." := DocNo;
            DocumentApprovalEntryMD."Record ID to Approve" := RecID;
            DocumentApprovalEntryMD.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntryMD.Approver := DocumentWorkflow."MD Approval";
            DocumentApprovalEntryMD."Approval Status" := DocumentApprovalEntryMD."Approval Status"::Pending;
            DocumentApprovalEntryMD."Document Date" := DocDate;
            DocumentApprovalEntryMD."Document Amount" := DocAmount;
            DocumentApprovalEntryMD."Document Description" := DocDesc;
            DocumentApprovalEntryMD."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntryMD.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;

    #region LevelsApproval4
    procedure LevelsApproval4(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntry4.INIT();
            DocumentApprovalEntry4.Sequence := 4;
            DocumentApprovalEntry4."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry4."Document No." := DocNo;
            DocumentApprovalEntry4."Record ID to Approve" := RecID;
            DocumentApprovalEntry4.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry4.Approver := DocumentWorkflow."4th Approver";
            DocumentApprovalEntry4."Approval Status" := DocumentApprovalEntry4."Approval Status"::Pending;
            DocumentApprovalEntry4."Document Date" := DocDate;
            DocumentApprovalEntry4."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry4."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry4.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;
    #endregion LevelsApproval4

    procedure LevelsApproval4MD(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntry4.INIT();
            DocumentApprovalEntry4.Sequence := 4;
            DocumentApprovalEntry4."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry4."Document No." := DocNo;
            DocumentApprovalEntry4."Record ID to Approve" := RecID;
            DocumentApprovalEntry4.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry4.Approver := DocumentWorkflow."4th Approver";
            DocumentApprovalEntry4."Approval Status" := DocumentApprovalEntry4."Approval Status"::Pending;
            DocumentApprovalEntry4."Document Date" := DocDate;
            DocumentApprovalEntry4."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry4."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry4.INSERT();

            DocumentApprovalEntryMD.INIT();
            DocumentApprovalEntryMD.Sequence := 5;
            DocumentApprovalEntryMD."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntryMD."Document No." := DocNo;
            DocumentApprovalEntryMD."Record ID to Approve" := RecID;
            DocumentApprovalEntryMD.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntryMD.Approver := DocumentWorkflow."MD Approval";
            DocumentApprovalEntryMD."Approval Status" := DocumentApprovalEntryMD."Approval Status"::Pending;
            DocumentApprovalEntryMD."Document Date" := DocDate;
            DocumentApprovalEntryMD."Document Amount" := DocAmount;
            DocumentApprovalEntryMD."Document Description" := DocDesc;
            DocumentApprovalEntryMD."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntryMD.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;

    #region LevelsApproval5
    procedure LevelsApproval5(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntry4.INIT();
            DocumentApprovalEntry4.Sequence := 4;
            DocumentApprovalEntry4."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry4."Document No." := DocNo;
            DocumentApprovalEntry4."Record ID to Approve" := RecID;
            DocumentApprovalEntry4.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry4.Approver := DocumentWorkflow."4th Approver";
            DocumentApprovalEntry4."Approval Status" := DocumentApprovalEntry4."Approval Status"::Pending;
            DocumentApprovalEntry4."Document Date" := DocDate;
            DocumentApprovalEntry4."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry4."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry4.INSERT();

            DocumentApprovalEntry5.INIT();
            DocumentApprovalEntry5.Sequence := 5;
            DocumentApprovalEntry5."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry5."Document No." := DocNo;
            DocumentApprovalEntry5."Record ID to Approve" := RecID;
            DocumentApprovalEntry5.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry5.Approver := DocumentWorkflow."5th Approver";
            DocumentApprovalEntry5."Approval Status" := DocumentApprovalEntry5."Approval Status"::Pending;
            DocumentApprovalEntry5."Document Date" := DocDate;
            DocumentApprovalEntry5."Document Amount" := DocAmount;
            DocumentApprovalEntry5."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry5.INSERT();

        end;
        MESSAGE(ApprovalRequestMsg);
    end;
    #endregion LevelsApproval5

    procedure LevelsApproval5MD(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntry4.INIT();
            DocumentApprovalEntry4.Sequence := 4;
            DocumentApprovalEntry4."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry4."Document No." := DocNo;
            DocumentApprovalEntry4."Record ID to Approve" := RecID;
            DocumentApprovalEntry4.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry4.Approver := DocumentWorkflow."4th Approver";
            DocumentApprovalEntry4."Approval Status" := DocumentApprovalEntry4."Approval Status"::Pending;
            DocumentApprovalEntry4."Document Date" := DocDate;
            DocumentApprovalEntry4."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := DocDesc;
            DocumentApprovalEntry4."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry4.INSERT();

            DocumentApprovalEntry5.INIT();
            DocumentApprovalEntry5.Sequence := 5;
            DocumentApprovalEntry5."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry5."Document No." := DocNo;
            DocumentApprovalEntry5."Record ID to Approve" := RecID;
            DocumentApprovalEntry5.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry5.Approver := DocumentWorkflow."5th Approver";
            DocumentApprovalEntry5."Approval Status" := DocumentApprovalEntry5."Approval Status"::Pending;
            DocumentApprovalEntry5."Document Date" := DocDate;
            DocumentApprovalEntry5."Document Amount" := DocAmount;
            DocumentApprovalEntry5."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry5.INSERT();

            DocumentApprovalEntryMD.INIT();
            DocumentApprovalEntryMD.Sequence := 6;
            DocumentApprovalEntryMD."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntryMD."Document No." := DocNo;
            DocumentApprovalEntryMD."Record ID to Approve" := RecID;
            DocumentApprovalEntryMD.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntryMD.Approver := DocumentWorkflow."MD Approval";
            DocumentApprovalEntryMD."Approval Status" := DocumentApprovalEntryMD."Approval Status"::Pending;
            DocumentApprovalEntryMD."Document Date" := DocDate;
            DocumentApprovalEntryMD."Document Amount" := DocAmount;
            DocumentApprovalEntryMD."Document Description" := DocDesc;
            DocumentApprovalEntryMD."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntryMD.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;

    #region LevelsApproval6
    procedure LevelsApproval6(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntry4.INIT();
            DocumentApprovalEntry4.Sequence := 4;
            DocumentApprovalEntry4."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry4."Document No." := DocNo;
            DocumentApprovalEntry4."Record ID to Approve" := RecID;
            DocumentApprovalEntry4.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry4.Approver := DocumentWorkflow."4th Approver";
            DocumentApprovalEntry4."Approval Status" := DocumentApprovalEntry4."Approval Status"::Pending;
            DocumentApprovalEntry4."Document Date" := DocDate;
            DocumentApprovalEntry4."Document Amount" := DocAmount;
            DocumentApprovalEntry4."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry4.INSERT();

            DocumentApprovalEntry5.INIT();
            DocumentApprovalEntry5.Sequence := 5;
            DocumentApprovalEntry5."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry5."Document No." := DocNo;
            DocumentApprovalEntry5."Record ID to Approve" := RecID;
            DocumentApprovalEntry5.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry5.Approver := DocumentWorkflow."5th Approver";
            DocumentApprovalEntry5."Approval Status" := DocumentApprovalEntry5."Approval Status"::Pending;
            DocumentApprovalEntry5."Document Date" := DocDate;
            DocumentApprovalEntry5."Document Amount" := DocAmount;
            DocumentApprovalEntry5."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry5.INSERT();

            DocumentApprovalEntry6.INIT();
            DocumentApprovalEntry6.Sequence := 6;
            DocumentApprovalEntry6."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry6."Document No." := DocNo;
            DocumentApprovalEntry6."Record ID to Approve" := RecID;
            DocumentApprovalEntry6.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry6.Approver := DocumentWorkflow."6th Approver";
            DocumentApprovalEntry6."Approval Status" := DocumentApprovalEntry6."Approval Status"::Pending;
            DocumentApprovalEntry6."Document Date" := DocDate;
            DocumentApprovalEntry6."Document Amount" := DocAmount;
            DocumentApprovalEntry6."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry6.INSERT();

        end;
        MESSAGE(ApprovalRequestMsg);
    end;
    #endregion LevelsApproval6

    procedure LevelsApproval6MD(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntry4.INIT();
            DocumentApprovalEntry4.Sequence := 4;
            DocumentApprovalEntry4."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry4."Document No." := DocNo;
            DocumentApprovalEntry4."Record ID to Approve" := RecID;
            DocumentApprovalEntry4.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry4.Approver := DocumentWorkflow."4th Approver";
            DocumentApprovalEntry4."Approval Status" := DocumentApprovalEntry4."Approval Status"::Pending;
            DocumentApprovalEntry4."Document Date" := DocDate;
            DocumentApprovalEntry4."Document Amount" := DocAmount;
            DocumentApprovalEntry4."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry4.INSERT();

            DocumentApprovalEntry5.INIT();
            DocumentApprovalEntry5.Sequence := 5;
            DocumentApprovalEntry5."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry5."Document No." := DocNo;
            DocumentApprovalEntry5."Record ID to Approve" := RecID;
            DocumentApprovalEntry5.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry5.Approver := DocumentWorkflow."5th Approver";
            DocumentApprovalEntry5."Approval Status" := DocumentApprovalEntry5."Approval Status"::Pending;
            DocumentApprovalEntry5."Document Date" := DocDate;
            DocumentApprovalEntry5."Document Amount" := DocAmount;
            DocumentApprovalEntry5."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry5.INSERT();

            DocumentApprovalEntry6.INIT();
            DocumentApprovalEntry6.Sequence := 6;
            DocumentApprovalEntry6."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry6."Document No." := DocNo;
            DocumentApprovalEntry6."Record ID to Approve" := RecID;
            DocumentApprovalEntry6.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry6.Approver := DocumentWorkflow."6th Approver";
            DocumentApprovalEntry6."Approval Status" := DocumentApprovalEntry6."Approval Status"::Pending;
            DocumentApprovalEntry6."Document Date" := DocDate;
            DocumentApprovalEntry6."Document Amount" := DocAmount;
            DocumentApprovalEntry6."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry6.INSERT();

            DocumentApprovalEntryMD.INIT();
            DocumentApprovalEntryMD.Sequence := 7;
            DocumentApprovalEntryMD."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntryMD."Document No." := DocNo;
            DocumentApprovalEntryMD."Record ID to Approve" := RecID;
            DocumentApprovalEntryMD.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntryMD.Approver := DocumentWorkflow."MD Approval";
            DocumentApprovalEntryMD."Approval Status" := DocumentApprovalEntryMD."Approval Status"::Pending;
            DocumentApprovalEntryMD."Document Date" := DocDate;
            DocumentApprovalEntryMD."Document Amount" := DocAmount;
            DocumentApprovalEntryMD."Document Description" := DocDesc;
            DocumentApprovalEntryMD."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntryMD.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;

    #region LevelsApproval7
    procedure LevelsApproval7(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntry4.INIT();
            DocumentApprovalEntry4.Sequence := 4;
            DocumentApprovalEntry4."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry4."Document No." := DocNo;
            DocumentApprovalEntry4."Record ID to Approve" := RecID;
            DocumentApprovalEntry4.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry4.Approver := DocumentWorkflow."4th Approver";
            DocumentApprovalEntry4."Approval Status" := DocumentApprovalEntry4."Approval Status"::Pending;
            DocumentApprovalEntry4."Document Date" := DocDate;
            DocumentApprovalEntry4."Document Amount" := DocAmount;
            DocumentApprovalEntry4."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry4.INSERT();

            DocumentApprovalEntry5.INIT();
            DocumentApprovalEntry5.Sequence := 5;
            DocumentApprovalEntry5."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry5."Document No." := DocNo;
            DocumentApprovalEntry5."Record ID to Approve" := RecID;
            DocumentApprovalEntry5.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry5.Approver := DocumentWorkflow."5th Approver";
            DocumentApprovalEntry5."Approval Status" := DocumentApprovalEntry5."Approval Status"::Pending;
            DocumentApprovalEntry5."Document Date" := DocDate;
            DocumentApprovalEntry5."Document Amount" := DocAmount;
            DocumentApprovalEntry5."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry5.INSERT();

            DocumentApprovalEntry6.INIT();
            DocumentApprovalEntry6.Sequence := 6;
            DocumentApprovalEntry6."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry6."Document No." := DocNo;
            DocumentApprovalEntry6."Record ID to Approve" := RecID;
            DocumentApprovalEntry6.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry6.Approver := DocumentWorkflow."6th Approver";
            DocumentApprovalEntry6."Approval Status" := DocumentApprovalEntry6."Approval Status"::Pending;
            DocumentApprovalEntry6."Document Date" := DocDate;
            DocumentApprovalEntry6."Document Amount" := DocAmount;
            DocumentApprovalEntry6."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry6.INSERT();

            DocumentApprovalEntry7.INIT();
            DocumentApprovalEntry7.Sequence := 7;
            DocumentApprovalEntry7."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry7."Document No." := DocNo;
            DocumentApprovalEntry7."Record ID to Approve" := RecID;
            DocumentApprovalEntry7.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry7.Approver := DocumentWorkflow."7th Approver";
            DocumentApprovalEntry7."Approval Status" := DocumentApprovalEntry7."Approval Status"::Pending;
            DocumentApprovalEntry7."Document Date" := DocDate;
            DocumentApprovalEntry7."Document Amount" := DocAmount;
            DocumentApprovalEntry7."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry7.INSERT();

        end;
        MESSAGE(ApprovalRequestMsg);
    end;
    #endregion LevelsApproval7

    procedure LevelsApproval7MD(TableID: Integer; DocNo: Code[50]; RecID: RecordID; DocDate: Date; DocAmount: Decimal; DocDesc: Text[250])
    begin
        if DocumentWorkflow.GET(USERID, TableID) then begin
            DocumentApprovalEntry.INIT();
            DocumentApprovalEntry.Sequence := 1;
            DocumentApprovalEntry."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry."Document No." := DocNo;
            DocumentApprovalEntry."Record ID to Approve" := RecID;
            DocumentApprovalEntry.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry.Approver := DocumentWorkflow."1st Approver";
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Pending;
            DocumentApprovalEntry."Document Date" := DocDate;
            DocumentApprovalEntry."Document Amount" := DocAmount;
            DocumentApprovalEntry."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry.INSERT();

            DocumentApprovalEntry2.INIT();
            DocumentApprovalEntry2.Sequence := 2;
            DocumentApprovalEntry2."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry2."Document No." := DocNo;
            DocumentApprovalEntry2."Record ID to Approve" := RecID;
            DocumentApprovalEntry2.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry2.Approver := DocumentWorkflow."2nd Approver";
            DocumentApprovalEntry2."Approval Status" := DocumentApprovalEntry2."Approval Status"::Pending;
            DocumentApprovalEntry2."Document Date" := DocDate;
            DocumentApprovalEntry2."Document Amount" := DocAmount;
            DocumentApprovalEntry2."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry2.INSERT();

            DocumentApprovalEntry3.INIT();
            DocumentApprovalEntry3.Sequence := 3;
            DocumentApprovalEntry3."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry3."Document No." := DocNo;
            DocumentApprovalEntry3."Record ID to Approve" := RecID;
            DocumentApprovalEntry3.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry3.Approver := DocumentWorkflow."3rd Approver";
            DocumentApprovalEntry3."Approval Status" := DocumentApprovalEntry3."Approval Status"::Pending;
            DocumentApprovalEntry3."Document Date" := DocDate;
            DocumentApprovalEntry3."Document Amount" := DocAmount;
            DocumentApprovalEntry3."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry3.INSERT();

            DocumentApprovalEntry4.INIT();
            DocumentApprovalEntry4.Sequence := 4;
            DocumentApprovalEntry4."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry4."Document No." := DocNo;
            DocumentApprovalEntry4."Record ID to Approve" := RecID;
            DocumentApprovalEntry4.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry4.Approver := DocumentWorkflow."4th Approver";
            DocumentApprovalEntry4."Approval Status" := DocumentApprovalEntry4."Approval Status"::Pending;
            DocumentApprovalEntry4."Document Date" := DocDate;
            DocumentApprovalEntry4."Document Amount" := DocAmount;
            DocumentApprovalEntry4."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry4.INSERT();

            DocumentApprovalEntry5.INIT();
            DocumentApprovalEntry5.Sequence := 5;
            DocumentApprovalEntry5."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry5."Document No." := DocNo;
            DocumentApprovalEntry5."Record ID to Approve" := RecID;
            DocumentApprovalEntry5.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry5.Approver := DocumentWorkflow."5th Approver";
            DocumentApprovalEntry5."Approval Status" := DocumentApprovalEntry5."Approval Status"::Pending;
            DocumentApprovalEntry5."Document Date" := DocDate;
            DocumentApprovalEntry5."Document Amount" := DocAmount;
            DocumentApprovalEntry5."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry5.INSERT();

            DocumentApprovalEntry6.INIT();
            DocumentApprovalEntry6.Sequence := 6;
            DocumentApprovalEntry6."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry6."Document No." := DocNo;
            DocumentApprovalEntry6."Record ID to Approve" := RecID;
            DocumentApprovalEntry6.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry6.Approver := DocumentWorkflow."6th Approver";
            DocumentApprovalEntry6."Approval Status" := DocumentApprovalEntry6."Approval Status"::Pending;
            DocumentApprovalEntry6."Document Date" := DocDate;
            DocumentApprovalEntry6."Document Amount" := DocAmount;
            DocumentApprovalEntry6."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry6.INSERT();

            DocumentApprovalEntry7.INIT();
            DocumentApprovalEntry7.Sequence := 7;
            DocumentApprovalEntry7."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntry7."Document No." := DocNo;
            DocumentApprovalEntry7."Record ID to Approve" := RecID;
            DocumentApprovalEntry7.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntry7.Approver := DocumentWorkflow."7th Approver";
            DocumentApprovalEntry7."Approval Status" := DocumentApprovalEntry7."Approval Status"::Pending;
            DocumentApprovalEntry7."Document Date" := DocDate;
            DocumentApprovalEntry7."Document Amount" := DocAmount;
            DocumentApprovalEntry7."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntry7.INSERT();

            DocumentApprovalEntryMD.INIT();
            DocumentApprovalEntryMD.Sequence := 8;
            DocumentApprovalEntryMD."Table No." := DocumentWorkflow."Table No.";
            DocumentApprovalEntryMD."Document No." := DocNo;
            DocumentApprovalEntryMD."Record ID to Approve" := RecID;
            DocumentApprovalEntryMD.Sender := DocumentWorkflow."User ID";
            DocumentApprovalEntryMD.Approver := DocumentWorkflow."MD Approval";
            DocumentApprovalEntryMD."Approval Status" := DocumentApprovalEntryMD."Approval Status"::Pending;
            DocumentApprovalEntryMD."Document Date" := DocDate;
            DocumentApprovalEntryMD."Document Amount" := DocAmount;
            DocumentApprovalEntryMD."Document Description" := DocDesc;
            DocumentApprovalEntryMD."Document Description" := COPYSTR(DocDesc, 1, 150);
            DocumentApprovalEntryMD.INSERT();
        end;
        MESSAGE(ApprovalRequestMsg);
    end;

    #region CancelApprovalRequest
    procedure CancelApprovalRequest(TableID: Integer; DocNo: Code[50])
    begin
        DocumentApprovalEntry.reset();
        DocumentApprovalEntry.SETCURRENTKEY(Sequence, "Document No.");
        DocumentApprovalEntry.SETRANGE("Document No.", DocNo);
        if DocumentApprovalEntry.Findset() then begin
            REPEAT
                if DocumentApprovalEntry."Approval Status" <> DocumentApprovalEntry."Approval Status"::Pending then
                    if CONFIRM('The document has been approved by at least one Approver. Do you still want to cancel?', false) THEN
                        DocumentApprovalEntry.deleteall()
                    else
                        ERROR(ApprovaLCannotBeCancelledMsg);
            UNTIL DocumentApprovalEntry.next() = 0;
            if DocumentApprovalEntry."Approval Status" = DocumentApprovalEntry."Approval Status"::Pending THEN
                DocumentApprovalEntry.deleteall();
            Message('Operation is successfully completed!!!');
        END else
            ERROR('There is no pending approval request for this document');

    end;
    #endregion CancelApprovalRequest

    #region ApproveDocument
    procedure ApproveDocument(DocNo: Code[20]; DocDateTime: DateTime)
    var
        Seq: Integer;

    begin
        //to test if predecessor has approved
        Seq := 0;
        DocumentApprovalEntry.reset();
        DocumentApprovalEntry.SETCURRENTKEY("Document No.", "Approval Status", Approver);
        DocumentApprovalEntry.SETRANGE("Document No.", DocNo);
        DocumentApprovalEntry.SETRANGE(Approver, USERID);
        if DocumentApprovalEntry.Findfirst() then begin
            Seq := DocumentApprovalEntry.Sequence;
            if Seq > 1 then begin
                DocumentApprovalEntry2.SETCURRENTKEY(Sequence, "Document No.");
                DocumentApprovalEntry2.SETRANGE(Sequence, Seq - 1);
                DocumentApprovalEntry2.SETRANGE("Document No.", DocNo);
                if DocumentApprovalEntry2.Findfirst() THEN
                    if DocumentApprovalEntry2."Approval Status" = DocumentApprovalEntry2."Approval Status"::Pending THEN
                        ERROR(HoldonMsg);
            end;
        end;

        DocumentApprovalEntry.reset();
        DocumentApprovalEntry.SETCURRENTKEY("Document No.", "Approval Status", Approver);
        DocumentApprovalEntry.SETRANGE("Document No.", DocNo);
        DocumentApprovalEntry.SETRANGE(Approver, USERID);
        DocumentApprovalEntry.SETRANGE("Approval Status", DocumentApprovalEntry."Approval Status"::Pending);
        if DocumentApprovalEntry.Findfirst() then begin
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Approved;
            DocumentApprovalEntry."Document Date & Time" := CURRENTDATETIME;
            DocumentApprovalEntry.modify();
        //    Sender := DocumentApprovalEntry.Sender;
            MESSAGE(DocApprovedMsg);
        end else
            ERROR('There is no pending approval entry for the document!');


        //Check if there is another approver and notify the next()approver
        DocumentApprovalEntry.reset();
        DocumentApprovalEntry.SETCURRENTKEY("Document No.", "Approval Status", Approver);
        DocumentApprovalEntry.SETRANGE("Document No.", DocNo);
        DocumentApprovalEntry.SETRANGE(Sequence, Seq + 1);
        DocumentApprovalEntry.SETRANGE("Approval Status", DocumentApprovalEntry."Approval Status"::Pending);
        if DocumentApprovalEntry.Findfirst() then begin
            DocApprv.reset();
            DocApprv.GET(DocumentApprovalEntry.Approver);
            //SendApprovalRequestNotification(DocApprv,DocNo,DocumentApprovalEntry."Document Description");

            //Checks first if Table ID is listed among those that
            //uses another email notification template while sending
            //for approval request
            MESSAGE('Please be informed that %1 has been notified of this approval', DocumentApprovalEntry.Approver);
            UseAnotherApprovalNotificationTemplate(DocumentApprovalEntry."Table No.");
            if UseAnotherMailTemplate <> true THEN //if table ID is not listed,
                                                   //the default Document Workflow
                                                   //Notification template is used
                SendApprovalRequestNotification(DocApprv, DocNo, DocumentApprovalEntry."Document Description");
        end;
    end;
    #endregion ApproveDocument

    #region RejectDocument
    procedure RejectDocument(DocNo: Code[50])
    var
        Seq: Integer;

    begin
        DocumentApprovalEntry.reset();
        DocumentApprovalEntry.SETCURRENTKEY("Document No.", "Approval Status", Approver);
        DocumentApprovalEntry.SETRANGE("Document No.", DocNo);
        DocumentApprovalEntry.SETRANGE(Approver, USERID);
        if DocumentApprovalEntry.Findfirst() then begin
            Seq := DocumentApprovalEntry.Sequence;
            if Seq > 1 then begin
                DocumentApprovalEntry2.SETCURRENTKEY(Sequence, "Document No.");
                DocumentApprovalEntry2.SETRANGE(Sequence, Seq - 1);
                DocumentApprovalEntry2.SETRANGE("Document No.", DocNo);
                if DocumentApprovalEntry2.Findfirst() THEN
                    if DocumentApprovalEntry2."Approval Status" = DocumentApprovalEntry2."Approval Status"::Pending THEN
                        ERROR(HoldonMsg);
            end;
        end;

        DocumentApprovalEntry.reset();
        DocumentApprovalEntry.SETCURRENTKEY("Document No.", "Approval Status", Approver);
        DocumentApprovalEntry.SETRANGE("Document No.", DocNo);
        DocumentApprovalEntry.SETRANGE(Approver, USERID);
        DocumentApprovalEntry.SETRANGE("Approval Status", DocumentApprovalEntry."Approval Status"::Pending);
        if DocumentApprovalEntry.Findfirst() then begin
            DocumentApprovalEntry."Approval Status" := DocumentApprovalEntry."Approval Status"::Rejected;
            DocumentApprovalEntry.modify();
        //    Sender := DocumentApprovalEntry.Sender;
            MESSAGE(DocRejectedMsg);
        end else
            ERROR('There is no pending approval entry for the document!');

        //     //send mail to the INIT()iator about this rejected approval
        //     UserSetup.GET(Sender);
        //     SenderEmail.add(UserSetup."E-Mail");
        //     SenderName := UserSetup."Full Name";
        //     SentBy.GET(USERID);
        //     DocumentApprovalEntry.reset();
        //     DocumentApprovalEntry.SETCURRENTKEY("Document No.", "Approval Status", Approver);
        //     DocumentApprovalEntry.SETRANGE("Document No.", DocNo);
        //     if NOT DocumentApprovalEntry.Findfirst() then begin
        //         Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page,
        //                 PAGE::"REI-Document Approval Entries", DocumentApprovalEntry);
        //         hyperlinkText := STRSUBSTNO('<a href=' + Link + '>' +
        //                     'Click here to view rejected record.</a>');


        //         Subject := STRSUBSTNO(Text014, DocNo);
        //         EmailMessage.Create(SenderEmail, Subject, '', true);
        //         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(DearLbl + SenderName + ',')));
        //         EmailMessage.AppendToBody('<br><br>');
        //         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(Text015, DocNo)));
        //         EmailMessage.AppendToBody('<br><br>');
        //         EmailMessage.AppendToBody(FORMAT(Text016));
        //         EmailMessage.AppendToBody('<br><br>');
        //         EmailMessage.AppendToBody(hyperlinkText);
        //         EmailMessage.AppendToBody('<br><br>');
        //         EmailMessage.AppendToBody('Regards');
        //         EmailMessage.AppendToBody('<br><br>');
        //         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SentBy."Full Name")));
        //         EmailMessage.AppendToBody('<HR>');
        //         EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SystemgeneratedlLbl)));
        //         if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) THEN
        //             MESSAGE('%1 has been notified of this final approval.', SenderName);
        //     end;
    end;
    #endregion RejectDocument

    #region ApprovalStatusCheck
    procedure ApprovalStatusCheck(TableID: Integer; DocNo: Code[50]; RecID: RecordID): Boolean
    begin
        DocumentApprovalEntry7.SETCURRENTKEY(Sequence, "Document No.");
        DocumentApprovalEntry7.SETRANGE("Document No.", DocNo);
        DocumentApprovalEntry7.FINDLAST();
        if DocumentApprovalEntry7."Approval Status" = DocumentApprovalEntry7."Approval Status"::Approved THEN
            EXIT(true)
        else
            EXIT(false)

    end;
    #endregion ApprovalStatusCheck

    #region SendApprovalRequestNotification
    procedure SendApprovalRequestNotification(Recipient: Record "User Setup"; DocNo: Code[20]; Description: Text[250])
    var
        hyperlinkText: Text;
        Link: Text;
        ApprovalLbl: Label 'Click here to review the document', comment = '%1 = Link';
        DocApproval2Lbl: Label 'Document No. %1 with description (%2) requires your approval.', Comment = '%1 = DocNo %2 = Description';
    begin
        if SentBy.GET(USERID) THEN;
        Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page,
                    PAGE::REIDocumentApprovalEntries, DocumentApprovalEntry);
        hyperlinkText := STRSUBSTNO(ApprovalLbl);

        Clear(Recipients);
        Recipients.Add(Recipient."E-Mail");

        Subject := STRSUBSTNO(DocApproval2Lbl, DocNo, Description);
        EmailMessage.Create(Recipients, Subject, '', true);
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(DearLbl + Recipient."Full Name" + ',')));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(DocApprovalBodylLbl, DocNo)));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(hyperlinkText);
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody('Regards');
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SentBy."Full Name")));
        EmailMessage.AppendToBody('<HR>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SystemgeneratedlLbl)));
        if Email.Send(EmailMessage, Enum::"Email Scenario"::Default) THEN;
    end;
    #endregion SendApprovalRequestNotification

    #region ReopenApproval
    procedure ReopenApproval(DocNo: Code[50])
    begin
        DocumentApprovalEntry.reset();
        DocumentApprovalEntry.SETCURRENTKEY(Sequence, "Document No.");
        DocumentApprovalEntry.SETRANGE("Document No.", DocNo);
        if DocumentApprovalEntry.Findset() THEN
            DocumentApprovalEntry.deleteall();
        MESSAGE(ApprovalResetMsg);
    end;
    #endregion ReopenApproval

    #region PendingApprovalEntryExistsForCurrUser
    procedure PendingApprovalEntryExistsForCurrUser(var DocumentApprovalEntryLocal: Record "REIDocumentApprovalEntry"; RecordID: RecordID): Boolean
    begin
        DocumentApprovalEntryLocal.SETRANGE("Table No.", RecordID.TABLENO);
        DocumentApprovalEntryLocal.SETRANGE("Record ID to Approve", RecordID);
        DocumentApprovalEntryLocal.SETRANGE("Approval Status", DocumentApprovalEntry."Approval Status"::Pending);
        DocumentApprovalEntryLocal.SETRANGE(Approver, USERID);

        EXIT(DocumentApprovalEntry.Findfirst());
    end;
    #endregion PendingApprovalEntryExistsForCurrUser

    #region SendPaymentNotificationToFinance
    procedure SendPaymentNotificationToFinance(Recipient: Record "User Setup"; DocNo: Code[50]; Description: Text[100])
    var
        Recipient1: List of [Text];
        hyperlinkText: Text;
        ApprovalLbl: Label 'Click here to review the document', comment = '%1 = Link';
        Link: Text;
        DocRequireApprovalLbl: Label 'Document No. %1 requires your urgent payment processing.', Comment = '%1 = DocNo';
    begin
        HRSetup.Get();
        HRSetup.TESTFIELD("Finance Officer Email");
        Recipient1.add(HRSetup."FA Team E-mail");

        Link := GETURL(CLIENTTYPE::Web, COMPANYNAME, OBJECTTYPE::Page,
                    PAGE::REIDocumentApprovalEntries, DocumentApprovalEntry);
        hyperlinkText := STRSUBSTNO(ApprovalLbl);

        if SentBy.GET(USERID) THEN;
        Subject := STRSUBSTNO(DocRequireApprovalLbl, DocNo);
        EmailMessage.Create(Recipient1, Subject, '', true);
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO('Dear ' + HRSetup."Finance Officer First Name" + ',')));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(PaymentProcessingBodyMsg, DocNo)));
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody('Regards');
        EmailMessage.AppendToBody('<br><br>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SentBy."Full Name")));
        EmailMessage.AppendToBody('<HR>');
        EmailMessage.AppendToBody(FORMAT(STRSUBSTNO(SystemgeneratedlLbl)));
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default)
    end;
    #endregion SendPaymentNotificationToFinance

    #region UseAnotherApprovalNotificationTemplate
    local procedure UseAnotherApprovalNotificationTemplate(TableID: Integer)
    var
        ListOFExcludedTables: Record "REIAnotherMailTemplate";
    begin
        /*if TableID IN [50016, 50018, 50201, 50210, 50251, 50300, 50351, 50400, 50450, 50500, 50550, 50600,50651,60353,60366, 5740, 50265] THEN
            UseAnotherMailTemplate := true
        else
            UseAnotherMailTemplate := false;*/

        //The following will allow us exclude table from the user interface and still function as above
        ListOFExcludedTables.Reset();
        ListOFExcludedTables.SetRange("Table ID", TableID);
        if ListOFExcludedTables.IsEmpty() then
            UseAnotherMailTemplate := true
        else
            UseAnotherMailTemplate := false;
    end;

    local procedure CheckifApprovalEntryExists(TableID: Integer; DocNo: Code[50]) 
    var
        DocAppEntry: Record "REIDocumentApprovalEntry";
    begin
        DocAppEntry.Reset();
        DocAppEntry.SetRange("Table No.",TableID);
        DocAppEntry.SetRange("Document No.",DocNo);
        if DocAppEntry.IsEmpty then
            Error('There exists at least one approval entry for this record, you can either cancel the approval or re-open the document!!!');
    end;
    #endregion UseAnotherApprovalNotificationTemplate
}