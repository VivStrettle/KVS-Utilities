table 70005 "KVS Time Source Mapping"
{
    Caption = 'KVS Time Source Mapping';
    DataClassification = CustomerContent;

    // Replaces the .ini mapping files: source list to Project, tag to Work Type, and so on.

    fields
    {
        field(1; "Mapping Type"; Enum "KVS Time Mapping Type")
        {
            Caption = 'Mapping Type';
        }
        field(2; "Source Value"; Text[100])
        {
            Caption = 'Source Value';
        }
        field(3; "Target Value"; Code[20])
        {
            Caption = 'Target Value';
        }
        field(4; "Description"; Text[100])
        {
            Caption = 'Description';
        }
        field(5; "Source Type"; Enum "KVS Time Source Type")
        {
            Caption = 'Source Type';
        }
    }

    keys
    {
        key(PK; "Mapping Type", "Source Type", "Source Value")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Source Value", "Target Value", "Description")
        {
        }
    }
}
