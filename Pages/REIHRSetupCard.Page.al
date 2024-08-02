page 70976576 REIHRSetupCard
{
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    RefreshOnActivate = false;
    SourceTable = REIHRSetup;
    Caption = 'HR Setup';
    UsageCategory = Administration;
    ApplicationArea = All;


    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Leave Posting Period[FROM]"; Rec."Leave Posting Period[FROM]")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Posting Period[FROM] field.';
                }
                field("Leave Posting Period[TO]"; Rec."Leave Posting Period[TO]")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Posting Period[TO] field.';
                }
                field("Default Leave Posting Template"; Rec."Default Leave Posting Template")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Leave Posting Template field.';
                }
                field("Default Leave Posting Batch"; Rec."Default Leave Posting Batch")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Leave Posting Batch field.';
                }
            }
            group(Numbering)
            {
                Caption = 'Numbering';
                field("Training Application Nos."; Rec."Training Application Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Training Application No. field.';
                }
                field("Training Need Nos."; Rec."Training Need Nos.")
                {
                    ToolTip = 'Specifies the value of the Training Need No. field.';
                }
                field("Training Calendar Nos."; Rec."Training Calendar Nos.")
                {
                    ToolTip = 'Specifies the value of the Training Calendar No. field.';
                }
                field("Leave Application Nos."; Rec."Leave Application Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Application Nos. field.';
                }
                field("Article No."; Rec."Article No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Article No. field.';
                }

                field("Disciplinary Cases Nos."; Rec."Disciplinary Cases Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Disciplinary Cases Nos. field.';
                }
                field("Transport Req Nos"; Rec."Transport Req Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Requisition Nos. field.';
                }
                field("Transport Allocation No"; Rec."Transport Allocation No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Allocation Nos. field.';
                }
                field("Employee Requisition Nos."; Rec."Employee Requisition Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Requisition Nos. field.';
                }
                field("Job Application Nos"; Rec."Job Application Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Application Nos field.';
                }
                field("Exit Interview Nos"; Rec."Exit Interview Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Exit Interview Nos field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the JOB ID field.';
                }
                field("Appraisal Nos"; Rec."Appraisal Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Appraisal Nos. field.';
                }
                field("Company Activities"; Rec."Company Activities")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Company Activities field.';
                }
                field("Job Interview Nos"; Rec."Job Interview Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Interview Nos. field.';
                }
                field("Notice Board Nos."; Rec."Notice Board Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Notice Board Nos. field.';
                }
                field("Company Documents"; Rec."Company Documents")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Company Documents field.';
                }
                field("HR Policies"; Rec."HR Policies")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HR Policies field.';
                }
                field("Vacation Reimbursable Nos."; Rec."Vacation Reimbursable Nos.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vacation Reimbursable Nos. field.';
                }
                field("Travel Arrangement No"; Rec."Travel Arrangement No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Travel Arrangement Nos. field.';
                }
                field("Leave Batch Nos"; Rec."Leave Batch Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Leave Batch Nos. field.';
                }
                field("Base Calendar"; Rec."Base Calendar")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Base Calendar field.';
                }
                field("PFA Batch Nos"; Rec."PFA Batch Nos")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PFA Batch Nos field.';
                }
                field("Induction No."; Rec."Induction No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Induction No. field.';
                }
            }
            group("Notification Details")
            {
                Caption = 'Notification Details';
                field("Finance Officer User ID"; Rec."Finance Officer User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Finance Officer User ID field.';
                }
                field("Finance Officer First Name"; Rec."Finance Officer First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Finance Officer First Name field.';
                }
                field("Finance Officer Full Name"; Rec."Finance Officer Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Finance Officer Full Name field.';
                }
                field("Finance Officer Email"; Rec."Finance Officer Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Finance Officer Email field.';
                }
                field("HOD Finance User ID"; Rec."HOD Finance User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOD Finance User ID field.';
                }
                field("HOD Finance Full Name"; Rec."HOD Finance Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOD Finance Full Name field.';
                }
                field("HOD Finance First Name"; Rec."HOD Finance First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOD Finance First Name field.';
                }
                field("HOD Finance Email"; Rec."HOD Finance Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HOD Finance Email field.';
                }
                field("HR Manager ID"; Rec."HR Manager ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HR Manager ID field.';
                }
                field("HR Manager Full Name"; Rec."HR Manager Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HR Manager Full Name field.';
                }
                field("HR Manager First Name"; Rec."HR Manager First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HR Manager First Name field.';
                }
                field("HR Manager E-mail"; Rec."HR Manager E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HR Manager E-mail field.';
                }
                field("Admin Officer ID"; Rec."Admin Officer ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admin Officer ID field.';
                }
                field("Admin First Name"; Rec."Admin First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admin First Name field.';
                }
                field("Admin Full Name"; Rec."Admin Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admin Full Name field.';
                }
                field("Admin Officer E-mail"; Rec."Admin Officer E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admin Officer E-mail field.';
                }

                field("CEO User ID"; Rec."CEO User ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CEO User ID field.';
                }
                field("CEO Full Name"; Rec."CEO Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CEO Full Name field.';
                }
                field("CEO First Name"; Rec."CEO First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CEO First Name field.';
                }
                field("CEO Email"; Rec."CEO Email")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the CEO Email field.';
                }
                field("CFO User ID"; Rec."CFO User ID")
                {
                    ToolTip = 'Specifies the value of the CFO User ID field.';
                }
                field("CFO Full Name"; Rec."CFO Full Name")
                {
                    ToolTip = 'Specifies the value of the CFO Full Name field.';
                }
                field("CFO First Name"; Rec."CFO First Name")
                {
                    ToolTip = 'Specifies the value of the CFO First Name field.';
                }
                field("CFO Email"; Rec."CFO Email")
                {
                    ToolTip = 'Specifies the value of the CFO Email field.';
                }
                field("HCS User ID"; Rec."HCS User ID")
                {
                    ToolTip = 'Specifies the value of the HCS User ID field.';
                }
                field("HCS Full Name"; Rec."HCS Full Name")
                {
                    ToolTip = 'Specifies the value of the HCS Full Name field.';
                }
                field("HCS First Name"; Rec."HCS First Name")
                {
                    ToolTip = 'Specifies the value of the HCS First Name field.';
                }
                field("HCS Email"; Rec."HCS Email")
                {
                    ToolTip = 'Specifies the value of the HCS Email field.';
                }
                field("Country Head User ID"; Rec."Country Head User ID")
                {
                    ToolTip = 'Specifies the value of the Country Head User ID field.';
                }
                field("Country Head Full Name"; Rec."Country Head Full Name")
                {
                    ToolTip = 'Specifies the value of the Country Head Full Name field.';
                }
                field("Country Head First Name"; Rec."Country Head First Name")
                {
                    ToolTip = 'Specifies the value of the Country Head First Name field.';
                }
                field("Country Head Email"; Rec."Country Head Email")
                {
                    ToolTip = 'Specifies the value of the Country Head Email field.';
                }
                field("Maint. Manager ID"; Rec."Maint. Manager ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maint. Manager ID field.';
                }
                field("Maint. Manager First Name"; Rec."Maint. Manager First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maint. Manager First Name field.';
                }
                field("Maint. Manager Full Name"; Rec."Maint. Manager Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maint. Manager Full Name field.';
                }
                field("Maint. Manager E-mail"; Rec."Maint. Manager E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maint. Manager E-mail field.';
                }
                field("Chief Auditor ID"; Rec."Chief Auditor ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chief Auditor ID field.';
                }
                field("Chief Auditor First Name"; Rec."Chief Auditor First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chief Auditor First Name field.';
                }
                field("Chief Auditor Full Name"; Rec."Chief Auditor Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chief Auditor Full Name field.';
                }
                field("Chief Auditor E-mail"; Rec."Chief Auditor E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Chief Auditor E-mail field.';
                }
                field("Payroll Officer ID"; Rec."Payroll Officer ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Officer ID field.';
                }
                field("Payroll Officer First Name"; Rec."Payroll Officer First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Officer First Name field.';
                }
                field("Payroll Officer Full Name"; Rec."Payroll Officer Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Officer Full Name field.';
                }
                field("Payroll Officer E-mail"; Rec."Payroll Officer E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Officer E-mail field.';
                }
                field("Inv Officer ID"; Rec."Inv Officer ID")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv Officer ID field.';
                }
                field("Inv Officer First Name"; Rec."Inv Officer First Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv Officer First Name field.';
                }
                field("Inv Officer Full Name"; Rec."Inv Officer Full Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv Officer Full Name field.';
                }
                field("Inv Officer E-mail"; Rec."Inv Officer E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Inv Officer E-mail field.';
                }

            }

            group(SharedEmails)
            {
                Caption = 'Shared Emails';
                field("Paying Masters E-mail"; Rec."Paying Masters E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Paying Masters E-mail field.';
                }
                field("AllOfUs-Mail"; Rec."AllOfUs-Mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the All Hyde Staff Group Email field.';
                }
                field("HR Team E-mail"; Rec."HR Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the HR Team E-mail field.';
                }
                field("Supply Chain Team E-mail"; Rec."Supply Chain Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Supply Chain Team E-mail field.';
                }
                field("Admin Team E-mail"; Rec."Admin Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Admin Team E-mail field.';
                }
                field("FA Team E-mail"; Rec."FA Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the FA Team E-mail field.';
                }
                field("Maint. Team E-mail"; Rec."Maint. Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Maint. Team E-mail field.';
                }
                field("IT Team E-mail"; Rec."IT Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the IT Team E-mail field.';
                }
                field("Auditor Team E-mail"; Rec."Auditor Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Auditor Team E-mail field.';
                }
                field("Facility Team E-mail"; Rec."Facility Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Facility Team E-mail field.';
                }
                field("Finance Team E-mail"; Rec."Finance Team E-mail")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Finance Team E-mail field.';
                }
                field("HR Careers Email"; Rec."HR Careers Email")
                {
                    ToolTip = 'Specifies the value of the HR Careers Email field.';
                }
            }
            group(Signatures)
            {
                Caption = 'Signatures';
                field("Fin Officer Signature"; Rec."Fin Officer Signature")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Fin Officer Signature field.';
                }
                field("MD Signature"; Rec."MD Signature")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Managing Director Signature field.';
                }
                field("HRM Signature"; Rec."HRM Signature")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Head Of Human Resources Signature field.';
                }
                field("HCS Signature"; Rec."HCS Signature")
                {
                    ToolTip = 'Specifies the value of the HCS Signature field.';
                }
            }
            group(CurrencyDetails)
            {
                Caption = 'Currency Details';
                field("Main Currency Unit"; Rec."Main Currency Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Main Currency Unit field.';
                }
                field("Currency Fractional Unit"; Rec."Currency Fractional Unit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Currency Fractional Unit field.';
                }
            }

        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin

        Rec.RESET();
        IF NOT Rec.GET() THEN BEGIN
            Rec.INIT();
            Rec.INSERT();
        END;
    end;
}

