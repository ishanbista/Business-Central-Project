pageextension 50106 "Posted Sales Inv Ext" extends "Posted Sales Invoice"
{
    layout
    {
        addafter("Sell-to Customer Name")
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;
            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = ALl;
            }
            field("Payment Service Set ID"; Rec."Payment Service Set ID")
            {
                ApplicationArea = All;
            }

        }
    }
}
