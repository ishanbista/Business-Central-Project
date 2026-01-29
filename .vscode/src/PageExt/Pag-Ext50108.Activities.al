pageextension 50108 Activities extends "O365 Activities"
{
    layout
    {
        addafter("Ongoing Sales")
        {
            cuegroup("Order - Dispatch")
            {

                field("Order - Dispatch Timing"; GetOrdertoDispatchValue())
                {
                    ApplicationArea = basic, suit;
                    caption = 'Order-to-Dispatch Ratio';
                    AutoFormatType = 2;
                    DecimalPlaces = 1 : 1;
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        DispatchDetailRec: Record "Dispatch Detail";
                    begin
                        Page.Run(Page::"Dispatch List", DispatchDetailRec);
                    end;

                }
            }
        }
    }

    procedure GetOrdertoDispatchValue(): Decimal
    var
        TotalDays: Decimal;
        TotalInvoices: Integer;
        DayDiff: Integer;
        DispatchDetail: Record "Dispatch Detail";
    begin
        TotalDays := 0;
        TotalInvoices := 0;
        DispatchDetail.Reset();
        if DispatchDetail.FindSet() then
            repeat
                if DispatchDetail."Order-to-Dispatch Timing" <> 0 then begin
                    TotalDays += DispatchDetail."Order-to-Dispatch Timing";
                    TotalInvoices += 1;
                end;
            until DispatchDetail.Next() = 0;

        if TotalInvoices > 0 then
            exit(TotalDays / TotalInvoices)
        else
            exit(0);
    end;
}
