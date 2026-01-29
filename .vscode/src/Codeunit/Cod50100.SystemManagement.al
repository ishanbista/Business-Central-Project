codeunit 50100 "System Management"
{
    Permissions = tabledata "G/L Entry" = RIMD,
    tabledata "Detailed Vendor Ledg. Entry" = RIMD,
    tabledata "VAT Entry" = RIMD,
    tabledata "Purch. Inv. Header" = RIMD,
    tabledata "Purch. Inv. Line" = RIMD,
    tabledata "Sales Invoice Header" = RIMD;

    procedure CheckCredit(SalesHeader: Record "Sales Header")
    var
        SalesLine: Record "Sales Line";
        TotalAmount: Decimal;
        Customer: Record Customer;
    begin
        SalesLine.SetRange("Document No.", SalesHeader."No.");

        if SalesLine.FindSet() then begin
            repeat
                TotalAmount += SalesLine."Unit Price";
            until SalesLine.Next() = 0;
        end;
        Customer.Get(SalesHeader."Sell-to Customer No.");

        if TotalAmount < Customer."Credit Amount (LCY)" then
            Error('Credit limit exceeded.\Total: %1 Limit: %2',
                  TotalAmount,
                  Customer."Credit Amount (LCY)");
        Message(
    'Credit OK.\Total: %1 Limit: %2',
    TotalAmount,
    Customer."Credit Limit (LCY)");
    end;

    procedure UpdatePostingDate(var DocumentNo: Code[20]; PostingDate: Date)
    var
        VendorLegdEntry: Record "Vendor Ledger Entry";
        GLEntry: Record "G/L Entry";
        DetailedVendorLedgEntry: Record "Detailed Vendor Ledg. Entry";
        VATEntry: Record "VAT Entry";
        PurchInvHeader: Record "Purch. Inv. Header";
        PurchInvLine: Record "Purch. Inv. Line";
        PurchHeader: Record "Purchase Header";
        PurchLine: Record "Purchase Line";
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

        PurchHeader.Reset();
        PurchHeader.SetRange("No.", DocumentNo);
        if PurchHeader.FindFirst() then
            PurchHeader."Posting Date" := PostingDate;
        PurchHeader.Modify(true);

        PurchLine.Reset();
        PurchLine.SetRange("Document No.", DocumentNo);
        if PurchLine.FindSet() then
            repeat
                PurchLine."FA Posting Date" := PostingDate;
                PurchLine.Modify(true);
            until PurchLine.Next() = 0;

        Message('Posting Date updated!');
    end;

    procedure UpdateVendorNo(var DocumentNo: Code[20]; VendorNo: Code[20])
    var
        VendorLegdEntry: Record "Vendor Ledger Entry";
    begin
        VendorLegdEntry.Reset();
        VendorLegdEntry.SetRange("Document No.", DocumentNo);
        if VendorLegdEntry.FindSet() then
            repeat
                VendorLegdEntry."Vendor No." := VendorNo;
                VendorLegdEntry.Modify(true);
            until VendorLegdEntry.Next() = 0;
        Message('Vendor No. updated!');
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

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnAfterInsertInvoiceHeader, '', false, false)]
    local procedure "Sales-Post_OnAfterInsertInvoiceHeader"(var SalesHeader: Record "Sales Header"; var SalesInvHeader: Record "Sales Invoice Header")
    begin
        SalesInvHeader."Employee No." := SalesHeader."Employee No.";
        SalesInvHeader."Employee Name" := SalesHeader."Employee Name";
        SalesInvHeader.Modify(true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", OnBeforePostSalesDoc, '', false, false)]
    local procedure "Sales-Post_OnBeforePostSalesDoc"(var Sender: Codeunit "Sales-Post"; var SalesHeader: Record "Sales Header"; CommitIsSuppressed: Boolean; PreviewMode: Boolean; var HideProgressWindow: Boolean; var IsHandled: Boolean; var CalledBy: Integer)
    var
        SalesLine: Record "Sales Line";
    begin
        if SalesLine.FindSet() then
            repeat
                if SalesLine."Unit Price" = 0 then
                    Error('Unit Price must not be 0!');
            until SalesLine.Next() = 0;

        if not SalesHeader."Sales Reviewed" then
            Error('The customer %1 and document no. %2 is not allowed to post', SalesHeader."Bill-to Name", SalesHeader."No.");
    end;

    procedure Top5Sales(var TempBuffer: Record "Item Sales Buffer" temporary)
    var
        ValueEntry: Record "Value Entry";
        FromDate: Date;
        ToDate: Date;
        Count: Integer;
    begin
        TempBuffer.DeleteAll();

        FromDate := CalcDate('-6M', Today());
        ToDate := Today();

        ValueEntry.Reset();
        ValueEntry.SetCurrentKey("Item No.", "Posting Date", "Item Ledger Entry Type");
        ValueEntry.SetRange("Posting Date", FromDate, ToDate);
        ValueEntry.SetRange("Item Ledger Entry Type", ValueEntry."Item Ledger Entry Type"::Sale);

        if ValueEntry.FindSet() then
            repeat
                TempBuffer.Reset();
                TempBuffer.SetRange("Item No.", ValueEntry."Item No.");

                if TempBuffer.FindFirst() then begin
                    TempBuffer."Quantity Sold" += Abs(ValueEntry."Invoiced Quantity");
                    TempBuffer.Modify(true);
                end else begin
                    TempBuffer.Init();
                    TempBuffer."Item No." := ValueEntry."Item No.";
                    TempBuffer."Quantity Sold" := Abs(ValueEntry."Invoiced Quantity");
                    TempBuffer.Insert(true);
                end;
            until ValueEntry.Next() = 0;

        TempBuffer.SetCurrentKey("Quantity Sold");
        TempBuffer.Ascending(false);

    end;
}
