page 50101 "View Posted Document"
{
    ApplicationArea = All;
    Caption = 'View Posted Document';
    PageType = List;
    SourceTable = "Sales Invoice Line";
    UsageCategory = Lists;
    Editable = false;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    DrillDown = false;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the name of the item or general ledger account, or some descriptive text.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the number of units of the item specified on the line.';
                }
            }
        }
    }
}