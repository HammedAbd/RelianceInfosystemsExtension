table 70976582 REIHRNWDaysDates
{

    fields
    {
        field(70976675;"Non Working Days";Code[10])
        {
            DataClassification = CustomerContent;
        }
        field(70976676;"Non Working Dates";Date)
        {
            DataClassification = CustomerContent;
        }
        field(70976677;"Code";Integer)
        {
            DataClassification = CustomerContent;
            AutoIncrement = true;
        }
        field(70976678;Reason;Text[30])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
        }
    }

    fieldgroups
    {
    }
}

