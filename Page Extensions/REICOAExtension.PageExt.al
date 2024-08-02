pageextension 70976577  REICOAExtension extends "Chart of Accounts"
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
        if not UserSetup."View COA" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to the company chart of account.Kindly contact your system admin!';
}