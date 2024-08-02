table 70976578 REIHRSetup
{
    Caption = 'HR Setup Table';

    fields
    {
        field(70976675; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
            DataClassification = CustomerContent;
        }
        field(70976676; "Training Need Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Training Need No.';
            DataClassification = CustomerContent;
        }
        field(70976677; "Training Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Training Application No.';
            DataClassification = CustomerContent;
        }
        field(70976678; "Leave Application Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Leave Application Nos.';
            DataClassification = CustomerContent;
        }
        field(70976679; "Disciplinary Cases Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Disciplinary Cases Nos.';
            DataClassification = CustomerContent;
        }
        field(70976680; "Base Calendar"; Code[10])
        {
            TableRelation = "Base Calendar";
            Caption = 'Base Calendar';
            DataClassification = CustomerContent;
        }
        field(70976681; "Training Calendar Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Training Calendar No.';
            DataClassification = CustomerContent;
        }
        field(70976682; "Transport Allocation No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Transport Allocation Nos.';
            DataClassification = CustomerContent;
        }
        field(70976683; "Transport Req Nos"; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Transport Requisition Nos.';
            DataClassification = CustomerContent;
        }
        field(70976684; "Employee Requisition Nos."; Code[10])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Employee Requisition Nos.';
            DataClassification = CustomerContent;
        }
        field(70976685; "Leave Posting Period[FROM]"; Date)
        {
            Caption = 'Leave Posting Period[FROM]';
            DataClassification = CustomerContent;
        }
        field(70976686; "Leave Posting Period[TO]"; Date)
        {
            Caption = 'Leave Posting Period[TO]';
            DataClassification = CustomerContent;
        }
        field(70976687; "Job Application Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Job Application Nos';
            DataClassification = CustomerContent;
        }
        field(70976688; "Exit Interview Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Exit Interview Nos';
            DataClassification = CustomerContent;
        }
        field(70976689; "Appraisal Nos"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Appraisal Nos.';
            DataClassification = CustomerContent;
        }
        field(70976690; "Company Activities"; Code[10])
        {
            TableRelation = "No. Series";
            Caption = 'Company Activities';
            DataClassification = CustomerContent;
        }
        field(70976691; "Default Leave Posting Template"; Code[10])
        {
            //    TableRelation = "HR Leave Batches Lines"."Doucment No.";
            DataClassification = CustomerContent;
        }
        field(70976692; "Default Leave Posting Batch"; Code[10])
        {
            //   TableRelation = "HR Leave Batches Lines"."Doucment No.";
            DataClassification = CustomerContent;
        }
        field(70976693; "Leave Template"; Code[10])
        {
            //   TableRelation = "HR Leave Batches Lines"."Line No.";
            DataClassification = CustomerContent;
        }
        field(70976694; "Leave Batch"; Code[10])
        {
            //    TableRelation = "HR Leave Batches Lines"."Line No.";
            DataClassification = CustomerContent;
        }
        field(70976695; "Job Interview Nos"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Job Interview Nos.';
            DataClassification = CustomerContent;
        }
        field(70976696; "Company Documents"; Code[20])
        {
            TableRelation = "No. Series".Code;
            Caption = 'Company Documents';
            DataClassification = CustomerContent;
        }
        field(70976697; "HR Policies"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'HR Policies';
            DataClassification = CustomerContent;
        }
        field(70976698; "Notice Board Nos."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Notice Board Nos.';
            DataClassification = CustomerContent;
        }
        field(70976699; "Vacation Reimbursable Nos."; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Vacation Reimbursable Nos.';
            DataClassification = CustomerContent;
        }
        field(70976700; "Leave Batch Nos"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Leave Batch Nos.';
            DataClassification = CustomerContent;
        }
        field(70976701; "Travel Arrangement No"; Code[20])
        {
            TableRelation = "No. Series";
            Caption = 'Travel Arrangement Nos.';
            DataClassification = CustomerContent;
        }
        field(70976702; "Employee No"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70976703; "Induction No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70976704; "HR Careers Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976705; "SO Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976706; "CIS Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976707; "FA Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976708; "DS Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976709; "HR Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976710; "ID Card Request No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70976711; "Article No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70976712; "View Employee Records"; Boolean)
        {
            DataClassification = CustomerContent;
        }
        field(70976713; "HOD Finance Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976714; "CEO Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976715; "HOD Finance Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976716; "HOD Finance User ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("HOD Finance User ID") THEN begin
                    "HOD Finance Full Name" := UserSetup."Full Name";
                    "HOD Finance Email" := UserSetup."E-Mail";
                    "HOD Finance First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "HOD Finance Full Name" := '';
                    "HOD Finance Email" := '';
                    "HOD Finance First Name" := '';
                end;
            end;
        }
        field(70976717; "CEO Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976718; "CEO User ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("CEO User ID") THEN begin
                    "CEO Full Name" := UserSetup."Full Name";
                    "CEO Email" := UserSetup."E-Mail";
                    "CEO First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "CEO Full Name" := '';
                    "CEO Email" := '';
                    "CEO First Name" := '';
                end;
            end;
        }
        field(70976719; "PFA Batch Nos"; Code[20])
        {
            Caption = 'PFA Batch Nos';
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70976720; "HOD Finance First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976721; "CEO First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976722; "HR Manager First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976723; "HR Manager E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976724; "HR Manager Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976725; "HR Manager ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("HR Manager ID") THEN begin
                    "HR Manager Full Name" := UserSetup."Full Name";
                    "HR Manager E-mail" := UserSetup."E-Mail";
                    "HR Manager First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "HR Manager Full Name" := '';
                    "HR Manager E-mail" := '';
                    "HR Manager First Name" := '';
                end;
            end;
        }
        field(70976726; "Finance Officer Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976727; "Finance Officer Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976728; "Finance Officer User ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("Finance Officer User ID") THEN begin
                    "Finance Officer Full Name" := UserSetup."Full Name";
                    "Finance Officer Email" := UserSetup."E-Mail";
                    "Finance Officer First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "Finance Officer Full Name" := '';
                    "Finance Officer Email" := '';
                    "Finance Officer First Name" := '';
                end;
            end;
        }
        field(70976729; "Finance Officer First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976730; "AllOfUs-Mail"; Text[250])
        {
            Caption = 'All Hyde Staff Group Email';
            DataClassification = CustomerContent;
        }
        field(70976731; "Fin Officer Signature"; Media)
        {
            Caption = 'Fin Officer Signature';
            DataClassification = CustomerContent;
        }
        field(70976732; "JOB ID"; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "No. Series";
        }
        field(70976733; "Admin First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976734; "Admin Officer E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976735; "Admin Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976736; "Admin Officer ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("Admin Officer ID") THEN begin
                    "Admin Full Name" := UserSetup."Full Name";
                    "Admin Officer E-mail" := UserSetup."E-Mail";
                    "Admin First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "Admin Full Name" := '';
                    "Admin Officer E-mail" := '';
                    "Admin First Name" := '';
                end;
            end;
        }
        field(70976738; "Supply Chain Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976739; "Maint. Manager First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976740; "Maint. Manager E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976741; "Maint. Manager Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976742; "Maint. Manager ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("Maint. Manager ID") THEN begin
                    "Maint. Manager Full Name" := UserSetup."Full Name";
                    "Maint. Manager E-mail" := UserSetup."E-Mail";
                    "Maint. Manager First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "Maint. Manager Full Name" := '';
                    "Maint. Manager E-mail" := '';
                    "Maint. Manager First Name" := '';
                end;
            end;
        }
        field(70976743; "Maint. Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976744; "Admin Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976745; "IT Team E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976746; "Main Currency Unit"; Text[15])
        {
            DataClassification = CustomerContent;
        }
        field(70976747; "Currency Fractional Unit"; Text[15])
        {
            DataClassification = CustomerContent;
        }
        field(70976748; "MD Signature"; Media)
        {
            Caption = 'Chief Executive Signature';
            DataClassification = CustomerContent;
        }
        field(70976749; "HRM Signature"; Media)
        {
            Caption = 'Head Of Human Resources Signature';
            DataClassification = CustomerContent;
        }
        field(70976750; "Payroll Officer First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976751; "Payroll Officer E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976752; "Payroll Officer Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976753; "Payroll Officer ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("Payroll Officer ID") THEN begin
                    "Payroll Officer Full Name" := UserSetup."Full Name";
                    "Payroll Officer E-mail" := UserSetup."E-Mail";
                    "Payroll Officer First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "Payroll Officer Full Name" := '';
                    "Payroll Officer E-mail" := '';
                    "Payroll Officer First Name" := '';
                end;
            end;
        }
        field(70976754; "Chief Auditor First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976755; "Chief Auditor E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976756; "Chief Auditor Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976757; "Chief Auditor ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("Chief Auditor ID") THEN begin
                    "Chief Auditor Full Name" := UserSetup."Full Name";
                    "Chief Auditor E-mail" := UserSetup."E-Mail";
                    "Chief Auditor First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "Chief Auditor Full Name" := '';
                    "Chief Auditor E-mail" := '';
                    "Chief Auditor First Name" := '';
                end;
            end;
        }
        field(70976758; "Paying Masters E-mail"; Text[1000])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976759; "Inv Officer First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976760; "Inv Officer E-mail"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976761; "Inv Officer Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976762; "Inv Officer ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("Inv Officer ID") THEN begin
                    "Inv Officer Full Name" := UserSetup."Full Name";
                    "Inv Officer E-mail" := UserSetup."E-Mail";
                    "Inv Officer First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "Inv Officer Full Name" := '';
                    "Inv Officer E-mail" := '';
                    "Inv Officer First Name" := '';
                end;
            end;
        }
        field(70976763; "Auditor Team E-mail"; Text[150])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976764; "Finance Team E-mail"; Text[150])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976765; "Facility Team E-mail"; Text[200])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976766; "CFO Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976767; "CFO First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976768; "CFO Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976769; "CFO User ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("CFO User ID") THEN begin
                    "CFO Full Name" := UserSetup."Full Name";
                    "CFO Email" := UserSetup."E-Mail";
                    "CFO First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "CFO Full Name" := '';
                    "CFO Email" := '';
                    "CFO First Name" := '';
                end;
            end;
        }
        field(70976770; "HCS Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976771; "HCS First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976772; "HCS Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976773; "HCS User ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("HCS User ID") THEN begin
                    "HCS Full Name" := UserSetup."Full Name";
                    "HCS Email" := UserSetup."E-Mail";
                    "HCS First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "HCS Full Name" := '';
                    "HCS Email" := '';
                    "HCS First Name" := '';
                end;
            end;
        }
        field(70976774; "Country Head Email"; Text[100])
        {
            DataClassification = CustomerContent;
            ExtendedDatatype = EMail;
        }
        field(70976775; "Country Head First Name"; Text[30])
        {
            DataClassification = CustomerContent;
        }
        field(70976776; "Country Head Full Name"; Text[100])
        {
            DataClassification = CustomerContent;
            Editable = false;
        }
        field(70976777; "Country Head User ID"; Code[30])
        {
            DataClassification = CustomerContent;
            TableRelation = "User Setup"."User ID";

            trigger OnValidate()
            begin
                UserSetup.Reset();
                IF UserSetup.GET("Country Head User ID") THEN begin
                    "Country Head Full Name" := UserSetup."Full Name";
                    "Country Head Email" := UserSetup."E-Mail";
                    "Country Head First Name" := CopyStr(
                        UserSetup."Full Name", 1,
                        StrPos(UserSetup."Full Name", ' ')
                    )
                end ELSE begin
                    "Country Head Full Name" := '';
                    "Country Head Email" := '';
                    "Country Head First Name" := '';
                end;
            end;
        }
        field(70976778; "HCS Signature"; media)
        {
            Caption = 'HCS Signature';
            DataClassification = CustomerContent;
        }
    }


    keys
    {
        key(Key1; "Primary Key")
        {
        }
    }

    var
        UserSetup: Record "User Setup";
}

