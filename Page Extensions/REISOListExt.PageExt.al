pageextension 70976589  REISOListExt extends "Sales Order List"
{
    layout
    {
        // Add changes to page layout here
        // --Add changes to page layout here


    }
    
    actions
    {
        // Add changes to page actions here
    }
    
    trigger OnOpenPage()
    begin
        UserSetup.Get(USERID);
        if not UserSetup."View SO" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to sales orders. Kindly contact your admin!';
}