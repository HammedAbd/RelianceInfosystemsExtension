pageextension 70976578 REIEmpListExt4DocWorkFlow extends "Employee List"
{
    layout
    {
        addafter("Job Title")
        {
            field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
            }
            field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
            }
        }
    }
    trigger OnOpenPage()
    var
        UserSetup: Record "User Setup";
    begin
        if UserSetup.Get(UserId) then begin
            if (UserSetup."HR Manager" or UserSetup."HR Officer" Or 
                UserSetup."Finance Manager" Or UserSetup."Fin/Acc Officer") and 
                UserSetup."View Employee Record" then
                exit
             else 
                if UserSetup."View Employee Record" And 
                (UserSetup."Team Lead" Or UserSetup.HODGeneral Or UserSetup."ESS Proxy") then begin
                Rec.FILTERGROUP(10);
                Rec.SETRANGE("Global Dimension 2 Code",UserSetup."Department Code");
                Rec.FILTERGROUP(0);
            end else begin
                if UserSetup."Employee No." = '' then
                    Message('Your Employee No, has not been assigned to your user setup.');
                Rec.Reset();
                Rec.FilterGroup(20);
                Rec.SetRange("No.", UserSetup."Employee No.");
                Rec.FilterGroup(0);
            end;
        end else begin
            Message('Contact IT to add/complete your user setup record in this company!!!');
            Rec.Reset();
            Rec.FilterGroup(20);
            Rec.SetRange("No.", '');
            Rec.FilterGroup(0);
        end;
    end;
}
