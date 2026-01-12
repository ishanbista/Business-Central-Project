pageextension 50104 "Item Card Ext" extends "Item Card"
{
    layout
    {
        addafter(Blocked)
        {
            field("Old Posting Group"; Rec."Old Posting Group")
            {
                ApplicationArea = All;
            }
        }
    }
}
