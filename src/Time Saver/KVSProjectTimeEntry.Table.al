table 70002 "KVS Project Time Entry"
{
    Caption = 'KVS Project Time Entry';
    DataClassification = CustomerContent;

    // Posted. Every output reads this table; nothing reads the buffer or the journal.
    // Numbers are fixed at posting. The presentation fields - Work Description and
    // Invoice Description - stay editable so a line can be re-worded for a later
    // destination without a reversal.

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Project Member"; Code[20])
        {
            Caption = 'Project Member';
            Editable = false;
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
            Editable = false;
        }
        field(4; "Week Start Date"; Date)
        {
            Caption = 'Week Start Date';
            Editable = false;
        }
        field(5; "Week No."; Integer)
        {
            Caption = 'Week No.';
            Editable = false;
        }
        field(6; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            TableRelation = Customer;
            Editable = false;
        }
        field(7; "Project No."; Code[20])
        {
            Caption = 'Project No.';
            TableRelation = Job;
            Editable = false;
        }
        field(8; "Project Task No."; Code[20])
        {
            Caption = 'Project Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project No."));
            Editable = false;
        }
        field(9; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";
            Editable = false;
        }
        field(10; "Task Type"; Code[20])
        {
            Caption = 'Task Type';
            Editable = false;
        }
        field(11; "Project Stage"; Code[20])
        {
            Caption = 'Project Stage';
            Editable = false;
        }
        field(12; "Time Spent (Hrs)"; Decimal)
        {
            Caption = 'Time Spent (Hrs)';
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(13; "Time To Bill (Hrs)"; Decimal)
        {
            Caption = 'Time To Bill (Hrs)';
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(14; "Time Spent (Days)"; Decimal)
        {
            Caption = 'Time Spent (Days)';
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(15; "Time To Bill (Days)"; Decimal)
        {
            Caption = 'Time To Bill (Days)';
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(16; Billable; Boolean)
        {
            Caption = 'Billable';
            Editable = false;
        }
        field(17; "Work Description"; Text[250])
        {
            Caption = 'Work Description';
        }
        field(18; "Invoice Description"; Text[250])
        {
            Caption = 'Invoice Description';
        }
        field(19; "Earliest Start Time"; Time)
        {
            Caption = 'Earliest Start Time';
            Editable = false;
        }
        field(20; "Posted On"; DateTime)
        {
            Caption = 'Posted On';
            Editable = false;
        }
        field(21; "Posted By"; Code[50])
        {
            Caption = 'Posted By';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            Editable = false;
        }
        field(30; "FreeAgent Timeslip ID"; Text[50])
        {
            Caption = 'FreeAgent Timeslip ID';
            Editable = false;
        }
        field(31; "FreeAgent Sent On"; DateTime)
        {
            Caption = 'FreeAgent Sent On';
            Editable = false;
        }
        field(32; "Smartsheet Row ID"; Text[50])
        {
            Caption = 'Smartsheet Row ID';
            Editable = false;
        }
        field(33; "Smartsheet Sent On"; DateTime)
        {
            Caption = 'Smartsheet Sent On';
            Editable = false;
        }
        field(34; "Jira Issue Key"; Code[20])
        {
            Caption = 'Jira Issue Key';
        }
        field(35; "Jira Worklog ID"; Text[50])
        {
            Caption = 'Jira Worklog ID';
            Editable = false;
        }
        field(36; "Jira Sent On"; DateTime)
        {
            Caption = 'Jira Sent On';
            Editable = false;
        }
        field(37; "Transferred to Proj. Journal"; Boolean)
        {
            Caption = 'Transferred to Proj. Journal';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(Sorting; "Date", "Project No.", "Project Task No.")
        {
        }
        key(Project; "Project No.", "Date")
        {
        }
        key(WeekView; "Project Member", "Week Start Date")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Date", "Project No.", "Time To Bill (Hrs)", "Invoice Description")
        {
        }
    }
}
