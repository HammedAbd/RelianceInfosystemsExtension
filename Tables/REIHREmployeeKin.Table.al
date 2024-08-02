table 70976575 REIHREmployeeKin
{
    Caption = 'Employee Relative';
    Permissions = 
        tabledata "Human Resource Comment Line" = RD;

    fields
    {
        field(70976575; "Employee Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(70976576; Relationship; Code[20])
        {
            NotBlank = true;
            TableRelation = REIHRLookupValues.Code WHERE(Type = CONST("Next of Kin"));
            DataClassification = CustomerContent;
        }
        field(70976577; SurName; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(70976578; "Other Names"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70976579; "Telephone No"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(70976580; "Date Of Birth"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(70976581; Occupation; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70976582; Address; Text[250])
        {
            DataClassification = CustomerContent;
        }
        field(70976583; "Work Tel No"; Text[100])
        {
            DataClassification = CustomerContent;
        }
        field(70976584; "Home Tel No"; Text[50])
        {
            DataClassification = CustomerContent;
        }
        field(70976585; Type; Option)
        {
            OptionMembers = "Next of Kin",Beneficiary;
            DataClassification = CustomerContent;
        }
        field(70976586; "Line No."; Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(70976587; Comment; Boolean)
        {
            CalcFormula = Exist("Human Resource Comment Line" WHERE("Table Name" = CONST("Employee Relative"), "No." = FIELD("Employee Code"), "Table Line No." = FIELD("Line No.")));
            Caption = 'Comment';
            Editable = false;
            FieldClass = FlowField;
        }
        field(70976588; "E-mail"; Text[60])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1; "Employee Code", Type, Relationship, SurName, "Other Names", "Line No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    var
        HRCommentLine: Record "Human Resource Comment Line";
    begin
        HRCommentLine.SETRANGE("Table Name", HRCommentLine."Table Name"::"Employee Relative");
        HRCommentLine.SETRANGE("No.", "Employee Code");
        HRCommentLine.DeleteAll();;
    end;
}

