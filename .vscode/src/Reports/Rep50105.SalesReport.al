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
            column(CompanyName; CompanyInfo.Name)
            {
            }
            column(CompanyPicture; CompanyInfo.Picture)
            {
            }

            trigger OnPreDataItem()
            var
                myInt: Integer;
            begin
            end;

            trigger OnAfterGetRecord()
            begin
                Clear(OldPostingGroup);
                if SalesInvoiceLine.Type = SalesInvoiceLine.Type::Item then
                    if ItemRec.Get("No.") then begin
                        if ItemRec."Old Posting Group" = ItemRec."Old Posting Group"::" " then
                            OldPostingGroup := '' else
                            OldPostingGroup := Format(ItemRec."Old Posting Group");
                    end;
            end;

            trigger OnPostDataItem()
            var
                myInt: Integer;
            begin
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
                    field(StartDate; StartDate)
                    {
                        ApplicationArea = All;
                    }
                    field(EndDate; EndDate)
                    {
                        ApplicationArea = All;
                    }
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

    trigger OnPreReport()

    begin
        if (StartDate = 0D) and (EndDate = 0D) then
            Error('Please enter start and end date');
    end;

    trigger OnPostReport()

    begin
        Message('Success report is executed');
    end;

    trigger OnInitReport()
    begin
        CompanyInfo.Get();
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        ItemRec: Record Item;
        OldPostingGroup: Text[50];
        StartDate: Date;
        EndDate: Date;
}
