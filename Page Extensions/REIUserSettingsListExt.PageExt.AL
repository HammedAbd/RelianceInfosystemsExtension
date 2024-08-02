pageextension 70976604 REIUserSettingsListExt extends "User Settings List"
{
    actions
    {
        addfirst(Processing)
        {
            action(BulkEditRoles)
            {
                Caption = 'Bulk Edit User Roles';
                ApplicationArea = All;
                Image = UpdateDescription;
                ToolTip = 'Executes the Bulk Edit User Roles action.';
                trigger OnAction()
                var
                    UserPersonalization: Record "User Personalization";
                    TempAllProfile: Record "All Profile" temporary;
                begin
                    UserPersonalization.Reset();
                    CurrPage.SetSelectionFilter(UserPersonalization);
                    if UserPersonalization.FindSet() then begin
                        UserMgt.PopulateProfiles(TempAllProfile);
                        if Page.RunModal(Page::Roles, TempAllProfile) = Action::LookupOK then begin
                            repeat
                                UserPersonalization."Profile ID" := TempAllProfile."Profile ID";
                                UserPersonalization."App ID" := TempAllProfile."App ID";
                                UserPersonalization.Scope := TempAllProfile.Scope;
                                UserPersonalization.CalcFields("Role");
                                UserPersonalization.Modify();
                            until UserPersonalization.Next() = 0;
                            CurrPage.Update(false);
                        end;
                    end;
                end;
            }
            action(BulkEditCompanies)
            {
                Caption = 'Bulk Edit User Companies';
                ApplicationArea = All;
                Image = UpdateDescription;
                ToolTip = 'Executes the Bulk Edit User Companies action.';
                trigger OnAction()
                var
                    UserPersonalization: Record "User Personalization";
                    CompanyName: Text[30];
                begin
                    UserPersonalization.Reset();
                    CurrPage.SetSelectionFilter(UserPersonalization);
                    if UserPersonalization.FindSet() then begin
                        UserMgt.LookupCompanies(CompanyName);
                        If CompanyName <> '' then 
                        repeat
                            UserPersonalization.Company := CompanyName;
                            UserPersonalization.Modify();
                        until UserPersonalization.Next() = 0;
                        CurrPage.Update(false);
                    end;
                end;
            }

            action(BulkEditLanguage)
            {
                Caption = 'Bulk Edit User Languages';
                ApplicationArea = All;
                Image = UpdateDescription;
                ToolTip = 'Executes the Bulk Edit User Languages action.';
                trigger OnAction()
                var
                    UserPersonalization: Record "User Personalization";
                    LanguageId: Integer;
                begin
                    UserPersonalization.Reset();
                    CurrPage.SetSelectionFilter(UserPersonalization);
                    if UserPersonalization.FindSet() then begin
                        UserMgt.LookupApplicationLanguageId(LanguageId);
                        if LanguageId <> 0 then 
                        repeat
                            UserPersonalization."Language ID" := LanguageId;
                            UserPersonalization.CalcFields("Language Name");
                            UserPersonalization.Modify();
                        until UserPersonalization.Next() = 0;
                    end;
                end;
            }

            action(BulkEditRegion)
            {
                Caption = 'Bulk Edit User Regions';
                ApplicationArea = All;
                Image = UpdateDescription;
                ToolTip = 'Executes the Bulk Edit User Regions action.';
                trigger OnAction()
                var
                    UserPersonalization: Record "User Personalization";
                    LanguageId: Integer;
                begin
                    UserPersonalization.Reset();
                    CurrPage.SetSelectionFilter(UserPersonalization);
                    if UserPersonalization.FindSet() then begin
                        UserMgt.LookupWindowsLanguageId(LanguageId);
                        if LanguageId <> 0 then 
                        repeat
                            UserPersonalization."Locale ID" := LanguageId;
                            UserPersonalization.Modify();
                        until UserPersonalization.Next() = 0;
                    end;
                end;
            }
            action(BulkEditTimeZone)
            {
                Caption = 'Bulk Edit User Time Zones';
                ApplicationArea = All;
                Image = UpdateDescription;
                ToolTip = 'Executes the Bulk Edit User Time Zones action.';
                trigger OnAction()
                var
                    UserPersonalization: Record "User Personalization";
                    TimeZoneText: Text[180];
                begin
                    UserPersonalization.Reset();
                    CurrPage.SetSelectionFilter(UserPersonalization);
                    if UserPersonalization.FindSet() then begin
                        UserMgt.LookupTimeZone(TimeZoneText);
                        if TimeZoneText <> '' then 
                        repeat
                            UserPersonalization."Time Zone" := TimeZoneText;
                            UserPersonalization.Modify();
                        until UserPersonalization.Next() = 0;
                    end;
                end;
            }
        }
    }
    var
        UserMgt: Codeunit REIUserManagementTools;
}