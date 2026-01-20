tableextension 50100 "Sales Inv Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Serial No."; Integer)
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
        field(50101; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50102; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

    }
}
