table 50105 "Model Version"
{
    Caption = 'Model Version';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; Description; Text[100])
        {
            Caption = 'Description';
        }
        field(3; "Service Item Group"; Code[20])
        {
            Caption = 'Service Item Group';
            TableRelation = "Service Item Group Custom";
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
