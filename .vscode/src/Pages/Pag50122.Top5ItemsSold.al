page 50122 "Top 5 Items Sold"
{
    ApplicationArea = All;
    Caption = 'Top 5 Items Sold';
    PageType = List;
    SourceTable = "Item Sales Buffer";
    SourceTableTemporary = true;
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the value of the Item No. field.', Comment = '%';
                }
                field("Quantity Sold"; Rec."Quantity Sold")
                {
                    ToolTip = 'Specifies the value of the Quantity Sold field.', Comment = '%';
                }
            }
        }
    }
    var
        RowCount: Integer;


    // trigger OnAfterGetCurrRecord()
    // begin
    //     RowCount += 1;
    //     if RowCount > 5 then
    //         CurrPage.Close();
    // end;

    trigger OnOpenPage()
    var
        SysMgmt: Codeunit "System Management";
    begin
        SysMgmt.Top5Sales(Rec);
    end;
}
