tableextension 70976576 REIGenJournalLineExt extends "Gen. Journal Line"
{
    fields
    {
        // Add changes to table fields here
        field(70976575; "Entry Type"; Option)
        {
            DataClassification = CustomerContent;
            OptionMembers = "","Per Diem";
            OptionCaption = ',Per Diem';
        }
    }
}