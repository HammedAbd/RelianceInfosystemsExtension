page 70976575 REIHREmployeeKinSF
{
    Caption = 'HR Employee Kin & Beneficiaries';
    PageType = List;
    SourceTable = REIHREmployeeKin;
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
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Relationship; Rec.Relationship)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Relationship field.';
                }
                field(SurName; Rec.SurName)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the SurName field.';
                }
                field("Other Names"; Rec."Other Names")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Other Names field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Work Tel No"; Rec."Work Tel No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Work Tel No field.';
                }
                field("Home Tel No"; Rec."Home Tel No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Home Tel No field.';
                }
                field("E-mail"; Rec."E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the E-mail field.';
                }
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    Visible = true;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Occupation; Rec.Occupation)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Occupation field.';
                }

                field(Comment; Rec.Comment)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Next of Kin")
            {
                Caption = '&Next of Kin';
                action("Co&mments")
                {
                    Caption = 'Co&mments';
                    Image = Comment;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const("Employee Relative"),
                                  "No." = field("Employee Code"),
                                  "Table Line No." = field("Line No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
        }
    }
}

