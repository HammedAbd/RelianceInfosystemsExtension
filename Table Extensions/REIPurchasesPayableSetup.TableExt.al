tableextension 70976578 REIPurchasesPayableSetup extends "Purchases & Payables Setup"
{
    fields
    {
        // Add changes to table fields here
        field(70976575; "Purch. Requisition No."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976576; "Payment Requisition Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976577; "CA & Imprest Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976578; "Retirement Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;       
        }
        field(70976579; "Store Return Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976580; "Store Requisition Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976581; "Service Requisition Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976582; "Work Order Header Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976583; "Loan Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976584; "Maintenance Plan Nos."; Code[20])
        {
            TableRelation = "No. Series".Code;
            DataClassification = CustomerContent;
        }
        field(70976585; "Account E-mail"; Text[100])
        {
            ExtendedDatatype = EMail;
            DataClassification = CustomerContent;
        }
        field(70976586; "Direct Cash Claim Nos."; Code[20])
        {
            TableRelation = "No. Series";
             DataClassification = CustomerContent;
        }
        field(70976587; "Cash Limit"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70976588; "Lease Rec. Nos."; Code[20])
        {
            TableRelation = "No. Series";
            DataClassification = CustomerContent;
        }
        field(70976589; "Lease Rec. Account(Current)"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Account"."No.";
        }
        field(70976590; "Fin.Lease Account"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Account"."No.";
        }
        field(70976591; "Sales To Own Account"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "G/L Account"."No.";
        }
        field(70976592; "Cash.Adv Days Threshold"; Integer)
        {
            DataClassification = CustomerContent;
        }
        field(70976593; "Finance Group Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
    }
}