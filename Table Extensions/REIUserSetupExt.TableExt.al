tableextension 70976577 REIUserSetupExt extends "User Setup"
{
    fields
    {
        field(70976575; "Full Name"; Text[100])
        {
            Caption = 'Full Name';
            DataClassification = CustomerContent;
        }
        field(70976576; "Employee No."; Code[20])
        {
            Caption = 'Employee No.';
            DataClassification = CustomerContent;
            TableRelation = Employee."No.";
            trigger Onvalidate()
            begin
                IF Employee.GET("Employee No.") THEN begin
                    "Full Name" := Employee.FullName();
                    "Job Title/Designation" := Employee."Job Title";
                    "E-Mail" := Employee."Company E-Mail";
                    Validate("Shortcut Dimension 1 Code", Employee."Global Dimension 1 Code");
                    Validate("Shortcut Dimension 2 Code", Employee."Global Dimension 2 Code");
                end;
            end;
        }
        field(70976577; "Head of Corp Services"; Boolean)
        {
            Caption = 'HCS';
            DataClassification = CustomerContent;
        }
        field(70976578; "Job Title/Designation"; Text[100])
        {
            Caption = 'Job Title/Designation';
            DataClassification = CustomerContent;
        }
        field(70976579; "Executive Assistant"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976580; "HR Manager"; Boolean)
        {
            Caption = 'HR Manager';
            DataClassification = CustomerContent;
        }

        field(70976581; "Department Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Global Dimension 2 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Shortcut Dimension 2 Code" := "Department Code";
            end;
        }
        field(70976582; "Branch Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Shortcut Dimension 1 Code" := "Branch Code";
            end;
        }
        field(70976583; "Create Job Roles/Titles"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976584; "View Approved Documents"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976585; "Fin/Acc Officer"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976586; "Finance Manager"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976587; "View Employee Record"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976588; CEO; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976589; "Salary Setup"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976590; "Raise Purchase Invoice"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976591; "Maintenance Officer"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976592; "Allow RFQ Generation"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976593; ViewTreatedRecords; Boolean)
        {
            Caption = 'View Treated Records';
            DataClassification = CustomerContent;
        }
        field(70976594; "HR Officer"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976595; HodAdmin; Boolean)
        {
            Caption = 'HOD Admin';
            DataClassification = CustomerContent;
        }
        field(70976596; AdminOfficer; Boolean)
        {
            Caption = 'Admin Officer';
            DataClassification = CustomerContent;
        }
        field(70976597; InventoryOfficer; Boolean)
        {
            Caption = 'Inventory Officer';
            DataClassification = CustomerContent;
        }
        field(70976598; Auditor; Boolean)
        {
            Caption = 'Auditor';
            DataClassification = CustomerContent;
        }
        field(70976599; HODProcurement; Boolean)
        {
            Caption = 'HOD Supply Chain';
            DataClassification = CustomerContent;
        }
        field(70976600; HODGeneral; Boolean)
        {
            Caption = 'Head of Dept.';
            DataClassification = CustomerContent;
        }
        field(70976601; "Payroll Officer"; Boolean)
        {
            Caption = 'Payroll Officer';
            DataClassification = CustomerContent;
        }
        field(70976602; "Team Lead"; Boolean)
        {
            Caption = 'Team Lead';
            DataClassification = CustomerContent;
        }
        field(70976603; "Logistic Officer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976604; "Warehouse Officer"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976605; "E-D"; Boolean)
        {
            Caption = 'ED';
            DataClassification = CustomerContent;
        }
        field(70976606; "Close DOC"; Boolean)
        {
            Caption = 'Close DOC';
            DataClassification = CustomerContent;
        }
        field(70976607; "SCO Request Details On PR"; Boolean)
        {
            DataClassification = CustomerContent;
            //TableRelation = "No. Series".Code;
        }
        field(70976608; "View Pending Requests"; Boolean)
        {
            Editable = true;
            DataClassification = CustomerContent;
        }
        field(70976609; "ESS Proxy"; Boolean)
        {
            Caption = 'ESS Proxy';
            DataClassification = CustomerContent;
        }
        field(70976610; "View COA"; Boolean)
        {
            Caption = 'View COA';
            DataClassification = CustomerContent;
        }
        field(70976611; "View GL"; Boolean)
        {
            Caption = 'View GL';
            DataClassification = CustomerContent;
        }
        field(70976612; "View PO"; Boolean)
        {
            Caption = 'View PO';
            DataClassification = CustomerContent;
        }
        field(70976613; "View SO"; Boolean)
        {
            Caption = 'View SO';
            DataClassification = CustomerContent;
        }
        field(70976614; "View CLE"; Boolean)
        {
            Caption = 'View CLE';
            DataClassification = CustomerContent;
        }
        field(70976615; "View VLE"; Boolean)
        {
            Caption = 'View VLE';
            DataClassification = CustomerContent;
        }
        field(70976616; "View ILE"; Boolean)
        {
            Caption = 'View ILE';
            DataClassification = CustomerContent;
        }
        field(70976617; "View BE"; Boolean)
        {
            Caption = 'View BE';
            DataClassification = CustomerContent;
        }
        field(70976618; "View Customer"; Boolean)
        {
            Caption = 'View Customer';
            DataClassification = CustomerContent;
        }
        field(70976619; "View Vendor"; Boolean)
        {
            Caption = 'View Vendor';
            DataClassification = CustomerContent;
        }
        field(70976620; "View Item"; Boolean)
        {
            Caption = 'View Item';
            DataClassification = CustomerContent;
        }
        field(70976621; "View PReceipt"; Boolean)
        {
            Caption = 'View Purchase Receipt';
            DataClassification = CustomerContent;
        }
        field(70976622; "View Journal"; Boolean)
        {
            Caption = 'View Journal';
            DataClassification = CustomerContent;
        }
        field(70976623; "View JBatch"; Boolean)
        {
            Caption = 'View Journal Batch';
            DataClassification = CustomerContent;
        }
        field(70976624; "View JTemplate"; Boolean)
        {
            Caption = 'View Journal Template';
            DataClassification = CustomerContent;
        }
        field(70976625; "View PGroup"; Boolean)
        {
            Caption = 'View Posting Group';
            DataClassification = CustomerContent;
        }
        field(70976626; "View GLRegister"; Boolean)
        {
            Caption = 'View GL Register';
            DataClassification = CustomerContent;
        }
        field(70976627; "View Fixed Asset"; Boolean)
        {
            Caption = 'View Fixed Asset';
            DataClassification = CustomerContent;
        }
        field(70976628; "View FA Ledger"; Boolean)
        {
            Caption = 'View FA Ledger';
            DataClassification = CustomerContent;
        }
        field(70976629; "Shortcut Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Branch Code" := "Shortcut Dimension 1 Code";
            end;
        }
        field(70976630; "Shortcut Dimension 2 Code"; Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));
            DataClassification = CustomerContent;

            trigger OnValidate()
            begin
                "Department Code" := "Shortcut Dimension 2 Code";
            end;
        }
        field(70976631; "Allow Trade Activatn Cost Diff"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976632; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));
            DataClassification = CustomerContent;
        }
        field(70976633; "Shortcut Dimension 5 Code"; Code[20])
        {
            CaptionClass = '1,2,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5));
            DataClassification = CustomerContent;
        }
        field(70976634; "Allow Tag No. Edit"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976635; "System Admin"; Boolean)
        {
            DataClassification = CustomerContent;
        }

        field(70976636; "Station Manager"; Boolean)
        {
            Caption = 'Station Manager';
            DataClassification = CustomerContent;
        }

        field(70976637; "Sales Marketer"; Boolean)
        {
            Caption = 'Sales Marketer';
            DataClassification = CustomerContent;
        }
        field(70976638; "Retail Station Code"; code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Location;
        }
        field(70976639; "Retail Type"; Option)
        {
            OptionCaption = ',All,Lubricant,LPG,White Product';
            OptionMembers = ,All,Lubricant,LPG,"White Product";
            DataClassification = CustomerContent;
        }
        field(70976640; "View Bank Account List"; Boolean)
        {
            Caption = 'View Bank Account List';
            DataClassification = CustomerContent;
        }
        field(70976641; "Post Finance"; Boolean)
        {
            Caption = 'Post Finance';
            DataClassification = CustomerContent;
        }

    }

    fieldgroups
    {
        addlast(DropDown; "Full Name", "Job Title/Designation", "Branch Code", "Department Code", "E-Mail")
        {
        }
    }

    var
        Employee: Record Employee;
}
