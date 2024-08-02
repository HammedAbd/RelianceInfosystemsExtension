table 70976581 REIHRAbsenceHoliday
{
    DataCaptionFields = "Employee No.","Start Date","End Date","Hours Lost",Reason,Cost,"% On Cost","Additional Cost","Total Cost";

    fields
    {
        field(70976675;"Employee No.";Code[20])
        {
            TableRelation = Employee."No.";
            DataClassification = CustomerContent;
        }
        field(70976676;"Start Date";Date)
        {
            DataClassification = CustomerContent;
        }
        field(70976677;"End Date";Date)
        {
            DataClassification = CustomerContent;
        }
        field(70976678;Reason;Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = Holiday,"Sick Leave",Training,Unauthorised,Maternity;
        }
        field(70976679;Cost;Decimal)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                "Total Cost" := Cost + "% On Cost" + "Additional Cost";
            end;
        }
        field(70976680;"% On Cost";Decimal)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                "Total Cost" := Cost + "% On Cost" + "Additional Cost";
            end;
        }
        field(70976681;"Additional Cost";Decimal)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin
                "Total Cost" := Cost + "% On Cost" + "Additional Cost";
            end;
        }
        field(70976682;"Total Cost";Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70976683;"Hours Lost";Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70976684;"Job Title";Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976685;Department;Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(70976686;"Employee First Name";Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976687;"Employee Last Name";Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976688;"Resource No.";Code[20])
        {
            CalcFormula = Lookup(Employee."Resource No." WHERE ("No."=FIELD("Employee No.")));
            FieldClass = FlowField;
        }
        field(70976689;Comment;Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976690;"Line No";Integer)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1;"Employee No.","Line No")
        {
        }
    }
}

