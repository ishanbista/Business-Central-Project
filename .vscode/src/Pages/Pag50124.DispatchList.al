page 50124 "Dispatch List"
{

    ApplicationArea = All;
    Caption = 'Dispatch List';
    PageType = List;
    SourceTable = "Dispatch Detail";
    UsageCategory = Lists;
    //CardPageId = "Dispatch Card";
    // DeleteAllowed = false;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Customer No. field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("Business Unit"; Rec."Business Unit")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Business Unit field.';
                }
                field("Invoice Date"; Rec."Invoice Date")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Invoice Date field.';
                }
                field("Invoice Time"; Rec."Invoice Time")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Invoice Time field.';
                }
                field("Total Qty"; Rec."Total Qty")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Total Qty field.';
                }
                field("Sales Complete Status"; Rec."Sales Complete Status")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Sales Complete Status field.';
                }
                field("Order No."; Rec."Order No.")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Order No. field.';
                }
                field("Sales Order Date"; Rec."Sales Order Date")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Sales Order Date field.';
                }
                field("Order Time"; Rec."Order Time")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Order Time field.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Salesperson Code field.';
                }
                field("Salesperson Name"; Rec."Salesperson Name")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Salesperson Name field.';
                }

                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Approval Date field.';
                }
                field("Approval Time"; Rec."Approval Time")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Approval Time field.';
                }
                field("Approver Name"; Rec."Approver Name")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Approver Name field.';
                }
                field("Packer Name"; Rec."Packer Name")
                {
                    ApplicationArea = All;
                    // Editable = true;
                    ToolTip = 'Specifies the value of the Packer Name field.';
                }
                field("Picking Date"; Rec."Picking Date")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    // Visible = false;
                    ToolTip = 'Specifies the value of the Picking Date field.';
                }

                field("Picker Name"; Rec."Picker Name")
                {
                    ApplicationArea = All;
                    // Editable = true;
                    ToolTip = 'Specifies the value of the Picker Name field.';
                    //Visible = false;
                }
                field(Dispatched; Rec.Dispatched)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Dispatched field.';
                }
                field("Vehicle No."; Rec."Vehicle No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle No. field.';
                }
                field("Transporter Name"; Rec."Transporter Name")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Delivery Person field.';
                }
                field("Transporter Name1"; Rec."Transporter Name1")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Transporter Name field.';
                }
                field("Congsignment Note"; Rec."Congsignment Note")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Congsignment Note field.';
                }
                // field("Customer Receipt Date"; "Customer Receipt Date")
                // {
                //     ApplicationArea = all;
                // }
                field("Dispatch Date"; Rec."Dispatch Date")
                {
                    ApplicationArea = all;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Dispatch Date field.';
                }
                field("Dispatch Time"; Rec."Dispatch Time")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Dispatch Time field.';
                }
                // field("PRT No."; "PRT No.")
                // {
                //     ApplicationArea = all;
                // }
                // field("Current Date"; "Current Date")
                // {
                //     ApplicationArea = all;
                // }
                // field("PRT Amount"; "PRT Amount")
                // {
                //     ApplicationArea = all;
                // }
                // field(Remarks; Remarks)
                // {
                //     ApplicationArea = all;
                // }
                field("Released Date"; Rec."Released Date")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Released Date field.';
                }
                field("Released Time"; Rec."Released Time")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Released Time field.';
                }
                field("Approval Request date"; Rec."Approval Request date")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Approval Request date field.';
                }
                field("Approval Request Time"; Rec."Approval Request Time")
                {
                    ApplicationArea = All;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Approval Request Time field.';
                }
                field("Order-to-Dispatch Timing"; Rec."Order-to-Dispatch Timing")
                {
                    ApplicationArea = all;
                    // Editable = false;
                    ToolTip = 'Specifies the value of the Order-to-Dispatch Timing field.';
                }
                field("Total Boxes"; Rec."Total Boxes")
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the Total Boxes field.';
                }
                field("Driver's Phone No."; Rec."Driver's Phone No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Driver''s Phone No. field.', Comment = '%';
                }
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Type field.', Comment = '%';
                }
                field("Vehicle Cost"; Rec."Vehicle Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vehicle Cost field.', Comment = '%';
                }
                field("Labor Cost"; Rec."Labor Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Labor Cost field.', Comment = '%';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Total Cost field.', Comment = '%';
                }
                field("Gate-Pass No."; Rec."Gate-Pass No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Gate-Pass No. field.';
                }

            }
        }
    }
    // trigger OnDeleteRecord(): Boolean
    // var
    //     myInt: Integer;
    // begin
    //     Error('You cannot delete dispatched record');
    // end;

    // trigger OnAfterGetRecord()
    // var
    //     myInt: Integer;
    // begin
    //     if ("Invoice Date" <> 0D) and ("Dispatch Date" <> 0D) then begin
    //         "Order-to-Dispatch Timing" := "Dispatch Date" - "Invoice Date";
    //         Modify(true);
    //         Commit();
    //     end;
    // end;

    var
        Dispatchdetail: Record "Dispatch Detail";
}
