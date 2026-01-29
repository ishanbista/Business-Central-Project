table 50114 "Picker/Packer"
{
    Caption = 'Picker/Packer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; Code; Code[20])
        {
            Caption = 'Code';
            DataClassification = ToBeClassified;
        }
        field(2; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(3; Picker; Boolean)
        {
            Caption = 'Picker';
            DataClassification = ToBeClassified;
        }
        field(4; Packer; Boolean)
        {
            Caption = 'Packer';
            DataClassification = ToBeClassified;
        }
        // field(5; Type; option)
        // {
        //     OptionMembers = " ","Picker/packer","Transport";
        // }
        field(6; Transport; Boolean)
        {

        }
    }
    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

}
