pageextension 50103 "Comp Info Ext" extends "Company Information"
{
    actions
    {
        addafter(Action27)
        {
            action("Update Posting Date")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = UpdateDescription;

                trigger OnAction()
                var
                    SysMgmt: Codeunit "System Management";
                    PurchHeader: Record "Purchase Header";
                    FilterPage: FilterPageBuilder;
                    DocumentNo: Code[20];
                    PostingDate: Date;
                begin
                    if not Confirm('Do you want to update Posting Date?') then
                        exit;
                    Clear(DocumentNo);
                    Clear(PostingDate);
                    Clear(FilterPage);

                    FilterPage.AddRecord('Purchase Header', PurchHeader);
                    FilterPage.AddField('Purchase Header', PurchHeader."No.");
                    FilterPage.AddField('Purchase Header', PurchHeader."Posting Date");
                    FilterPage.RunModal();
                    PurchHeader.SetView(FilterPage.GetView('Purchase Header'));

                    if PurchHeader.GetFilter("No.") = '' then
                        Error('Document No must be entered');
                    if PurchHeader.GetFilter("Posting Date") = '' then
                        Error('Posting Date must be entered');

                    Evaluate(DocumentNo, PurchHeader.GetFilter("No."));
                    Evaluate(PostingDate, PurchHeader.GetFilter("Posting Date"));

                    SysMgmt.UpdatePostingDate(DocumentNo, PostingDate);

                end;
            }
            action("Update VendorNo")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = UpdateDescription;

                trigger OnAction()
                var
                    SysMgmt: Codeunit "System Management";
                    PurchHeader: Record "Purchase Header";
                    FilterPage: FilterPageBuilder;
                    DocumentNo: Code[20];
                    VendorNo: Code[20];
                begin
                    if not Confirm('Do you want to update Posting Date?') then
                        exit;
                    Clear(DocumentNo);
                    Clear(VendorNo);
                    Clear(FilterPage);

                    FilterPage.AddRecord('Purchase Header', PurchHeader);
                    FilterPage.AddField('Purchase Header', PurchHeader."No.");
                    FilterPage.AddField('Purchase Header', PurchHeader."Vendor Invoice No.");
                    FilterPage.RunModal();
                    PurchHeader.SetView(FilterPage.GetView('Purchase Header'));

                    if PurchHeader.GetFilter("No.") = '' then
                        Error('Document No must be entered');
                    if PurchHeader.GetFilter("Vendor Invoice No.") = '' then
                        Error('Posting Date must be entered');

                    Evaluate(DocumentNo, PurchHeader.GetFilter("No."));
                    Evaluate(VendorNo, PurchHeader.GetFilter("Vendor Invoice No."));

                    SysMgmt.UpdateVendorNo(DocumentNo, VendorNo);

                end;
            }
            action("Update Vendors")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = UpdateDescription;

                trigger OnAction()
                var
                    SysMgmt: Codeunit "System Management";
                    Vendor: Record Vendor;
                    FilterPage: FilterPageBuilder;
                    VendorNo: Code[20];
                    VendPostGroup: Code[20];
                    LocCode: Code[20];
                begin
                    Report.Run(50101);
                    // if not Confirm('Do you want to update Vendors?') then
                    //     exit;
                    // Clear(VendorNo);
                    // Clear(VendPostGroup);
                    // Clear(LocCode);
                    // Clear(FilterPage);

                    // FilterPage.AddRecord('Vendor', Vendor);
                    // FilterPage.AddField('Vendor', Vendor."No.");
                    // FilterPage.AddField('Vendor', Vendor."Vendor Posting Group");
                    // FilterPage.AddField('Vendor', Vendor."Location Code");
                    // FilterPage.RunModal();

                    // Vendor.SetView(FilterPage.GetView('Vendor'));

                    // Evaluate(VendorNo, Vendor.GetFilter("No."));
                    // Evaluate(VendPostGroup, Vendor.GetFilter("Vendor Posting Group"));
                    // Evaluate(LocCode, Vendor.GetFilter("Location Code"));

                    // SysMgmt.UpdateVendors(VendorNo, VendPostGroup, LocCode);

                end;
            }
        }
    }
}
