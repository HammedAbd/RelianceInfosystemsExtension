page 70976585 REIHRPayUserSetup
{
    ApplicationArea = Basic, Suite;
    Caption = 'HR Pay User Setup';
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
                field("HR Manager"; Rec."HR Manager")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the HR Manager field.';
                }
                field("Salary Setup"; Rec."Salary Setup")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Salary Setup field.';
                }
                field("Payroll Officer"; Rec."Payroll Officer")
                {
                    ApplicationArea = Basic, Suite;
                    ToolTip = 'Specifies the value of the Payroll Officer field.';
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

