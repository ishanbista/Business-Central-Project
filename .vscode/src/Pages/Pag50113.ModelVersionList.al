page 50113 "Model Version List"
{
    ApplicationArea = All;
    Caption = 'Model Version List';
    PageType = List;
    SourceTable = "Model Version";
    UsageCategory = Lists;
    CardPageId = "Model Version Card";

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.', Comment = '%';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.', Comment = '%';
                }
            }
        }
    }
}
