codeunit 70976579 REIUserManagementTools
{
    Permissions = tabledata User = r,
                tabledata "User Personalization" = rm;

    var
        DescriptionFilterTxt: Label 'Navigation menu only.';
        UserCreatedAppNameTxt: Label '(User-created)';
        CompanySetUpInProgressMsg: Label 'Company %1 was just created, and we are still setting it up for you.\This may take up to 10 minutes, so take a short break before you begin to use %2.', Comment = '%1 - a company name,%2 - our product name';
    
    procedure PopulateProfiles(var TempAllProfile: Record "All Profile" temporary)
    var
        AllProfile: Record "All Profile";
    begin
        TempAllProfile.Reset();
        TempAllProfile.DeleteAll();
        AllProfile.SetRange(Enabled, true);
        AllProfile.SetFilter(Description, '<> %1', DescriptionFilterTxt);
        if AllProfile.FindSet() then
            repeat
                TempAllProfile := AllProfile;
                if IsNullGuid(TempAllProfile."App ID") then
                    TempAllProfile."App Name" := UserCreatedAppNameTxt;
                TempAllProfile.Insert();
            until AllProfile.Next() = 0;
    end;

    procedure LookupApplicationLanguageId(var LanguageId: Integer)
    var
        TempWindowsLanguage: Record "Windows Language" temporary;
    begin
        GetApplicationLanguages(TempWindowsLanguage);

        TempWindowsLanguage.SetCurrentKey(Name);

        if TempWindowsLanguage.Get(LanguageId) then;

        if Page.RunModal(Page::"Windows Languages", TempWindowsLanguage) = Action::LookupOK then
            LanguageId := TempWindowsLanguage."Language ID";
    end;

    local procedure GetApplicationLanguages(var TempWindowsLanguage: Record "Windows Language" temporary)
    var
        WindowsLanguage: Record "Windows Language";
    begin
        WindowsLanguage.SetRange("Localization Exist", true);
        WindowsLanguage.SetRange("Globally Enabled", true);

        if WindowsLanguage.FindSet() then
            repeat
                TempWindowsLanguage := WindowsLanguage;
                TempWindowsLanguage.Insert();
            until WindowsLanguage.Next() = 0;
    end;

    procedure LookupWindowsLanguageId(var LanguageId: Integer)
    var
        WindowsLanguage: Record "Windows Language";
    begin
        WindowsLanguage.SetCurrentKey(Name);

        if WindowsLanguage.Get(LanguageId) then;

        if Page.RunModal(Page::"Windows Languages", WindowsLanguage) = Action::LookupOK then
            LanguageId := WindowsLanguage."Language ID";
    end;

    procedure LookupTimeZone(var TimeZoneText: Text[180]): Boolean
    var
        TimeZone: Record "Time Zone";
    begin
        TimeZone."No." := FindTimeZoneNo(TimeZoneText);
        if Page.RunModal(Page::"Time Zones Lookup", TimeZone) = Action::LookupOK then begin
            TimeZoneText := TimeZone.ID;
            exit(true);
        end;
    end;

    local procedure FindTimeZoneNo(TimeZoneText: Text[180]): Integer
    var
        TimeZone: Record "Time Zone";
    begin
        TimeZone.SetRange(ID, TimeZoneText);
        if not TimeZone.FindFirst() then begin
            TimeZone.SetFilter(ID, '''@*' + TimeZoneText + '*''');
#pragma warning disable AA0181
            TimeZone.Find('=<>');
#pragma warning restore
        end;
        exit(TimeZone."No.");
    end;

    procedure LookupCompanies(var CompanyName: Text[30])
    var
        SelectedCompany: Record Company;
        UserSettings: Codeunit "User Settings";
        AccessibleCompanies: Page "Accessible Companies";
        IsSetupInProgress: Boolean;
    begin
        AccessibleCompanies.Initialize();

        if SelectedCompany.Get(CompanyName) then
            AccessibleCompanies.SetRecord(SelectedCompany);

        AccessibleCompanies.LookupMode(true);

        if AccessibleCompanies.RunModal() = Action::LookupOK then begin
            AccessibleCompanies.GetRecord(SelectedCompany);
            UserSettings.OnCompanyChange(SelectedCompany.Name, IsSetupInProgress);
            if IsSetupInProgress then
                Message(StrSubstNo(CompanySetUpInProgressMsg, SelectedCompany.Name, ProductName.Short()))
            else
                CompanyName := SelectedCompany.Name;
        end;
    end;

    procedure GetProfileName(Scope: Option System,Tenant; AppID: Guid; ProfileID: Code[30]) ProfileName: Text
    var
        AllProfile: Record "All Profile";
    begin
        // If current profile has been changed, then find it and update the description; else, get the default
        if not AllProfile.Get(Scope, AppID, ProfileID) then
            exit;

        ProfileName := AllProfile.Caption;
    end;

    procedure GetCompanyDisplayName(CompanyName: Text[30]): Text[250]
    var
        Company: Record Company;
    begin
        if Company.Get(CompanyName) then
            if Company."Display Name" <> '' then
                exit(Company."Display Name");
        exit(Company.Name)
    end;

    procedure GetWindowsLanguageName(LanguageId: Integer): Text
    var
        WindowsLanguage: Record "Windows Language";
    begin
        if LanguageId = 0 then
            exit('');

        if WindowsLanguage.Get(LanguageId) then
            exit(WindowsLanguage.Name);

        exit('');
    end;

    procedure GetTimeZoneDisplayName(TimeZoneText: Text[180]): Text[250]
    var
        TimeZone: Record "Time Zone";
    begin
        if TimeZone.Get(FindTimeZoneNo(TimeZoneText)) then
            exit(TimeZone."Display Name");
    end;
}