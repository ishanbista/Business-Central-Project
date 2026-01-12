page 50120 "Vehicle Service Ledger List"
{
    ApplicationArea = All;
    Caption = 'Vehicle Service Ledger List';
    PageType = List;
    SourceTable = "Vehicle Service Ledger";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.', Comment = '%';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ToolTip = 'Specifies the value of the Vehicle No. field.', Comment = '%';
                }
                field("Service Date"; Rec."Service Date")
                {
                    ToolTip = 'Specifies the value of the Service Date field.', Comment = '%';
                }
                field("Service Type"; Rec."Service Type")
                {
                    ToolTip = 'Specifies the value of the Service Type field.', Comment = '%';
                }
                field("Service Cost"; Rec."Service Cost")
                {
                    ToolTip = 'Specifies the value of the Service Cost field.', Comment = '%';
                }
            }
        }
    }
}
