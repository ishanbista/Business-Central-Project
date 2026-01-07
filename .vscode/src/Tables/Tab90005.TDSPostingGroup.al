table 50107 "TDS Posting Group"
{
    Caption = 'TDS Posting Group';
    DataClassification = ToBeClassified;
    // DrillDownPageId = "TDS Posting Group";
    // LookupPageId = "TDS Posting Group";

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; "TDS %"; Decimal)
        {
            Caption = 'TDS %';
            DataClassification = ToBeClassified;
        }
        field(3; "GL Account No."; Code[20])
        {
            Caption = 'GL Account No.';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(4; Type; Option)
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Purchase TDS","Sales TDS";
        }
        field(5; "Effective From"; Date)
        {
            Caption = 'Effective From';
            DataClassification = ToBeClassified;
        }
        field(6; Blocked; Boolean)
        {
            Caption = 'Blocked';
            DataClassification = ToBeClassified;
        }
        field(7; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(8; "IRD Code"; Text[10])
        {
            DataClassification = ToBeClassified;
            Caption = 'IRD Code';
        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; Code, "IRD Code", "TDS %", Description)
        {
        }
        fieldgroup(Brick; Code, "IRD Code", "TDS %", Description)
        {
        }
    }
    procedure FindTDSGroup(TDSGroup: Code[20]; EffectiveDate: Date): Boolean
    begin
        RESET;
        SETRANGE(Code, TDSGroup);
        SETRANGE(Blocked, FALSE);
        //SETFILTER("Effective From",'<%1',EffectiveDate);
        EXIT(FINDLAST);
    end;
}
