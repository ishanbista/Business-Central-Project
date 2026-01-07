report 50100 "Posted Sales Invoice"
{
    Permissions = tabledata "Sales Invoice Header" = RIMD,
                tabledata "Job Card Setup" = RIMD;
    ApplicationArea = All;
    Caption = 'Posted Sales Invoice';
    UsageCategory = ReportsAndAnalysis;
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\PostedSalesInvoice.rdl';

    dataset
    {
        dataitem(SalesInvoiceHeader; "Sales Invoice Header")
        {
            DataItemTableView = sorting("No.");
            RequestFilterFields = "No.";
            column(CompanyName; CompanyInfo.Name)
            {

            }
            column(CompanyAddress1; CompanyInfo.Address)
            {

            }
            column(CompanyAddress2; CompanyInfo."Address 2")
            {

            }
            column(AddressNew; AddressNew)
            {

            }
            column(AddressInfo; AddressInfo)
            {

            }
            column(CompanyVATNo; CompanyInfo."VAT Registration No.")
            {

            }
            column(CompanyPhoneNo; CompanyInfo."Phone No.")
            {

            }
            column(Posting_Date; "Posting Date")
            {

            }
            column(No_; "No.")
            {

            }
            column(Name; "Bill-to Name")
            {

            }
            column(ContactNo; "Bill-to Contact No.")
            {

            }
            column(Address; "Bill-to Address")
            {

            }
            column(City; "Bill-to City")
            {

            }
            column(DisplaySerialNo; DisplaySerialNo)
            {

            }

            dataitem("Sales Invoice Line"; "Sales Invoice Line")
            {
                DataItemLink = "Document No." = field("No.");
                column(Quantity; Quantity)
                {

                }
                column(Description; Description)
                {

                }
                column(Unit_Price; "Unit Price")
                {

                }
                column(Amount; Amount)
                {

                }
                column(Line_Discount_Amount; "Line Discount Amount")
                {

                }
                column(Inv__Discount_Amount; "Inv. Discount Amount")
                {

                }
            }

            trigger OnAfterGetRecord()

            begin

                AddressNew := CompanyInfo.Address + ' ' + CompanyInfo."Address 2";
                AddressInfo := "Bill-to Contact No." + ',' + "Bill-to Address" + ',' + "Bill-to City";
                if CurrReport.Preview then begin
                    DisplaySerialNo := 0;
                    exit;
                end;

                if "Serial No." = 0 then begin
                    JobCardSetup.LockTable();
                    JobCardSetup.Get('JOB');

                    JobCardSetup."Last Serial No." += 1;
                    JobCardSetup.Modify(true);

                    "Serial No." := JobCardSetup."Last Serial No.";
                    Modify(true);
                end;
                DisplaySerialNo := "Serial No.";
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
    trigger OnPostReport()
    begin
        if not CurrReport.Preview then
            exit;
        // if not SalesInvHdr.Get(InvNo) then
        //     exit;

        // if SalesInvHdr."Serial No." = 0 then begin
        //     JobCardSetup.LockTable();
        //     JobCardSetup.Get('JOB');
        //     JobCardSetup."Last Serial No." += 1;
        //     JobCardSetup.Modify(true);

        //     SalesInvHdr."Serial No." := JobCardSetup."Last Serial No.";
        //     SalesInvHdr.Modify(true);

        // end;


    end;

    trigger OnInitReport()

    begin
        CompanyInfo.Get();
    end;

    var

        CompanyInfo: Record "Company Information";
        AddressNew: Text[200];
        AddressInfo: Text[200];
        SalesInvHdr: Record "Sales Invoice Header";
        JobCardSetup: Record "Job Card Setup";
        InvNo: Code[20];
        HeaderCaptured: Boolean;
        SerialAssigned: Boolean;
        DisplaySerialNo: Integer;
}
