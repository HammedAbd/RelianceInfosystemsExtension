page 70976589 REIHREMailParameter
{
    Caption = 'HR E-Mail Parameter';
    PageType = Card;
    SourceTable = REIHREMailParameters;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Associate With"; Rec."Associate With")
                {
                    ToolTip = 'Specifies the value of the Associate With field.';
                    ApplicationArea = All;
                }
                field(Body; Rec.Body)
                {
                    ToolTip = 'Specifies the value of the Body field.';
                    ApplicationArea = All;
                }
                field("Body 2"; Rec."Body 2")
                {
                    ToolTip = 'Specifies the value of the Body 2 field.';
                    ApplicationArea = All;
                }
                field("Body 3"; Rec."Body 3")
                {
                    ToolTip = 'Specifies the value of the Body 3 field.';
                    ApplicationArea = All;
                }
                field("Body 4"; Rec."Body 4")
                {
                    ToolTip = 'Specifies the value of the Body 4 field.';
                    ApplicationArea = All;
                }
                field("Body 5"; Rec."Body 5")
                {
                    ToolTip = 'Specifies the value of the Body 5 field.';
                    ApplicationArea = All;
                }
                field(HTMLFormatted; Rec.HTMLFormatted)
                {
                    ToolTip = 'Specifies the value of the HTMLFormatted field.';
                    ApplicationArea = All;
                }
                field(Recipients; Rec.Recipients)
                {
                    ToolTip = 'Specifies the value of the Recipients field.';
                    ApplicationArea = All;
                    MultiLine = true;
                }
                field("Sender Address"; Rec."Sender Address")
                {
                    ToolTip = 'Specifies the value of the Sender Address field.';
                    ApplicationArea = All;
                }
                field("Sender Name"; Rec."Sender Name")
                {
                    ToolTip = 'Specifies the value of the Sender Name field.';
                    ApplicationArea = All;
                }
                field(Subject; Rec.Subject)
                {
                    ToolTip = 'Specifies the value of the Subject field.';
                    ApplicationArea = All;
                }
                
            }
        }
    }
}
