report 50103 "TDS Report"
{
    // version TDS1.00
    DefaultLayout = RDLC;
    RDLCLayout = 'Reports\TDSReportERECP1.rdl';
    Caption = 'TDS Report';
    PreviewMode = PrintLayout;
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = all;

    dataset
    {
        dataitem("TDS Entry"; "TDS Entry")
        {
            RequestFilterFields = "Source Type", "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", "Posting Date";
            column(TDS_Posting_Group; "TDS Entry"."TDS Posting Group")
            {
            }
            column(TDS_Base; "TDS Entry".Base)
            {
            }
            column(TDS_Amount; "TDS Entry"."TDS Amount")
            {
            }
            column(TDS_Vendor_No; "TDS Entry"."Bill-to/Pay-to No.")
            {
            }
            column(PostingDate_TDSEntry; "TDS Entry"."Posting Date")
            {
            }
            column(GLAccount_TDSEntry; "TDS Entry"."GL Account")
            {
            }
            column(GLAccountName_TDSEntry; "TDS Entry"."GL Account Name")
            {
            }
            column(ExpenseGLAccount_TDSEntry; "TDS Entry"."Expense G/L Account code")
            {
            }
            column(ExpenseGLAccountName_TDSEntry; "TDS Entry"."Expense G/L Account Name")
            {
            }
            column(TDS_TDSEntry; "TDS Entry"."TDS %")
            {
            }
            column(TDSPostingGroupName; TDSPostingGroupName)
            {
            }
            column(Report_Title; Report_Title)
            {
            }
            column(AllFilters; AllFilters)
            {
            }
            column(Narration; Narration)
            {
            }
            column(TDSType; TDSType)
            {
            }
            column(CompanyName; CompanyRec.Name)
            {
            }
            column(CompanyAddress; CompanyRec.Address)
            {
            }
            column(CompanyPhone; CompanyRec."Phone No.")
            {
            }
            column(Logo; CompanyRec.Picture)
            {
            }
            column(DateType; DateType)
            {
            }
            column(DoNotShowHeader; DoNotShowHeader)
            {
            }
            column(SourceName; SourceName)
            {
            }
            column(SourcePAN; SourcePAN)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Clear(TDSPostingGroupName);
                Clear(TDSType);

                Clear(TDSPostingGroupName);
                TDSPostingGroup.Reset;
                TDSPostingGroup.SetRange(TDSPostingGroup.Code, "TDS Entry"."TDS Posting Group");
                if TDSPostingGroup.FindFirst then begin
                    TDSPostingGroupName := TDSPostingGroup.Description;
                    TDSType := TDSPostingGroup."IRD Code";
                end;

                case "Source Type" of
                    "Source Type"::Vendor:
                        begin
                            if Vendor.Get("Bill-to/Pay-to No.") then begin
                                SourceName := Vendor.Name;
                                SourcePAN := Vendor."VAT Registration No.";
                            end else begin
                                SourceName := '';
                                SourcePAN := '';
                            end;
                        end;

                    "Source Type"::Customer:
                        begin
                            if Customer.Get("Bill-to/Pay-to No.") then begin
                                SourceName := Customer.Name;
                                SourcePAN := Customer."VAT Registration No.";
                            end else begin
                                SourceName := '';
                                SourcePAN := '';
                            end;
                        end;
                    "Source Type"::Employee:
                        begin
                            if Employee.Get("Bill-to/Pay-to No.") then begin
                                SourceName := Employee.FullName();
                            end else begin
                                SourceName := '';
                                SourcePAN := '';
                            end;
                        end;
                end;
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(content)
            {
                field(DoNotShowHeader; DoNotShowHeader)
                {
                    Caption = 'Do Not Show Header';
                    ApplicationArea = All;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        CompanyRec.Get;
        CompanyRec.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        AllFilters := "TDS Entry".GetFilters;
        DateType := 'AD';
    end;

    var
        TDSPostingGroup: Record "TDS Posting Group";
        TDSPostingGroupName: Text[100];
        CompanyRec: Record "Company Information";
        Report_Title: Label 'TDS Ledger';
        AllFilters: Text[100];
        GlEntry: Record "G/L Entry";
        ShowNarration: Boolean;
        NArr: Label 'Narr: ';
        TDSType: Text;
        DoNotShowHeader: Boolean;
        DateType: Text;
        SourcePAN: Code[30];
        SourceName: Text;
        Vendor: Record Vendor;
        Customer: Record Customer;
        Employee: Record Employee;
}
