table 50101 "Attendance Entry"
{
    Caption = 'Attendance Entry';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }
        field(2; "User ID"; Code[20])
        {
            Caption = 'User ID';
        }
        field(3; "Date"; Date)
        {
            Caption = 'Date';
        }
        field(4; "Check In "; Time)
        {
            Caption = 'Check In ';
        }
        field(5; "Check Out"; Time)
        {
            Caption = 'Check Out';
        }
        field(6; Location; Text[50])
        {
            Caption = 'Location';
        }

    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
