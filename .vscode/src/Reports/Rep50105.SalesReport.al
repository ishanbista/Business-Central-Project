report 50105 "Sales Report"
{
    ApplicationArea = All;
    Caption = 'Sales Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\SalesReport.rdl';
    dataset
    {
        dataitem(SalesInvoiceLine; "Sales Invoice Line")
        {
            column(ItemNo; "No.")
            {

            }
            column(Type; Type)
            {

            }
            column(OldPostingGroup; OldPostingGroup)
            {
            }
            trigger OnAfterGetRecord()

            begin
                Clear(OldPostingGroup);
                if SalesInvoiceLine.Type = SalesInvoiceLine.Type::Item then
                    if ItemRec.Get("No.") then begin
                        if ItemRec."Old Posting Group" = ItemRec."Old Posting Group"::" " then 
                        OldPostingGroup:= '' else 
                          OldPostingGroup := Format(ItemRec."Old Posting Group");
                    end;

            end;

        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }

    var
        ItemRec: Record Item;
        OldPostingGroup: Text[50];

}
