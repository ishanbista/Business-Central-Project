page 50114 "Model Version Card"
{
    ApplicationArea = All;
    Caption = 'Model Version Card';
    PageType = Card;
    SourceTable = "Model Version";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
                field("Service Item Group"; Rec."Service Item Group")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}
