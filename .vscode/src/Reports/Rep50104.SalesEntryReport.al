report 50104 "Sales Entry Report"
{
    ApplicationArea = All;
    Caption = 'Sales Entry Report';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\SalesEntryReport.rdl';
    dataset
    {
        dataitem(SalesPractiseEntry; "Sales Practise Entry")
        {
            column(CustomerNo; "Customer No.")
            {
            }
            column(CustomerName; "Customer Name")
            {
            }
            column(DocumentNo; "Document No.")
            {
            }
            column(PostingDate; Format("Posting Date"))
            {
            }
            column(Amount; Amount)
            {
            }
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
}
