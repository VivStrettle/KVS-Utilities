table 70000 "KVS Time Entry Buffer"
{
    Caption = 'KVS Time Entry Buffer';
    DataClassification = CustomerContent;

    // Raw source data. Never edited by hand - the pages over this table are read-only.
    // Re-import matches on Source Type + Source Entry ID, so pulling a week twice changes nothing.

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Source Type"; Enum "KVS Time Source Type")
        {
            Caption = 'Source Type';
        }
        field(3; "Source Entry ID"; Text[50])
        {
            Caption = 'Source Entry ID';
        }
        field(4; "Source Task ID"; Text[50])
        {
            Caption = 'Source Task ID';
        }
        field(5; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(6; "Start Time"; Time)
        {
            Caption = 'Start Time';
        }
        field(7; "End Time"; Time)
        {
            Caption = 'End Time';
        }
        field(8; "Duration (Hrs)"; Decimal)
        {
            Caption = 'Duration (Hrs)';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
        }
        field(9; "Source Description"; Text[250])
        {
            Caption = 'Source Description';
        }
        field(10; "Source Space"; Text[100])
        {
            Caption = 'Source Space';
        }
        field(11; "Source Folder"; Text[100])
        {
            Caption = 'Source Folder';
        }
        field(12; "Source List"; Text[100])
        {
            Caption = 'Source List';
        }
        field(13; "Source Task"; Text[100])
        {
            Caption = 'Source Task';
        }
        field(14; "Source Tag"; Text[100])
        {
            Caption = 'Source Tag';
        }
        field(15; "Budget Code"; Code[20])
        {
            Caption = 'Budget Code';
        }
        field(16; Billable; Boolean)
        {
            Caption = 'Billable';
        }
        field(17; "Source User"; Text[100])
        {
            Caption = 'Source User';
        }
        field(18; "Jnl. Line No."; Integer)
        {
            Caption = 'Jnl. Line No.';
            Editable = false;
            TableRelation = "KVS Project Time Jnl. Line"."Line No.";
        }
        field(19; "Imported On"; DateTime)
        {
            Caption = 'Imported On';
            Editable = false;
        }
        field(20; "Import Batch ID"; Guid)
        {
            Caption = 'Import Batch ID';
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(SourceRef; "Source Type", "Source Entry ID")
        {
        }
        key(Grouping; "Jnl. Line No.", "Date", "Source Task", "Source Tag", Billable)
        {
        }
        key(Batch; "Import Batch ID")
        {
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Date", "Source Task", "Duration (Hrs)", "Source Description")
        {
        }
    }
}
