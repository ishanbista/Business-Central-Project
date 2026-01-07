codeunit 50100 "System Management"
{
    Permissions = tabledata "G/L Entry" = RIMD,
    tabledata "Detailed Vendor Ledg. Entry" = RIMD,
    tabledata "VAT Entry" = RIMD,
    tabledata "Purch. Inv. Header" = RIMD,
    tabledata "Purch. Inv. Line" = RIMD;
    procedure UpdatePostingDate(var DocumentNo: Code[20]; PostingDate: Date)
    var
        VendorLegdEntry: Record "Vendor Ledger Entry";
        GLEntry: Record "G/L Entry";
        DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        VATEntry: Record "VAT Entry";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";
    begin
        VendorLegdEntry.Reset();
        VendorLegdEntry.SetRange("Document No.", DocumentNo);
        if VendorLegdEntry.FindSet() then
            repeat
                VendorLegdEntry."Posting Date" := PostingDate;
                VendorLegdEntry.Modify(true);
            until VendorLegdEntry.Next() = 0;

        GLEntry.Reset();
        GLEntry.SetRange("Document No.", DocumentNo);
        if GLEntry.FindSet() then
            repeat
                GLEntry."Posting Date" := PostingDate;
                GLEntry.Modify(true);
            until GLEntry.Next() = 0;

        DetailedVendorLedgEntry.Reset();
        DetailedVendorLedgEntry.SetRange("Document No.", DocumentNo);
        if DetailedVendorLedgEntry.FindSet() then
            repeat
                DetailedVendorLedgEntry."Posting Date" := PostingDate;
                DetailedVendorLedgEntry.Modify(true);
            until DetailedVendorLedgEntry.Next() = 0;

        VATEntry.Reset();
        VATEntry.SetRange("Document No.", DocumentNo);
        if VATEntry.FindSet() then
            repeat
                VATEntry."Posting Date" := PostingDate;
                VATEntry.Modify(true);
            until VATEntry.Next() = 0;

        PurchInvHeader.Reset();
        PurchInvHeader.SetRange("No.", DocumentNo);
        if PurchInvHeader.FindFirst() then
            PurchInvHeader."Posting Date" := PostingDate;
        PurchInvHeader.Modify(true);

        PurchInvLine.Reset();
        PurchInvLine.SetRange("Document No.", DocumentNo);
        if PurchInvLine.FindSet() then
            repeat
                PurchInvLine."Posting Date" := PostingDate;
                PurchInvLine.Modify(true);
            until PurchInvLine.Next() = 0;

        Message('Posting Date updated!');
    end;

    procedure UpdateVendors(var VendorNo: Code[20]; VendPostGroup: Code[20]; LocCode: Code[20])
    var
        Vendor: Record Vendor;
    begin
        Vendor.Reset();
        Vendor.SetRange("No.", VendorNo);
        Vendor.SetRange("Vendor Posting Group", VendPostGroup);
        Vendor.SetRange("Location Code", LocCode);
        if Vendor.FindSet() then
            repeat
                Vendor.Blocked := Vendor.Blocked::All;
                Vendor.Modify(true);
            until Vendor.Next() = 0;
        Message('Vendors Updated!');
    end;
}
