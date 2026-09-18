table 70001 "KVS Project Time Jnl. Line"
{
    Caption = 'KVS Project Time Jnl. Line';
    DataClassification = CustomerContent;

    // The editable layer. One line per grouping key, holding one or many buffer entries.
    // Posting creates a KVS Project Time Entry and clears the line.

    fields
    {
        field(1; "Line No."; Integer)
        {
            Caption = 'Line No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Project Member"; Code[20])
        {
            Caption = 'Project Member';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
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
        }
        field(7; "Project No."; Code[20])
        {
            Caption = 'Project No.';
            TableRelation = Job;
        }
        field(8; "Project Task No."; Code[20])
        {
            Caption = 'Project Task No.';
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Project No."));
        }
        field(9; "Work Type Code"; Code[10])
        {
            Caption = 'Work Type Code';
            TableRelation = "Work Type";
        }
        field(10; "Task Type"; Code[20])
        {
            Caption = 'Task Type';
        }
        field(11; "Project Stage"; Code[20])
        {
            Caption = 'Project Stage';
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
            MinValue = 0;
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
        field(20; "Source Entry Count"; Integer)
        {
            Caption = 'Source Entry Count';
            FieldClass = FlowField;
            CalcFormula = count("KVS Time Entry Buffer" where("Jnl. Line No." = field("Line No.")));
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Line No.")
        {
            Clustered = true;
        }
        key(Sorting; "Date", "Project No.", "Project Task No.")
        {
        }
        key(Project; "Project No.", "Date")
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
