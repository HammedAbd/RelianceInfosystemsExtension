table 70976583 REICustomSetup
{
    Caption = 'Custom Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(70976575; "Primary Key"; Code[30])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(70976576; "Complaint No."; Code[20])
        {
            Caption = 'Complaint No.';
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976577; "Foreman E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976578; "Technician E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976579; "Workshop Manager E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976580; "VPU E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976581; "Service Advisor E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976582; "Request for Quote Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976583; "Quote Evaluation Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976584; "Auditor E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976585; "Inventory Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976586; "Procurement Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976587; "Admin Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976588; "HR Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976589; "Logistics Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976590; "Gate Pass (Out) Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976591; "Gate Pass (In) Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976592; "Vehicle Breakdown Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976593; "Project Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976594; "Warehouse Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }

        field(70976595; "VD No."; Code[20])  //Vehicle defect No series
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Vehicle Defect';

        }
        field(70976596; "DO No."; Code[20])  //Depot Operation No series
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Depot Operation';
        }
        field(70976597; "TA No."; Code[20])  //Trip Analysis No series
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
            Caption = 'Trip Analysis';
        }
        field(70976598; "Work Hours"; Duration)  //Trip Analysis No series
        {
            DataClassification = CustomerContent;
            //TableRelation = "No. Series";
            Caption = 'Daily Work Hour Duration';
        }

        field(70976599; "Network and Plan. Head Email"; Code[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
            //TableRelation = "No. Series";
        }
        field(70976600; "Accident Unit Team Email"; Code[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
            //TableRelation = "No. Series";
        }
        field(70976601; "Fleet Analyst Team Email"; Code[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
            //TableRelation = "No. Series";
        }
        field(70976602; "Schedule Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976603; "Ground Staff Admin Email"; Code[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976604; "Diagnosis Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976605; "Fleet Schedule First Weekday"; Option)
        {
            Caption = 'Fleet Schedule First Weekday';
            OptionCaption = 'Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday';
            OptionMembers = Monday,Tuesday,Wednesday,Thursday,Friday,Saturday,Sunday;

            trigger OnValidate()
            begin
                /* if "Time Sheet First Weekday" <> xRec."Time Sheet First Weekday" then begin
                    TimeSheetHeader.reset()();
                    if not TimeSheetHeader.IsEmpty() then
                        Error(Text002Err, FieldCaption("Time Sheet First Weekday"));
                end; */

                FSCHEADERRecRef.Open(60621);
                FSCHEADERRecRef.reset();
                if not FSCHEADERRecRef.IsEmpty() then
                    Error(Text002Err, FieldCaption("Fleet Schedule First Weekday"));
            end;
        }
        field(70976606; "COO E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976607; "Schedule Adjust-Owner Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976608; "Legal Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976610; "HOI E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976611; "HOI Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976612; "HOI User ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.reset();
                IF UserSetup.GET("HOI User ID") THEN BEGIN
                    "HOI Full Name" := UserSetup."Full Name";
                    "HOI E-mail" := UserSetup."E-Mail"
                END;
                IF "HOI User ID" = '' then BEGIN
                    "HOI Full Name" := '';
                    "HOI E-mail" := '';
                END;
            end;
        }
        field(70976613; "ED E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976614; "ED Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976615; "ED User ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.reset();
                IF UserSetup.GET("ED User ID") THEN BEGIN
                    "ED Full Name" := UserSetup."Full Name";
                    "ED E-mail" := UserSetup."E-Mail"
                END;
                IF "ED User ID" = '' then begin
                    "ED Full Name" := '';
                    "ED E-mail" := '';
                end;
            end;
        }
        field(70976616; "Job Archive Code"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976617; "Operations Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976618; "Cash Receipt Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976619; "Driver No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976620; "Ticket Merge Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976621; "Loading Ticket Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976622; "Waybill Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976623; "Batch Nos."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976624; "Retail Sales No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976625; "Lubricant Sales No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976626; "Product No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976627; "CFO E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976628; "ATL No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }
        field(70976629; "Truck Entry Permit No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }

        field(70976630; "Loading Order Receipt No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series".Code;
        }


    }
    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

    var
        UserSetup: Record "User Setup";
        FSCHEADERRecRef: RecordRef;
        Text002Err: Label '%1 cannot be changed, because there is at least one fleet schedule.', Comment = '%1 = Fleet No.';
}
