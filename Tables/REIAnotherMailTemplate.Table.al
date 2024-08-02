table 70976584 REIAnotherMailTemplate
{
    Caption = 'Using Another Mail Template';
    DataClassification = CustomerContent;
    Permissions = 
        tabledata AllObj = R,
        tabledata REIAnotherMailTemplate = R;

    #region TableFields
    fields
    {
        field(70976575; "Table ID"; Integer)
        {
            Caption = 'Table ID';
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                AllObjLocal: Record AllObj;
            begin
                AllObjLocal.SetRange("Object Type", AllObjLocal."Object Type"::Table);
                IF PAGE.RUNMODAL(Page::REIAllObjectsPage, AllObjLocal) = ACTION::LookupOK THEN BEGIN
                    Rec."Table ID" := AllObjLocal."Object ID";
                    Rec."Table Description" := AllObjLocal."Object Name";
                end;
            end;

            trigger OnValidate()
            begin
                IF AllObj.GET(AllObj."Object Type"::Table, Rec."Table ID") THEN
                    "Table Description" := AllObj."Object Name"
                ELSE
                    "Table Description" := '';
            end;
        }
        field(70976576; "Table Description"; Text[200])
        {
            Caption = 'Table Description';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    #endregion TableField

    #region keys
    keys
    {
        key(PK; "Table ID")
        {
            Clustered = true;
        }
    }
    #endregion keys
    #region GlobalVariable
    var
        AllObj: Record AllObj;
    #endregion GlobalVariable
}
