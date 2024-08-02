page 70976592 REIFinAccountAssisted
{
    ApplicationArea = Basic, Suite;
    Caption = 'FA Assisted';
    PageType = List;
    SourceTable = "User Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                ShowCaption = false;
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic, Suite;
                    LookupPageID = "User Lookup";
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                }
                field("View COA"; Rec."View COA")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view chart of account data.';
                }
                field("View CLE"; Rec."View CLE")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view customer ledger data.';
                }
                field("View VLE"; Rec."View VLE")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view vendor ledger data.';
                }
                field("View ILE"; Rec."View ILE")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view item ledger data.';
                }
                field("View Customer"; Rec."View Customer")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view customer data.';
                }
                field("View Vendor"; Rec."View Vendor")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view vendor data.';
                }

                field("View BE"; Rec."View BE")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view budget entry data.';
                }
                field("View PO"; Rec."View PO")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view purchase order data.';
                }
                field("View Bank Account List"; Rec."View Bank Account List")
                {
                    ToolTip = 'Specifies the value of the View Bank Account List field.';
                }
                field("View SO"; Rec."View SO")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view sales order data.';
                }
                field("View Item"; Rec."View Item")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view item data.';
                }
                field("View PReceipt"; Rec."View PReceipt")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view purchase receipt data.';
                    Caption = 'Purchase Receipt';
                }
                field("View GL"; Rec."View GL")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view general ledger data.';
                }
                field("View JBatch"; Rec."View JBatch")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view general journal batch data.';
                }
                field("View JTemplate"; Rec."View JTemplate")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view general journal template data.';
                }
                field("View Journal"; Rec."View Journal")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view general journal line data.';
                }
                field("View Posting Group"; Rec."View PGroup")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view posting group data.';
                }
                field("View Fixed Asset"; Rec."View Fixed Asset")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view fixed asset data.';
                }
                field("View FA Ledger"; Rec."View FA Ledger")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view fixed asset ledger data.';
                }
                field("View GLRegister"; Rec."View GLRegister")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies access to view general ledger register data.';
                }



            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.HideExternalUsers();
    end;
}

