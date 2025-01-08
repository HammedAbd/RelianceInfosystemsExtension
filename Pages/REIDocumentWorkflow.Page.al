page 70976586 REIDocumentWorkflow
{
    PageType = List;
    SourceTable = REIDocumentWorkflow;
    Caption = 'Document Workflow';
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                    Caption = 'User ID';
                    ToolTip = 'Specifies the requester's User ID';
                }
                field("Table No."; Rec."Table No.")
                {
                    ApplicationArea = All;
                    Caption = 'Table No.';
                    ToolTip = 'Specifies the Table No.';
                }
                field("Table Name"; Rec."Table Name")
                {
                    ApplicationArea = All;
                    Caption = 'Table Name';
                    ToolTip = 'Specifies the Table Name';
                }
                field("1st Approver"; Rec."1st Approver")
                {
                    ApplicationArea = All;
                    Caption = '1st Approver';
                    ToolTip = 'Specifies the 1st Approver of the record';
                }
                field("2nd Approver"; Rec."2nd Approver")
                {
                    ApplicationArea = All;
                    Caption = '2nd Approver';
                    ToolTip = 'Specifies the 2nd Approver of the record';
                }
                field("3rd Approver"; Rec."3rd Approver")
                {
                    ApplicationArea = All;
                    Caption = '3rd Approver';
                    ToolTip = 'Specifies the 3rd Approver of the record';
                }
                field("4th Approver"; Rec."4th Approver")
                {
                    ApplicationArea = All;
                    Caption = '4th Approver';
                    ToolTip = 'Specifies the 4th Approver of the record';
                }
                field("5th Approver"; Rec."5th Approver")
                {
                    ApplicationArea = All;
                    Caption = '5th Approver';
                    ToolTip = 'Specifies the 5th Approver of the record';
                }
                field("6th Approver"; Rec."6th Approver")
                {
                    ApplicationArea = All;
                    Caption = '6th Approver';
                    ToolTip = 'Specifies the 6th Approver of the record';
                }
                field("7th Approver"; Rec."7th Approver")
                {
                    ApplicationArea = All;
                    Caption = '7th Approver';
                    ToolTip = 'Specifies the 7th Approver of the record';
                }
                field("MD Approval"; Rec."MD Approval")
                {
                    ApplicationArea = All;
                    Caption = 'MD Approver';
                    ToolTip = 'Specifies MD as the Approver of the record';
                }
                field("Approval Limit"; Rec."Approval Limit")
                {
                    ApplicationArea = All;
                    Caption = 'Approval Limit';
                    ToolTip = 'Specifies the value of the Approval Limit field.';
                }
                field(Enable; Rec.Enable)
                {
                    Visible = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Enable field.';
                }
            }
        }
    }

    actions
    {
    }
}

