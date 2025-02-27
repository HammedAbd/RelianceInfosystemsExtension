pageextension 70976587 REIPOListExt extends "Purchase Order List"
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
        if not UserSetup."View PO" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to purchase orders. Kindly contact your admin!';
}