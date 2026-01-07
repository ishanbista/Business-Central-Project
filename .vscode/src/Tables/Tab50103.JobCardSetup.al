table 50103 "Job Card Setup"
{
    Caption = 'Job Card Setup';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            Caption = 'Primary Key';
        }
        field(2; "Last Serial No."; Integer)
        {
            Caption = 'Last Serial No.';
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
