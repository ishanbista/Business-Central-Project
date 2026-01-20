// pageextension 50108 "Sales Order Line Ext" extends "Sales Order Subform"
// {
//     layout
//     {
//         modify(Description)
//         {
//             Editable = DescEditable;
//         }
//         modify(Quantity)
//         {
//             Editable = DescEditable;
//         }
//         modify("Model Version No.")
//         {
//             Editable = ModelVerEditable;
//         }
//         modify("Chasis No.")
//         {
//             Editable = ModelVerEditable;
//         }
//     }
//     trigger OnAfterGetCurrRecord()

//     begin
//         SetFieldsEditable();
//     end;

//     trigger OnAfterGetRecord()

//     begin
//         SetFieldsEditable();
//     end;

//     local procedure SetFieldsEditable()
//     begin
//         if SalesHeader.Get(Rec."Document No.") then begin
//             if SalesHeader."Location from Code" <> '' then begin
//                 if LocationRec.Get(SalesHeader."Location from Code") then begin
//                     if LocationRec."Make Field Editable" then begin
//                         DescEditable := true;
//                         ModelVerEditable := true;
//                     end else begin
//                         DescEditable := false;
//                         ModelVerEditable := false;
//                     end;

//                 end;

//             end;
//         end;
//     end;

//     var
//         LocationRec: Record Location;
//         DescEditable: Boolean;
//         ModelVerEditable: Boolean;

//         SalesHeader: Record "Sales Header";
// }
