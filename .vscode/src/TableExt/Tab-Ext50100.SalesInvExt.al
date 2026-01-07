tableextension 50100 "Sales Inv Ext" extends "Sales Invoice Header"
{
    fields
    {
        field(50100; "Serial No."; Integer)
        {
            Caption = 'Serial No.';
            DataClassification = ToBeClassified;
        }
    }
}
