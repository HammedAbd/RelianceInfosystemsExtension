table 70976585 REIHRLookupValues
{
    Caption = 'HR Lookup Values';
    DataClassification = CustomerContent;
    LookupPageId = REIHRLookupValuesList;

    fields
    {
        field(70976675; Type; Option)
        {
            Caption = 'Type';
            DataClassification = CustomerContent;
            OptionMembers = Religion,Language,"Medical Scheme",Location,"Contract Type","Qualification Type",Stages,Scores,Institution,"Appraisal Type","Appraisal Period",Urgency,Succession,Security,"Disciplinary Case Rating","Disciplinary Case","Disciplinary Action","Next of Kin",Country,Grade,"Checklist Item","Appraisal Sub Category","Appraisal Group Item","Transport Type","Grievance Cause","Grievance Outcome","Appraiser Recom";
            OptionCaption = 'Religion,Language,Medical Scheme,Location,Contract Type,Qualification Type,Stages,Scores,Institution,Appraisal Type,Appraisal Period,Urgency,Succession,Security,Disciplinary Case Rating,Disciplinary Case,Disciplinary Action,Next of Kin,Country,Grade,Checklist Item,Appraisal Sub Category,Appraisal Group Item,Transport Type,Grievance Cause,Grievance Outcome,Appraiser Recom';
        }
        field(70976676; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = CustomerContent;
        }
        field(70976677; Description; Text[80])
        {
            Caption = 'Description';
            DataClassification = CustomerContent;
        }
        field(70976678; Remarks; Text[250])
        {
            Caption = 'Remarks';
            DataClassification = CustomerContent;
        }
        field(70976679; "Notice Period"; Date)
        {
            Caption = 'Notice Period';
            DataClassification = CustomerContent;
        }
        field(70976680; Closed; Boolean)
        {
            Caption = 'Closed';
            DataClassification = CustomerContent;
            trigger Onvalidate()
            begin
                "Last Date Modified" := TODAY;
            end;
        }
        field(70976681; "Contract Length"; Integer)
        {
            Caption = 'Contract Length';
            DataClassification = CustomerContent;
        }
        field(70976682; "Current Appraisal Period"; Boolean)
        {
            Caption = 'Current Appraisal Period';
            DataClassification = CustomerContent;
        }
        field(70976683; "Disciplinary Case Rating"; Text[100])
        {
            Caption = 'Disciplinary Case Rating';
            DataClassification = CustomerContent;
            TableRelation = REIHRLookupValues.Code where(Type = const("Disciplinary Case Rating"));
        }
        field(70976684; "Disciplinary Action"; Code[20])
        {
            Caption = 'Disciplinary Action';
            DataClassification = CustomerContent;
            TableRelation = REIHRLookupValues.Code where(Type = const("Disciplinary Action"));
        }
        field(70976685; From; Date)
        {
            Caption = 'From';
            DataClassification = CustomerContent;
        }
        field(70976686; To; Date)
        {
            Caption = 'To';
            DataClassification = CustomerContent;
        }
        field(70976687; Score; Decimal)
        {
            Caption = 'Score';
            DataClassification = CustomerContent;
        }
        field(70976688; "Basic Salary"; Decimal)
        {
            Caption = 'Basic Salary';
            DataClassification = CustomerContent;
        }
        field(70976689; "To be cleared  by"; Code[10])
        {
            Caption = 'To be cleared  by';
            DataClassification = CustomerContent;
            TableRelation = REIHRLookupValues.Remarks;
        }
        field(70976690; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = CustomerContent;
        }
        field(70976691; "Supervisor Only"; Boolean)
        {
            Caption = 'Supervisor Only';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; Type, Code)
        {
            Clustered = true;
        }

    }
    trigger Oninsert()
    begin
        IF Type = Type::"Appraisal Period" THEN BEGIN
            HrLookupValues.Reset();
            HrLookupValues.SETRANGE(HrLookupValues.Type, HrLookupValues.Type::"Appraisal Period");
            HrLookupValues.SETRANGE(HrLookupValues.Closed, FALSE);
            IF HrLookupValues.FindFirst() THEN
                ERROR('Close the Appraisal Period %1', HrLookupValues.Code);
        END
    end;

    var
        HRLookupValues: Record REIHRLookupValues;
}
