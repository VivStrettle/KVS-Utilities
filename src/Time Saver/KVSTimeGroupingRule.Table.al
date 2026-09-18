table 70004 "KVS Time Grouping Rule"
{
    Caption = 'KVS Time Grouping Rule';
    DataClassification = CustomerContent;

    // Which fields form the grouping key. One row per candidate field.

    fields
    {
        field(1; "Group Field"; Enum "KVS Time Group Field")
        {
            Caption = 'Group Field';
        }
        field(2; "Include in Key"; Boolean)
        {
            Caption = 'Include in Key';
        }
        field(3; "Sequence"; Integer)
        {
            Caption = 'Sequence';
        }
    }

    keys
    {
        key(PK; "Group Field")
        {
            Clustered = true;
        }
        key(Order; "Sequence")
        {
        }
    }
}
