pageextension 50105 "Sales Order Ext" extends "Sales Order"
{
    layout
    {
        addafter(Status)
        {
            field("Employee No."; Rec."Employee No.")
            {
                ApplicationArea = All;

            }
            field("Employee Name"; Rec."Employee Name")
            {
                ApplicationArea = All;
            }
            field("Location from Code"; Rec."Location from Code")
            {
                ApplicationArea = All;
            }
        }
    }
}
