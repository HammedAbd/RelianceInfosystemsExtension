page 70976577 REIHREmployeesFactbox
{
    PageType = CardPart;
    SourceTable = Employee;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field("No."; Rec."No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. field.';
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the First Name field.';
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Middle Name field.';
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Last Name field.';
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Email field.';
            }
            field("Company E-Mail"; Rec."Company E-Mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Company Email field.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Status field.';
            }
            field("Job Title"; Rec."Job Title")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Title field.';
            }
        }
    }
}

