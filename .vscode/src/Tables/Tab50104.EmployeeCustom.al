table 50104 "Employee Custom"
{
    Caption = 'Employee Custom';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "First Name"; Text[30])
        {
            Caption = 'First Name';
        }
        field(4; "Last Name"; Text[30])
        {
            Caption = 'Last Name';
        }
        field(6; "Job Title"; Text[30])
        {
            Caption = 'Job Title';
        }

        field(13; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';

        }
        field(7; "Search Name"; Code[250])
        {
            Caption = 'Search Name';
        }
        field(70; "Balance (LCY)"; Decimal)
        {

        }
        field(39; Comment; Boolean)
        {

        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


}
