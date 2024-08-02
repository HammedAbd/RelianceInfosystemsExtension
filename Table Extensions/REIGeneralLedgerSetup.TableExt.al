tableextension 70976579 REIGeneralLedgerSetup extends "General Ledger Setup"
{
    fields
    {
        field(70976575; "VAT Payable Account"; Code[20])
        {
            Caption = 'VAT Payable Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(70976576; "WHT Payable Account"; Code[20])
        {
            Caption = 'WHT Payable Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }
        field(70976577; "NCDF Payable Account"; Code[20])
        {
            Caption = 'NCDF Payable Account';
            DataClassification = CustomerContent;
            TableRelation = "G/L Account";
        }

    }
}
