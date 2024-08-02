tableextension 70976575 REIEmpLedger extends "Employee Ledger Entry"
{
    fields
    {
        // Add changes to table fields here
        field(70976575; "Entry Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = ,"Per Diem";
            OptionCaption = ' ,Per Diem';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
}