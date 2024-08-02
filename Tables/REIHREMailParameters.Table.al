table 70976579 REIHREMailParameters
{
    Caption = 'HR E-Mail Parameters';
    DataClassification = CustomerContent;

    fields
    {
        field(70976675; "Associate With"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Associate With';
            OptionMembers = "Vacancy Advertisements","Interview Invitations",General;
        }
        field(70976676; "Sender Name"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Sender Name';
        }
        field(70976677; "Sender Address"; Text[30])
        {
            DataClassification = CustomerContent;
            Caption = 'Sender Address';
        }
        field(70976678; Recipients; Text[300])
        {
            Caption = 'Recipients';
            DataClassification = CustomerContent;
        }
        field(70976679; Subject; Text[100])
        {
            Caption = 'Subject';
            DataClassification = CustomerContent;
        }
        field(70976680; Body; Text[100])
        {
            Caption = 'Body';
            DataClassification = CustomerContent;
        }
        field(70976681; "Body 2"; Text[250])
        {
            Caption = 'Body 2';
            DataClassification = CustomerContent;
        }
        field(70976682; HTMLFormatted; Boolean)
        {
            Caption = 'HTMLFormatted';
            DataClassification = CustomerContent;
        }
        field(70976683; "Body 3"; Text[250])
        {
            Caption = 'Body 3';
            DataClassification = CustomerContent;
        }
        field(70976684; "Body 4"; Text[250])
        {
            Caption = 'Body 4';
            DataClassification = CustomerContent;
        }
        field(70976685; "Body 5"; Text[250])
        {
            Caption = 'Body 5';
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK; "Associate With")
        {
            Clustered = true;
        }
    }

}
