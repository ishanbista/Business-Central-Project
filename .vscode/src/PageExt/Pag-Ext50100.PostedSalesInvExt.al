pageextension 50100 "PostedSalesInv Ext" extends "Posted Sales Invoices"
{
    actions
    {
        addafter("&Invoice")
        {
            action("View Document Quantity")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = ViewPostedOrder;

                trigger OnAction()
                var
                    SalesInvLine: Record "Sales Invoice Line";
                    QtyPage: Page "View Posted Document";
                begin
                    SalesInvLine.Reset();
                    SalesInvLine.SetRange("Document No.", Rec."No.");
                    QtyPage.SetTableView(SalesInvLine);
                    QtyPage.Run();
                end;
            }
            action(PrintBill)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = VendorBill;
                trigger OnAction()
                var
                    SalesInvHeader: Record "Sales Invoice Header";
                begin
                    SalesInvHeader := Rec;
                    SalesInvHeader.SetRange("No.", Rec."No.");
                    Report.Run(Report::"Posted Sales Invoice", true, false, SalesInvHeader);
                end;
            }
        }
    }
}
