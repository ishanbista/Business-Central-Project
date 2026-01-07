page 50117 "QJ Service Item List"
{
    ApplicationArea = All;
    Caption = 'QJ Service Item List';
    PageType = List;
    SourceTable = "Service Item";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ToolTip = 'Specifies the serial number of this item.';
                }
                field("Service Item Group Code"; Rec."Service Item Group Code")
                {
                    ToolTip = 'Specifies the code of the service item group associated with this item.';
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies a description of this item.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ToolTip = 'Specifies the value of the Description 2 field.', Comment = '%';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the status of the service item.';
                }
                field(Priority; Rec.Priority)
                {
                    ToolTip = 'Specifies the service priority for this item.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ToolTip = 'Specifies the number of the customer who owns this item.';
                }
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ToolTip = 'Specifies a code for an alternate shipment address if you want to ship to another address than the one that has been entered automatically. This field is also used in case of drop shipment.';
                }
                field("Item No."; Rec."Item No.")
                {
                    ToolTip = 'Specifies the item number linked to the service item.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Location of Service Item"; Rec."Location of Service Item")
                {
                    ToolTip = 'Specifies the code of the location of this item.';
                }
            }
        }
    }
}
