page 50116 "Service Item List Custom"
{
    ApplicationArea = All;
    Caption = 'Service Item List';
    PageType = List;
    SourceTable = "Service Item";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the serial number of this item.';
                }
                field("Service Item Group Code"; Rec."Service Item Group Code")
                {
                    ToolTip = 'Specifies the code of the service item group associated with this item.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of this item.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.', Comment = '%';
                }
            }
        }
    }
}
