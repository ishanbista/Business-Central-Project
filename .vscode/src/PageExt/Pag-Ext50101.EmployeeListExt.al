pageextension 50101 "Employee List Ext" extends "Employee List"
{
    actions
    {
        addlast(processing)
        {
            action(Transfer)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = TransferOrder;
                trigger OnAction()
                var
                    EmpRec: Record Employee;
                    EmpRec1: Record "Employee Custom";
                begin
                    EmpRec1.Init();
                    EmpRec1.TransferFields(Rec);
                    EmpRec1.Insert(true);
                    Message('Records inserted successfully!');
                end;
            }
        }
    }
}

