report 50101 "Vendor Report"
{
    Caption = 'Vendor Report';
    ProcessingOnly = true;
    dataset
    {

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(VendorNo; VendorNo)
                    {
                        ApplicationArea = All;
                    }
                    field(VendPostGroup; VendPostGroup)
                    {
                        ApplicationArea = All;
                    }
                    field(LocCode; LocCode)
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

    trigger OnPostReport()
    var
        SysMgmt: Codeunit "System Management";
    begin
        SysMgmt.UpdateVendors(VendorNo, VendPostGroup, LocCode);
    end;

    var
        VendorNo: Code[20];
        VendPostGroup: Code[20];
        LocCode: Code[20];

}
