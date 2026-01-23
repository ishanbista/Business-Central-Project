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
            field("Payment Service Set ID"; Rec."Payment Service Set ID")
            {
                ApplicationArea = All;
            }
            field("Sales Reviewed"; Rec."Sales Reviewed")
            {
                ApplicationArea = All;
            }
            field("Reviewed By"; Rec."Reviewed By")
            {
                ApplicationArea = All;
            }
            field("Reviewed DateTime"; Rec."Reviewed DateTime")
            {
                ApplicationArea = All;
            }

        }

    }
}
