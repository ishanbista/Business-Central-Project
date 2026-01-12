page 50121 "Vehicle Service Analysis"
{
    ApplicationArea = All;
    Caption = 'Vehicle Service Analysis';
    PageType = Card;
    UsageCategory = Tasks;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field(VehicleNo; VehicleNo)
                {
                    ApplicationArea = All;
                }
                field(TotalServiceCost; TotalServiceCost)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(CalculateCost)
            {
                ApplicationArea = All;
                Caption = 'CalculateCost';

                trigger OnAction()
                var
                    ServLedger: Record "Vehicle Service Ledger";
                begin
                    TotalServiceCost := 0;
                    ServLedger.Reset();

                    ServLedger.SetCurrentKey("Vehicle No.", "Service Date");
                    ServLedger.SetRange("Vehicle No.", VehicleNo);

                    if ServLedger.FindSet() then
                        repeat
                            TotalServiceCost := TotalServiceCost + ServLedger."Service Cost";
                        until ServLedger.Next() = 0;
                    Message('Total Service Cost for Vehicle No. %1 is %2 ', VehicleNo, TotalServiceCost);

                end;
            }
        }
    }
    var
        VehicleNo: Code[20];
        TotalServiceCost: Decimal;
}
