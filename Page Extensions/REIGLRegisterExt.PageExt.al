pageextension 70976597  REIGLRegisterExt extends "G/L Registers"
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
        if not UserSetup."View PGroup" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to general posting group. Kindly contact your admin!';
}