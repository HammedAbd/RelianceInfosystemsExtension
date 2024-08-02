table 70976586 REIEffectivePermissionList
{
    DataClassification = CustomerContent;
    TableType = Temporary;
    fields
    {
        field(70976675; LineNo; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(70976676; "User Security ID"; Guid)
        {
            Caption = 'User Security ID';
            TableRelation = User."User Security ID";
            DataClassification = CustomerContent;
        }
        field(70976677; "Role ID"; Code[20])
        {
            Caption = 'Role ID';
            TableRelation = "Aggregate Permission Set"."Role ID";
            DataClassification = CustomerContent;
        }
        field(70976678; "Company Name"; Text[30])
        {
            Caption = 'Company Name';
            TableRelation = Company.Name;
            DataClassification = CustomerContent;
        }
        field(70976679; "User Name"; Code[50])
        {
            Caption = 'User Name';
            DataClassification = CustomerContent;
        }
        field(70976680; "Role Name"; Text[30])
        {
            Caption = 'Role Name';
            DataClassification = CustomerContent;
        }
        field(70976681; "App Name"; Text[250])
        {
            Caption = 'App Name';
            DataClassification = CustomerContent;
        }
        field(70976682; "Object Type"; Option)
        {
            DataClassification = CustomerContent;
            Caption = 'Object Type';
            OptionMembers = "Table Data","Table",,"Report",,"Codeunit","XMLport","MenuSuite","Page","Query","System",,,,,,,,,;
            OptionCaption = 'Table Data,Table,,Report,,Codeunit,XMLport,MenuSuite,Page,Query,System,,,,,,,,,';
        }
        field(70976683; "Object ID"; Integer)
        {
            Caption = 'Object ID';
            DataClassification = CustomerContent;
        }
        field(70976684; "Object Name"; Text[249])
        {
            Caption = 'Object Name';
            DataClassification = CustomerContent;
        }
        field(70976685; "Read Permission"; Option)
        {
            Caption = 'Read Permission';
            DataClassification = CustomerContent;
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(70976686; "Insert Permission"; Option)
        {
            Caption = 'Insert Permission';
            DataClassification = CustomerContent;
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(70976687; "Modify Permission"; Option)
        {
            Caption = 'Modify Permission';
            DataClassification = CustomerContent;
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(70976688; "Delete Permission"; Option)
        {
            Caption = 'Delete Permission';
            DataClassification = CustomerContent;
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
        field(70976689; "Execute Permission"; Option)
        {
            Caption = 'Execute Permission';
            DataClassification = CustomerContent;
            InitValue = Yes;
            OptionCaption = ' ,Yes,Indirect';
            OptionMembers = " ",Yes,Indirect;
        }
    }
    keys
    {
        key(PK; LineNo)
        {
            Clustered = true;
        }
    }
}