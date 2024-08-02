page 70976595 REIRequesterDocEntries
{
    Editable = false;
    PageType = List;
    UsageCategory = History;
    SourceTable = REIDocumentApprovalEntry;
    SourceTableView = sorting(Sequence, "Document No.")
                      order(ascending)
                      where("Approval Status" = filter(Rejected | Pending | Approved));
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Sequence; Rec.Sequence)
                {
                    ApplicationArea = All;
                    Caption = 'Sequence';
                    ToolTip = 'Specifies the record sequence of approval';
                }
                field("Table No."; Rec."Table No.")
                {
                    ApplicationArea = All;
                    Caption = 'Table No.';
                    ToolTip = 'Specifies the record Table No.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = All;
                    Caption = 'Document No.';
                    ToolTip = 'Specifies the record Document No.';
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    Caption = 'Sender';
                    ToolTip = 'Specifies the Sender';
                }
                field(Approver; Rec.Approver)
                {
                    ApplicationArea = All;
                    Caption = 'Approver';
                    ToolTip = 'Specifies the record Approver';
                }
                field("Document Description"; Rec."Document Description")
                {
                    ApplicationArea = All;
                    Caption = 'Document Description';
                    ToolTip = 'Specifies the record Document Description';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = All;
                    Caption = 'Approval Status';
                    ToolTip = 'Specifies the record Approval Status';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = All;
                    Caption = 'Document Date';
                    ToolTip = 'Specifies the record Document Date';
                }
                field("Document Amount"; Rec."Document Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Document Amount';
                    ToolTip = 'Specifies the record Document Amount';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Show")
            {
                Caption = '&Show';
                Image = View;
                action("View Record to Approve")
                {
                    ApplicationArea = Suite;
                    Caption = 'View Record to Approve';
                    Image = Document;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                    ToolTip = 'Open the document that the approval request is for.';

                    trigger OnAction()
                    var
                        PubAppEntry: Codeunit REIDocumentWfEventsPubAndSub;
                    begin
                        PubAppEntry.PublishCurrentDocAppEntryRecFromDocAppEntriesPage(
                                            Rec,
                                            Rec."Table No.",
                                            Rec.Sequence,
                                            Rec."Document No.",
                                            Rec."Approval Status");
                        Rec.ShowRecord();
                    end;
                }
            }
        }
    }

    procedure InitializeRecord(IncomingRec: Record REIDocumentApprovalEntry)
    begin
        Rec := IncomingRec;
        Rec.FindSet();
    end;
}

