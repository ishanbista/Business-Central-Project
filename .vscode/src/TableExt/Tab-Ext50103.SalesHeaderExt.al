tableextension 50103 "Sales Header Ext" extends "Sales Header"
{
    fields
    {
        field(50103; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Employee No.") then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
            end;
        }
        field(50104; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50105; "Location from Code"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Location.Code;
        }


    }
}
