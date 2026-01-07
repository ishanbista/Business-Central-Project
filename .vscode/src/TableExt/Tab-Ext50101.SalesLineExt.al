tableextension 50101 "Sales Line Ext" extends "Sales Line"
{
    fields
    {
        field(50100; "Model Version No."; Code[20])
        {
            Caption = 'Model Version No.';
            DataClassification = ToBeClassified;
            TableRelation = "Model Version";

        }
        field(50101; "Chasis No."; Code[20])
        {
            Caption = 'Chasis No.';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                i: Integer;
                CharTxt: Text[1];
            begin
                TestField("Chasis No.");
                if StrLen("Chasis No.") <> 17 then
                    Error('It must be 17 characters!');
                for i := 1 to StrLen("Chasis No.") do begin
                    CharTxt := CopyStr("Chasis No.", i, 1);
                    if (CharTxt = 'O') or (CharTxt = 'o') then
                        Error('It must not contain O or o!');
                end;
            end;
        }
    }
}
