pageextension 70976580  REIGenLegderEntriesExt extends "General Ledger Entries"
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
        if not UserSetup."View GL" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to the finance general ledger. Kindly contact your admin!';
        //ErrorMsg: 
}