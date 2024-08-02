page 70976582 REICustomSetup
{
    ApplicationArea = All;
    Caption = 'Custom Setup';
    PageType = List;
    CardPageId = REICustomSetupCard;
    SourceTable = REICustomSetup;
    UsageCategory = Administration;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Complaint No. field.';
                }
                field("Foreman E-mail"; Rec."Foreman E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Foreman E-mail field.';
                }
                field("Service Advisor E-mail"; Rec."Service Advisor E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Advisor E-mail field.';
                }
                field("Technician E-mail"; Rec."Technician E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Technician E-mail field.';
                }
                field("VPU E-mail"; Rec."VPU E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VPU E-mail field.';
                }
                field("Retail Sales No."; Rec."Retail Sales No.")
                {
                    ToolTip = 'Specifies the value of the Retail Sales No. field.';
                }
                field("Lubricant Sales No."; Rec."Lubricant Sales No.")
                {
                    ToolTip = 'Specifies the value of the Lubricant Sales No. field.';
                }
                field("Inventory E-mail"; Rec."Inventory Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VPU E-mail field.';
                }
                field("Workshop Manager E-mail"; Rec."Workshop Manager E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Workshop Manager E-mail field.';
                }
                field("Request for Quote Nos."; Rec."Request for Quote Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request for Quote field.';
                }
                field("Quote Evaluation Nos."; Rec."Quote Evaluation Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quote Evaluation Nos. field.';
                }
                field("VD No."; Rec."VD No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Defect field.';
                }
                field("DO No."; Rec."DO No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Depot Operation field.';
                }
                field("TA No."; Rec."TA No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Trip Analysis field.';
                }

            }
        }
    }
}
