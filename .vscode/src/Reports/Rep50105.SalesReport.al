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
            column(No_; "No.")
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
                if ItemRec.Get("No.") then
                    OldPostingGroup := Format(ItemRec."Old Posting Group");
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
