pageextension 70976600 REIPurchasesPayableSetup extends "Purchases & Payables Setup"
{
    layout
    {
        addlast(General)
        {
            field("Cash Advance Limit"; Rec."Cash Limit")
            {
                ApplicationArea = All;
                Caption = 'Cash Advance Limit';
                ToolTip = 'Specifies the value of the Cash Advance Limit field.';
            }
            field("Cash.Adv Days Threshold"; Rec."Cash.Adv Days Threshold")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Cash.Adv Days Threshold field.';
            }
            field("Finance Group Email"; Rec."Finance Group Email")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Finance Group Email field.';
            }
        }
        addlast("Number Series")
        {
            field("Purch. Requisition No."; Rec."Purch. Requisition No.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Purch. Requisition No. field.';
            }
            field("Payment Requisition Nos."; Rec."Payment Requisition Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Payment Requisition Nos. field.';
            }
            field("Direct Cash Claim Nos."; Rec."Direct Cash Claim Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Direct Cash Claim Nos. field.';
            }
            field("CA & Imprest Nos."; Rec."CA & Imprest Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the CA & Imprest Nos. field.';
            }
            field("Retirement Nos."; Rec."Retirement Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Retirement Nos. field.';
            }
            field("Store Requisition Nos."; Rec."Store Requisition Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Store Requisition Nos. field.';
            }
            field("Store Return Nos."; Rec."Store Return Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Store Return Nos. field.';
            }
            //"Direct Cash Claim Nos."
            field("Service Requisition Nos."; Rec."Service Requisition Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Service Requisition Nos. field.';
            }
            field("Job Order Nos."; Rec."Work Order Header Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Work Order Header Nos. field.';
            }
            field("Loan Nos."; Rec."Loan Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Loan Nos. field.';
            }
            field("Maintenance Plan Nos."; Rec."Maintenance Plan Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Maintenance Plan Nos. field.';
            }
            field("Account E-mail"; Rec."Account E-mail")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Account E-mail field.';
            }
            field("Lease Rec. Nos."; Rec."Lease Rec. Nos.")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Lease Rec. Nos. field.';
            }




        }
        addafter("Number Series")
        {
            group(LeaseDetails)
            {
                Caption = 'Lease Finance Details';
                field("Lease Rec. Account(Current)"; Rec."Lease Rec. Account(Current)")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Lease Rec. Account(Current) field.';
                }
                field("Fin.Lease Account"; Rec."Fin.Lease Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fin.Lease Account field.';
                }
                field("Sales To Own Account"; Rec."Sales To Own Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Sales To Own Account field.';
                }
            }
        }
    }
}