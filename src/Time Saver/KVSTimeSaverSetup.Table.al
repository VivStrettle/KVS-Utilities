table 70003 "KVS Time Saver Setup"
{
    Caption = 'KVS Time Saver Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }
        field(10; "Week Start Day"; Enum "KVS Week Start Day")
        {
            Caption = 'Week Start Day';
            InitValue = Monday;
        }
        field(11; "Week No. Convention"; Enum "KVS Week No. Convention")
        {
            Caption = 'Week No. Convention';
        }
        field(12; "Day Boundary Starts At"; Time)
        {
            Caption = 'Day Boundary Starts At';
            // 00:00 keeps calendar dating. Set to e.g. 04:00 to put small-hours work
            // with the working day it belongs to.
        }
        field(13; "Default Hours per Day"; Decimal)
        {
            Caption = 'Default Hours per Day';
            DecimalPlaces = 0 : 2;
            MinValue = 0;
            // Fallback only. Hours per day held against the Project wins where present.
        }
        field(14; "Default Invoice Desc."; Enum "KVS Invoice Desc. Default")
        {
            Caption = 'Default Invoice Description';
        }
        field(15; "Description Separator"; Text[10])
        {
            Caption = 'Description Separator';
            InitValue = '; ';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}
