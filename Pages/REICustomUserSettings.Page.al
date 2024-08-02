page 70976605 REICustomUserSettings
{
    ApplicationArea = All;
    Caption = 'Change User Settings';
    PageType = StandardDialog;
    SourceTable = "User Settings";
    SourceTableTemporary = true;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    LinksAllowed = false;
    Extensible = true;
    Permissions = tabledata User = r;

    layout
    {
        area(Content)
        {
            group(Control1)
            {
                Caption = 'User Settings';
                group("User Settings")
                {
                    ShowCaption = false;
                    field(UserRoleCenter; ProfileName)
                    {
                        ApplicationArea = All;
                        AssistEdit = true;
                        Caption = 'Role';
                        Editable = false;
                        Importance = Promoted;
                        ToolTip = 'Specifies the role that defines home page with links to the most common tasks.';

                        trigger OnAssistEdit()
                        var
                            TempAllProfile: Record "All Profile" temporary;
                            UserMgt: Codeunit REIUserManagementTools;
                        begin
                            UserMgt.PopulateProfiles(TempAllProfile);
                            if Page.RunModal(Page::Roles, TempAllProfile) = Action::LookupOK then begin
                                ProfileID := TempAllProfile."Profile ID";
                                AppID := TempAllProfile."App ID";
                                ScopeVar := TempAllProfile.Scope;
                                ProfileName := UserMgt.GetProfileName(ScopeVar,AppID,ProfileID);
                            end;
                        end;
                    }
                    field(Company; CompanyNameDisplay)
                    {
                        ApplicationArea = All;
                        Caption = 'Company';
                        Editable = false;
                        ToolTip = 'Specifies the database company that you work in. You must sign out and then sign in again for the change to take effect.';

                        trigger OnAssistEdit()
                        var
                            UserMgt: Codeunit REIUserManagementTools;
                        begin
                            UserMgt.LookupCompanies(CompanyName);
                            CompanyNameDisplay := UserMgt.GetCompanyDisplayName(CompanyName);
                        end;
                    }
                    field(Region; RegionName)
                    {
                        ApplicationArea = All;
                        Caption = 'Region';
                        ToolTip = 'Specifies the regional settings, such as date and numeric format, on all devices. You must sign out and then sign in again for the change to take effect.';

                        trigger OnAssistEdit()
                        begin
                            UserMgt.LookupWindowsLanguageId(RegionId);
                            RegionName := UserMgt.GetWindowsLanguageName(RegionId)
                        end;
                    }
                    field(LanguageName; LanguageName)
                    {
                        ApplicationArea = All;
                        Caption = 'Language';
                        Importance = Promoted;
                        ToolTip = 'Specifies the display language, on all devices. You must sign out and then sign in again for the change to take effect.';

                        trigger OnAssistEdit()
                        begin
                            UserMgt.LookupApplicationLanguageId(LanguageId);
                            LanguageName := UserMgt.GetWindowsLanguageName(LanguageId)
                        end;
                    }
                    field("Time Zone";TimeZoneDiplay)
                    {
                        ApplicationArea = All;
                        Caption = 'Time Zone';
                        ToolTip = 'Specifies the time zone that you work in. You must sign out and then sign in again for the change to take effect.';

                        trigger OnAssistEdit()
                        begin
                            UserMgt.LookupTimeZone(TimeZoneText);
                            TimeZoneDiplay := UserMgt.GetTimeZoneDisplayName(TimeZoneText)
                        end;
                    }
                    
                }
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     if not Rec.Initialized then
    //         UserMgt.GetUserSettings(UserSecurityId(), Rec);

    //     OldUserSettings := Rec;

    //     LastLoginInfo := UserMgt.GetLastLoginInfo(Rec."Last Login");
    //     LastLoginInfoVisible := (Rec."User Security ID" = UserSecurityId()) and (LastLoginInfo <> '');
    // end;

    // trigger OnQueryClosePage(CloseAction: Action): Boolean
    // begin
    //     if CloseAction = Action::OK then begin
    //         if OldUserSettings."Legacy Action Bar" <> Rec."Legacy Action Bar" then
    //             if Rec."Legacy Action Bar" then
    //                 UserMgt.ShowLegacyActionBarSurvey();
    //         UserMgt.UpdateUserSettings(OldUserSettings, Rec);
    //     end;
    // end;

    var
        UserMgt: Codeunit REIUserManagementTools;
        ProfileID: code[30];
        AppID: Guid;
        ScopeVar: option System,Tenant;
        CompanyName: Text[30];
        LanguageId, RegionId: Integer;
        TimeZoneText: Text[180];
        ProfileName, CompanyNameDisplay, LanguageName, RegionName, TimeZoneDiplay: Text;
}
