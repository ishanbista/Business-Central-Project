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
        field(50106; "Sales Reviewed"; Boolean)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                if "Sales Reviewed" then
                    "Reviewed By" := UserId();
                "Reviewed DateTime" := CurrentDateTime();
            end;
        }
        field(50107; "Reviewed By"; Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50108; "Reviewed DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(50109; "Released Date"; Date)
        {
            Caption = 'Released Date';
            Editable = false;
            DataClassification = ToBeClassified;
            trigger OnValidate()
            begin
                "Released Time" := DT2Time(CurrentDateTime);
                "Invoice Time" := DT2Time(CurrentDateTime);
            end;
        }
        field(50110; "Released Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(50111; "Invoice Time"; Time)
        {
            DataClassification = ToBeClassified;
        }

    }
}
