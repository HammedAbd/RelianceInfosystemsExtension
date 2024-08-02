page 70976579 REIHRLookupValuesList
{
    CardPageID = REIHRLookupValuesCard;
    DeleteAllowed = false;
    InsertAllowed = true;
    ModifyAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = REIHRLookupValues;
    UsageCategory = Lists;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(General)
            {

                field(Type; Rec.Type)
                {
                    Enabled = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Code; Rec.Code)
                {
                    Enabled = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Code field.';

                }
                field(Description; Rec.Description)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(factboxes)
        {
            part("HR Lookup Values Factbox"; REIHRLookupValuesFactbox)
            {
                SubPageLink = Type = field(Type);
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

