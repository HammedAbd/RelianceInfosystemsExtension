pageextension 70976583 REICustomerListExt extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    trigger OnOpenPage()
    begin
        UserSetup.Get(USERID);
        if not UserSetup."View Customer" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to the customer data. Kindly contact your system admin!';
}