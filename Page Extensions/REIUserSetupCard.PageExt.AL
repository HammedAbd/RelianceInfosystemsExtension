pageextension 70976598 REIUserSetupCard extends "User Setup"
{
    layout
    {

        addafter(PhoneNo)
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Employee No. field.';
            }
            field("Full Name"; Rec."Full Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Full Name field.';
            }
            field("Job Title/Designation"; Rec."Job Title/Designation")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Job Title/Designation field.';
            }
            field("Branch Code"; Rec."Branch Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            }
            field("Department Code"; Rec."Department code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
            }
            field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
            }
            field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
            }
            field("Post Finance"; Rec."Post Finance")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Post Finance field.';
            }
            field("ESS Proxy"; Rec."ESS Proxy")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the ESS Proxy field.';
            }
            field("Create Job Roles/Titles"; Rec."Create Job Roles/Titles")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Create Job Roles/Titles field.';
            }
            field("Fin/Acc Officer"; Rec."Fin/Acc Officer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Fin/Acc Officer field.';
            }
            field("HR Manager"; Rec."HR Manager")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HR Manager field.';
            }
            field("Head of Corp Services"; Rec."Head of Corp Services")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HCS field.';
            }
            field("Finance Manager"; Rec."Finance Manager")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Finance Manager field.';
            }
            field("View Employee Record"; Rec."View Employee Record")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the View Employee Record field.';
            }
            field("View Bank Account List"; Rec."View Bank Account List")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the View Bank Account List field.';
            }
            field("View Item"; Rec."View Item")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies access to view item data.';
            }
            field(CEO; Rec.CEO)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the CEO field.';
            }
            field("Salary Setup"; Rec."Salary Setup")
            {
                ApplicationArea = All;
                Visible = false;
                ToolTip = 'Specifies the value of the Salary Setup field.';
            }
            field("Payroll Officer"; Rec."Payroll Officer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payroll Officer field.';
                Visible = false;
            }
            field("Raise Purchase Invoice"; Rec."Raise Purchase Invoice")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Raise Purchase Invoice field.';
            }
            field("View Pending Requests"; Rec."View Pending Requests")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the View Pending Requests field.';
            }
            field("Retail Station Code"; Rec."Retail Station Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Retail Station Code field.';
            }
            field("Retail Type"; Rec."Retail Type")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Retail Type field.';
            }

            field("View Approved Documents"; Rec."View Approved Documents")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the View Approved Documents field.';
            }
            field(ViewTreatedRecords; Rec.ViewTreatedRecords)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the View Treated Records field.';
            }
            field("HR Officer"; Rec."HR Officer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HR Officer field.';
            }
            field("Team Lead"; Rec."Team Lead")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Team Lead field.';
            }
            field(HodAdmin; Rec.HodAdmin)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HOD Admin field.';
            }
            field(AdminOfficer; Rec.AdminOfficer)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Admin Officer field.';
            }
            field("Executive Assistant"; Rec."Executive Assistant")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Executive Assistant field.';
            }
            field("Station Manager"; Rec."Station Manager")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Station Manager field.';
            }
            field("Sales Marketer"; Rec."Sales Marketer")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Sales Marketer field.';
            }
            field("Allow RFQ Generation"; Rec."Allow RFQ Generation")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Allow RFQ Generation field.';
            }
            field(Auditor; Rec.Auditor)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Auditor field.';
            }
            field(InventoryOfficer; Rec.InventoryOfficer)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Inventory Officer field.';
            }
            field(HODGeneral; Rec.HODGeneral)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Head of Dept. field.';
            }
            field(HODProcurement; Rec.HODProcurement)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the HOD Supply Chain field.';
            }
            field("Warehouse Officer"; Rec."Warehouse Officer")
            {
                ApplicationArea = All;
                Visible = true;
                ToolTip = 'Specifies the value of the Warehouse Officer field.';
            }
            field("Logistic Officer"; Rec."Logistic Officer")
            {
                ApplicationArea = All;
                Visible = true;
                ToolTip = 'Specifies the value of the Logistic Officer field.';
            }

            field("ED"; Rec."E-D")
            {
                ApplicationArea = All;
                Visible = true;
                ToolTip = 'Specifies the value of the ED field.';
            }
            field("Supply Chain Officer"; Rec."SCO Request Details On PR")
            {
                ApplicationArea = All;
                Caption = 'More Details Request on PR';
                ToolTip = 'Specifies the value of the More Details Request on PR field.';
            }
            field("Close DOC"; Rec."Close DOC")
            {
                ApplicationArea = All;
                ToolTip = 'Check this box to give permission to close daily operations form.';
                Visible = false;
            }
            field("Allow Trade Activatn Cost Diff"; Rec."Allow Trade Activatn Cost Diff")
            {
                ApplicationArea = All;
                Visible = true;
                ToolTip = 'Specifies the value of the Allow Trade Activatn Cost Diff field.';
            }
            field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
            {
                ApplicationArea = All;
                Visible = true;
                ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
            }
            field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
            {
                ApplicationArea = All;
                Visible = true;
                ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
            }
            field("Allow Tag No. Edit"; Rec."Allow Tag No. Edit")
            {
                ApplicationArea = All;
                Visible = true;
                ToolTip = 'Specifies the value of the Allow Tag No. Edit field.';
            }
            field("System Admin"; Rec."System Admin")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the System Admin field.';
            }

        }
        moveafter("Job Title/Designation"; Email)
    }
}