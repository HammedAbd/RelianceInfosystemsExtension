page 70976580 REIHRLookupValuesFactbox
{
    Caption = 'HR Lookup Values Factbox';
    PageType = CardPart;
    SourceTable = REIHRLookupValues;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            field(Type; Rec.Type)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Type field.';
            }
            field(Code; Rec.Code)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Code field.';
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Description field.';
            }
            field(Remarks; Rec.Remarks)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Remarks field.';
            }
            field("Notice Period"; Rec."Notice Period")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Notice Period field.';
            }
            field(Closed; Rec.Closed)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Closed field.';
            }
            field("Contract Length"; Rec."Contract Length")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Contract Length field.';
            }
            field("Current Appraisal Period"; Rec."Current Appraisal Period")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Current Appraisal Period field.';
            }
            field("Disciplinary Case Rating"; Rec."Disciplinary Case Rating")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Disciplinary Case Rating field.';
            }
            field("Disciplinary Action"; Rec."Disciplinary Action")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Disciplinary Action field.';
            }
            field(From; Rec.From)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the From field.';
            }
            field("To"; Rec."To")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the To field.';
            }
            field(Score; Rec.Score)
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Score field.';
            }
            field("Basic Salary"; Rec."Basic Salary")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the Basic Salary field.';
            }

            field("To be cleared  by"; Rec."To be cleared  by")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the To be cleared  by field.';
            }
        }
    }

    actions
    {
    }
}

