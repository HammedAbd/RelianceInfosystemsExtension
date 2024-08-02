table 70976576 REIDocumentWorkflow
{

    fields
    {
        field(70976575; "User ID"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = CustomerContent;
        }
        field(70976576; "Table No."; Integer)
        {
            //TableRelation = AllObj."Object ID" WHERE ("Object Type"=FILTER(Table));
            DataClassification = CustomerContent;

            trigger OnLookup()
            var
                AllObjLocal: Record AllObj;
            begin
                AllObjLocal.SetRange("Object Type", AllObjLocal."Object Type"::Table);
                IF PAGE.RUNMODAL(Page::REIAllObjectsPage, AllObjLocal) = ACTION::LookupOK THEN BEGIN
                    Rec."Table No." := AllObjLocal."Object ID";
                    Rec."Table Name" := AllObjLocal."Object Name";
                end;
            end;

            trigger OnValidate()
            begin
                IF AllObj.GET(AllObj."Object Type"::Table, "Table No.") THEN
                    "Table Name" := AllObj."Object Name"
                ELSE
                    "Table Name" := '';
            end;
        }
        field(70976577; "Table Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976578; "1st Approver"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = CustomerContent;
        }
        field(70976579; "2nd Approver"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = CustomerContent;
        }
        field(70976580; "3rd Approver"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = CustomerContent;
        }
        field(70976581; "4th Approver"; Code[50])
        {
            TableRelation = "User Setup"."User ID";
            DataClassification = CustomerContent;
        }
        field(70976582; Enable; Boolean)
        {
            DataClassification = CustomerContent;
            trigger OnValidate()
            begin

                IF "1st Approver" = '' THEN
                    ERROR('At least one approver must be configured for you. Contact your system administrator!');
            end;
        }
        field(70976583; "5th Approver"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
        }
        field(70976584; "6th Approver"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
        }
        field(70976585; "7th Approver"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
        }
        field(70976586; "Approval Limit"; Decimal)
        {
            DataClassification = CustomerContent;
        }
        field(70976587; "MD Approval"; Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";
        }
    }

    keys
    {
        key(Key1; "User ID", "Table No.")
        {
        }
    }

    fieldgroups
    {
    }

    var
        AllObj: Record AllObj;
}

