pageextension 50109 "Item List Ext" extends "Item List"
{
    actions
    {
        addafter("&Bin Contents")
        {
            action("Calculate UnitCost")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Calculate;

                trigger OnAction()
                var
                    ItemRec: Record Item;
                begin
                    TotalUnitPrice := 0.00;
                    ItemRec.Reset();
                    ItemRec.SetRange("Assembly BOM", true);
                    // ItemRec.SetRange(Type, ItemRec.Type::Service);
                    if ItemRec.FindFirst() then begin
                        TotalUnitPrice += ItemRec."Unit Price";
                        Message('The total unit price is %1', TotalUnitPrice);
                    end;
                    // if ItemRec.FindSet() then begin
                    //     repeat
                    //         TotalUnitPrice += ItemRec."Unit Price";
                    //     until ItemRec.Next() = 0;

                    // end;
                    // Message('The total unit price is %1', TotalUnitPrice);
                end;
            }
        }
    }
    var
        TotalUnitPrice: Decimal;
}
