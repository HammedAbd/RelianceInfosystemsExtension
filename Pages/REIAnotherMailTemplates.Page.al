page 70976581 REIAnotherMailTemplates
{
    ApplicationArea = All;
    Caption = 'Exclude From Doc. WF Mail Template';
    AdditionalSearchTerms = 'change mail template, using another mail template';
    PageType = List;
    SourceTable = REIAnotherMailTemplate;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Table ID field.';
                }
                field("Table Description"; Rec."Table Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Table Description field.';
                }
            }
        }
    }
}
