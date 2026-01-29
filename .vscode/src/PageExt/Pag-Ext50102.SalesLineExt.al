pageextension 50102 "Sales Line Ext" extends "Sales Order Subform"
{

    layout
    {

        addafter("No.")
        {
            field("Model Version No."; Rec."Model Version No.")
            {
                ApplicationArea = All;
            }
            field("Chasis No."; Rec."Chasis No.")
            {
                ApplicationArea = All;

                trigger OnLookup(var Text: Text): Boolean
                var
                    ModelRec: Record "Model Version";
                    ServItem: Record "Service Item";
                    PageID: Integer;
                begin
                    PageID := 50116;
                    if Rec."Model Version No." <> '' then begin
                        if ModelRec.Get(Rec."Model Version No.") then begin
                            if ModelRec."Service Item Group" = 'QJ' then begin
                                PageID := 50117;
                            end;
                        end;
                    end;

                    ServItem.Reset();
                    if Page.RunModal(PageID, ServItem) = Action::LookupOK then
                        Rec.Validate("Chasis No.", ServItem."No.");
                    exit(true);
                end;

            }
        }

    }
    actions
    {
        modify(GetPrices)
        {
            trigger OnAfterAction()
            begin
                GetUnitCost();
            end;
        }
    }
    local procedure GetUnitCost()
    var
        Item: Record Item;
    begin
        Item.Get(Rec."No.");
        Rec.Validate("Unit Price", Item."Unit Cost");
    end;
}
