table 70976577 REIDocumentApprovalEntry
{
    DrillDownPageID = REIDocumentApprovalEntries;
    LookupPageID = REIDocumentApprovalEntries;

    fields
    {
        field(70976575; Sequence;Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70976576; "Table No.";Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70976577; "Document No.";Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70976578;Sender;Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70976579;Approver;Code[50])
        {
            DataClassification = CustomerContent;
        }
        field(70976580;"Approval Status";Option)
        {
            DataClassification = CustomerContent;
            OptionCaption = ' ,Pending,Approved,Rejected';
            OptionMembers = " ",Pending,Approved,Rejected;
        }
        field(70976581;"Record ID to Approve";RecordID)
        {
            DataClassification = CustomerContent;
        }
        field(70976582;"Document Date";Date)
        {
            DataClassification = CustomerContent;
        }
        field(70976583;"Document Amount";Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70976584;"Document Description";Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70976585;"Document Date & Time";DateTime)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1;Sequence,"Document No.")
        {
        }
        key(Key2;"Document No.","Approval Status",Approver)
        {
        }
    }

    fieldgroups
    {
    }

    var
        PageManagement: Codeunit 700;

    procedure ShowRecord()
    var
        RecRef: RecordRef;
    begin
        IF NOT RecRef.GET("Record ID to Approve") THEN
          EXIT;
        RecRef.SetRecFilter();
        PageManagement.PageRun(RecRef);
    end;
}

