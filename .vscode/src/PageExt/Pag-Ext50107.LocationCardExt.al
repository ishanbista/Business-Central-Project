pageextension 50107 "Location Card Ext" extends "Location Card"
{
    layout
    {
        addafter("Use As In-Transit")
        {
            field("Make Field Editable"; Rec."Make Field Editable")
            {
                ApplicationArea = All;
            }
            field(MakeNameEditable; Rec."Make Name Editable")
            {
                ApplicationArea = All;
            }
            // field("Old Posting Group"; Rec."Old Posting Group")
            // {
            //     ApplicationArea = All;
            // }
        }
        modify(Name)
        {
            Editable = NameEditable;
        }
    }
    trigger OnAfterGetRecord()

    begin
        if Rec."Make Name Editable" then
            NameEditable := true
        else
            NameEditable := false;
    end;

    var
        NameEditable: Boolean;
}
