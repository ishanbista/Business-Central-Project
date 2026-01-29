table 50113 "Dispatch Detail"
{
    Caption = 'Dispatch Detail';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Invoice No."; Code[20])
        {
            Caption = 'Invoice No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
            DataClassification = ToBeClassified;

        }
        field(3; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            DataClassification = ToBeClassified;
        }
        field(4; "Salesperson Code"; Code[20])
        {
            Caption = 'Salesperson Code';
            DataClassification = ToBeClassified;

        }
        field(5; "Salesperson Name"; Text[50])
        {
            Caption = 'Salesperson Name';
            DataClassification = ToBeClassified;
        }
        field(6; "Sales Order Date"; Date)
        {
            Caption = 'Sales Order Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Approval Date"; Date)
        {
            Caption = 'Approval Date';
            DataClassification = ToBeClassified;
        }
        field(8; "Picking Date"; Date)
        {
            Caption = 'Picking Date';
            DataClassification = ToBeClassified;
        }

        field(10; "Invoice Date"; Date)
        {
            Caption = 'Invoice Date';
            DataClassification = ToBeClassified;
        }
        field(11; "Dispatch Date"; Date)
        {
            Caption = 'Dispatch Date';
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                CalcOrderToDispatchTiming();
            end;
        }
        field(12; "Customer Receipt Date"; Date)
        {
            Caption = 'Customer Receipt Date';
            DataClassification = ToBeClassified;
        }
        field(13; "Approver Name"; Text[50])
        {
            Caption = 'Approver Name';
            DataClassification = ToBeClassified;
        }
        field(14; "Picker Name"; Text[50])
        {
            Caption = 'Picker Name';
            DataClassification = ToBeClassified;

        }
        field(15; "Packer Name"; Text[50])
        {
            Caption = 'Packer Name';
            DataClassification = ToBeClassified;

        }
        field(16; "Vehicle No."; Code[20])
        {
            Caption = 'Vehicle No.';
            DataClassification = ToBeClassified;
        }
        field(17; "Transporter Name"; Text[50])
        {
            Caption = 'Delivery Person';
            DataClassification = ToBeClassified;
        }
        field(18; "Congsignment Note"; Text[50])
        {
            Caption = 'Congsignment Note';
            DataClassification = ToBeClassified;
        }
        field(19; "Sales Complete Status"; Option)
        {
            Caption = 'Sales Complete Status';
            DataClassification = ToBeClassified;
            OptionMembers = "No","Yes";
        }
        field(20; "Approver ID"; code[50])
        {
            Caption = 'Approver ID';
            DataClassification = ToBeClassified;
            TableRelation = "User Setup";

        }
        field(21; Dispatched; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Dispatched';

        }
        field(22; "Order No."; code[20])
        {
            Caption = 'Order No.';
            DataClassification = ToBeClassified;
        }
        field(23; "Complete"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "No","Yes";
        }
        field(24; "Completion date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(25; "Commitment Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Dispatch Request Value"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(27; "Approval Request date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                CalcOrderToDispatchTiming();
            end;
        }
        field(28; "PRT No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Current Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(30; "PRT Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(31; "Remarks"; text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(32; "Order-to-Dispatch Timing"; Integer)
        {
            Editable = false;
            DataClassification = ToBeClassified;
        }
        field(33; "Total Boxes"; decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(34; "GatePass Print"; Boolean)
        {
            DataClassification = ToBeClassified;

        }
        field(35; "Transporter Name1"; Text[100])
        {
            DataClassification = ToBeClassified;
            Caption = 'Transporter Name';
        }
        field(36; "Business Unit"; code[20])
        {

        }
        field(37; "Total Qty"; Decimal)
        {
        }
        field(38; "Released Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                CalcOrderToDispatchTiming();
            end;
        }
        field(39; "Released Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Approval Request Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Order Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Approval Time"; Time)
        {
            DataClassification = ToBeClassified;

        }
        field(43; "Dispatch Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(44; "Invoice Time"; Time)
        {
            DataClassification = ToBeClassified;
        }
        field(45; "Driver's Phone No."; Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(46; "Vehicle Type"; Text[20])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Vehicle Cost"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(49; "Labor Cost"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(50; "Total Cost"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(51; "Gate-Pass No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK;
        "Invoice No.")
        {
            Clustered = true;
        }
    }

    local procedure CalcOrderToDispatchTiming()
    begin
        "Order-to-Dispatch Timing" := 0;

        if "Dispatch Date" = 0D then
            exit;

        if "Approval Request date" <> 0D then
            "Order-to-Dispatch Timing" := "Dispatch Date" - "Approval Request date"
        else
            if "Released Date" <> 0D then
                "Order-to-Dispatch Timing" := "Dispatch Date" - "Released Date";
    end;

    trigger OnModify()
    begin
        // if "Sales Complete Status" = "Sales Complete Status"::Yes then
        //     Error('Onces slaes completed Dispatch can not be modified');
        if Complete = Complete::Yes then
            Error('Once complete, Dispatch can not be modified');
    end;

    var
        UserSetup: Record "User Setup";
        user: Record User;
        Customer: Record Customer;
        Salesperson: Record "Salesperson/Purchaser";

}
