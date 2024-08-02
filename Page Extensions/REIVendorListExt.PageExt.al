pageextension 70976584  REIVendorListExt extends "Vendor List"
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
        if not UserSetup."View Vendor" THEN
            error(ErrorMsg);
    end;

    var
        UserSetup: Record "User Setup";
        ErrorMsg: Label 'Ops! You do not have access to the vendor data. Kindly contact your admin!';
}