page 70976594 REIApproverDocEntries
{
    Editable = false;
    UsageCategory = History;
    PageType = List;
    SourceTable = REIDocumentApprovalEntry;
    SourceTableView = sorting(Sequence, "Document No.")
                      order(Ascending)
                      WHERE("Approval Status" = FILTER(Pending | Approved));
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
                field(Approver; Rec.Approver)
                {
                    ApplicationArea = All;
                    Caption = 'Approver';
                    ToolTip = 'Specifies the record Approver';
                }
                field(Sender; Rec.Sender)
                {
                    ApplicationArea = All;
                    Caption = 'Sender';
                    ToolTip = 'Specifies the Sender';
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
                    ToolTip = 'Open the document that the approval request is for.';
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;

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

    var
    procedure InitializeRecord(IncomingRec: Record REIDocumentApprovalEntry)
    begin
        Rec := IncomingRec;
        Rec.FindSet();
    end;
}

