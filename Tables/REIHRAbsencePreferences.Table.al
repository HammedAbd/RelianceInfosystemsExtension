table 70976580 REIHRAbsencePreferences
{

    fields
    {
        field(70976675;"Include Weekends";Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976676;"Include Holidays";Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976677;"Year-Start Date";Date)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(Key1;"Include Weekends","Include Holidays")
        {
        }
    }

    fieldgroups
    {
    }
}

