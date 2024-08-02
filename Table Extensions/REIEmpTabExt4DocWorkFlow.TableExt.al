tableextension 70976580 REIEmpTabExt4DocWorkFlow extends Employee
{
    var
        UserSetup: Record "User Setup";
        HRSetup: Record REIHRSetup;

    trigger OnInsert()
    begin
        OnlyHROperation();
    end;

    trigger OnDelete()
    begin
        OnlyHROperation();
    end;

    local procedure OnlyHROperation()
    begin
        UserSetup.Get(UserId);
        HRSetup.Get();

        If (UserSetup."View Employee Record" and (UserSetup."HR Manager" or UserSetup."Head of Corp Services")) or 
            ((HRSetup."HCS User ID" = UserSetup."User ID") or (HRSetup."HR Manager ID" = UserSetup."User ID")) then
            exit
        else
            Error('You are not allowed to perform this operation!!!');
    end;
}