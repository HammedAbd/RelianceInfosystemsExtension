page 70976583 REICustomSetupCard
{
    Caption = 'Custom Setup Card';
    PageType = Card;
    SourceTable = REICustomSetup;
    ApplicationArea = All;
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group("No. Series")
            {
                field("Complaint No."; Rec."Complaint No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Complaint No. field.';
                    Visible = false;
                }
                field("ATL No."; Rec."ATL No.")
                {
                    ToolTip = 'Specifies the value of the ATL No. field.';
                }
                field("Loading Order Receipt No."; Rec."Loading Order Receipt No.")
                {
                    ToolTip = 'Specifies the value of the Loading Order Receipt No. field.';
                }
                field("Truck Entry Permit No."; Rec."Truck Entry Permit No.")
                {
                    ToolTip = 'Specifies the value of the Truck Entry Permit No. field.';
                }
                field("Request for Quote Nos."; Rec."Request for Quote Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Request for Quote field.';
                }
                field("Job Archive Code"; Rec."Job Archive Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the job archive code field.';
                }

                field("Gate Pass Nos."; Rec."Gate Pass (Out) Nos.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gate Pass (Out) Nos. field.';
                }
                field("Gate Pass (In) Nos."; Rec."Gate Pass (In) Nos.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gate Pass (In) Nos. field.';
                }
                field("Vehicle Breakdown Nos."; Rec."Vehicle Breakdown Nos.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vehicle Breakdown Nos. field.';
                }

                field("Quote Evaluation Nos."; Rec."Quote Evaluation Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Quote Evaluation Nos. field.';
                }
                field("VD No."; Rec."VD No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Vehicle Defect field.';
                }
                field("DO No."; Rec."DO No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Depot Operation field.';
                }
                field("Lubricant Sales No."; Rec."Lubricant Sales No.")
                {
                    ToolTip = 'Specifies the value of the Lubricant Sales No. field.';
                }
                field("TA No."; Rec."TA No.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Trip Analysis field.';
                }
                field("Diagnosis Nos."; Rec."Diagnosis Nos.")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Diagnosis Nos. field.';
                }
                field("Schedule Code"; Rec."Schedule Code")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Schedule Code field.';
                }
                field("Fleet Schedule First Weekday"; Rec."Fleet Schedule First Weekday")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Fleet Schedule First Weekday field.';
                }
                field("Network and Plan. Head Email"; Rec."Network and Plan. Head Email")
                {
                    ApplicationArea = All;
                    Caption = 'Network and Plan. Head Email';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Network and Plan. Head Email field.';
                }
                field("Work Hours"; Rec."Work Hours")
                {
                    ApplicationArea = All;
                    Caption = 'Daily Work Hour duration';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Daily Work Hour duration field.';
                }
                field("Loading Ticket Nos."; Rec."Loading Ticket Nos.")
                {
                    ApplicationArea = All;
                    Caption = 'Authority to Load';
                    ToolTip = 'Specifies the value of the Authority to Load field.';
                }
                field("Waybill Nos."; Rec."Waybill Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Waybill Nos. field.';
                }
                field("Ticket Merge Nos."; Rec."Ticket Merge Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Ticket Merge Nos. field.';
                }
                field("Driver No."; Rec."Driver No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver No. field.';
                }
                field("Cash Receipt Nos."; Rec."Cash Receipt Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Cash Receipt Nos. field.';
                }
                field("Batch Nos."; Rec."Batch Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch Nos. field.';
                }
                field("Retail Sales No."; Rec."Retail Sales No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Retail Sales No. field.';
                }
            }
            group("Permission Ckeckbox")
            {
            }
            group("E-mail")
            {
                field("CFO E-mail"; Rec."CFO E-mail")
                {
                    ToolTip = 'Specifies the value of the CFO E-mail field.';
                }
                field("Foreman E-mail"; Rec."Foreman E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Foreman E-mail field.';
                    Visible = false;
                }
                field("Technician E-mail"; Rec."Technician E-mail")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Technician E-mail field.';
                }
                field("HOI E-mail"; Rec."HOI E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOI E-mail field.';
                }
                field("HOI User ID"; Rec."HOI User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOI User ID field.';
                }
                field("HOI Full Name"; Rec."HOI Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOI E-mail field.';
                }
                field("ED E-mail"; Rec."ED E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the EM E-mail field.';
                    Caption = 'EM E-mail';
                    Visible = false;
                }
                field("Project Team E-mail"; Rec."Project Team E-mail")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project team E-mail field.';
                }
                field("Warehouse Team E-mail"; Rec."Warehouse Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the warehouse team E-mail field.';
                }
                field("ED User ID"; Rec."ED User ID")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the EM User ID field.';
                    Caption = 'EM User ID';
                }
                field("ED Full Name"; Rec."ED Full Name")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the EM E-mail field.';
                    Caption = 'EM Full-Name';
                }
                field("Inventory Team E-mail"; Rec."Inventory Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inventory E-mail field.';
                    Visible = true;
                }
                field("Ground Staff Admin Email"; Rec."Ground Staff Admin Email")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Inventory E-mail field.';
                }
                field("Logistics Team E-mail"; Rec."Logistics Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Logistics Team E-mail field.';
                }
                field("Auditor E-mail"; Rec."Auditor E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Auditor E-mail field.';
                }
                field("Admin Team E-mail"; Rec."Admin Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admin Team E-mail field.';
                }
                field("Procurement Team E-mail"; Rec."Procurement Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Procurement Team E-mail field.';
                }
                field("FleetTeamE-mail"; Rec."Fleet Analyst Team Email")
                {
                    ApplicationArea = All;
                    Caption = 'Fleet Analyst Team Email';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Fleet Analyst Team Email field.';
                }
                field("Accident Unit Team Email"; Rec."Accident Unit Team Email")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Accident Unit Team Email field.';
                }
                field("COO E-mail"; Rec."COO E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the COO E-mail field.';
                }
                field("Schedule Adjust-Owner Email"; Rec."Schedule Adjust-Owner Email")
                {
                    ApplicationArea = All;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Schedule Adjust-Owner Email field.';
                }
                field("Legal Email"; Rec."Legal Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Legal Email field.';
                }
            }
        }
    }
}
