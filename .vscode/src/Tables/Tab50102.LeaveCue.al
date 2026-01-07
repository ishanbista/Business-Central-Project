table 50102 "Leave Cue"
{
    Caption = 'Leave Cue';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Primary Key"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Pending Leave"; Integer)
        {
            Caption = 'Pending Leave';
            FieldClass = FlowField;
            CalcFormula = count("New Leave Request" where(Status = const(Pending)));
        }
        field(3; "Approved Leave"; Integer)
        {
            Caption = 'Approved Leave';
            FieldClass = FlowField;
            CalcFormula = count("New Leave Request" where(Status = const(Approved)));
        }
        field(4; "Rejected Leave"; Integer)
        {
            Caption = 'Rejected Leave';
            FieldClass = FlowField;
            CalcFormula = count("New Leave Request" where(Status = const(Rejected)));
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
