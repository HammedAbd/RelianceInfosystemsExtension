page 70976590 REIDocApprovalWFFactbox
{

    Caption = 'Document Approval WF Factbox';
    Editable = false;
    PageType = ListPart;
    SourceTable = REIDocumentApprovalEntry;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(ContentArea)
            {
                field(DocumentHeading; DocumentHeading)
                {
                    ApplicationArea = All;
                    Caption = 'Document';
                    ToolTip = 'Specifies the document that has been approved.';
                    Editable = false;
                }
            }
            repeater(Group)
            {
                field(Sequence; Rec.Sequence)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sequence field.';
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sender field.';
                }
                field(Approver; Rec.Approver)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approver field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Document Date & Time"; Rec."Document Date & Time")
                {
                    ApplicationArea = All;
                    Caption = 'Approval Date & Time';
                    ToolTip = 'Specifies the value of the Approval Date & Time field.';
                }
            }
        }
    }
    var
        DocumentHeading: Text;
        Text000Lbl: Label 'Document';

    local procedure GetDocumentHeading(DocApprovalEntry: Record REIDocumentApprovalEntry): Text;
    var
        Heading: Text;
    begin

        Heading := Text000Lbl + '-' + DocApprovalEntry."Document No.";
        exit(Heading);
    end;

    procedure UpdateApprovalEntriesFromSourceRecord(SourceRecordID: RecordID);
    var
        ApprovalEntry: Record REIDocumentApprovalEntry;
    begin
        Rec.SETRANGE("Record ID to Approve", SourceRecordID);
        ApprovalEntry.COPY(Rec);
        if ApprovalEntry.FINDFIRST() then
            Rec.SETFILTER(Approver, '<>%1', ApprovalEntry.Sender);
        if Rec.FINDLAST() then;
        CurrPage.UPDATE(false);
    end;

    trigger OnFindRecord(DocumentHeadingLocal: Text): Boolean
    begin
        DocumentHeadingLocal := '';
        exit(Rec.FINDLAST());
    end;

    trigger OnAfterGetRecord()
    begin
        DocumentHeading := GetDocumentHeading(Rec);
    end;
}