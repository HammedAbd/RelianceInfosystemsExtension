pageextension 70976579 REIGLSetupExt4DocWorkflow extends "General Ledger Setup"
{
    layout
    {
        addafter(Control1900309501)
        {
            group(ForPaymentReq)
            {
                Caption = 'For Payment Requisition';
                
                field("NCDF Payable Account"; Rec."NCDF Payable Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the NCDF Payable Account field.';
                    ShowMandatory = true;
                }
                field("VAT Payable Account"; Rec."VAT Payable Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the VAT Payable Account field.';
                    ShowMandatory = true;
                }
                field("WHT Payable Account"; Rec."WHT Payable Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the WHT Payable Account field.';
                    ShowMandatory = true;
                }
            }
        }
    }
}
