pageextension 70976592  REIGJTemplateExt extends "General Journal Templates"
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
        if not UserSetup."View Journal" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to general journal template. Kindly contact your admin!';
}