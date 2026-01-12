table 50111 "Vehicle Service Ledger"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = SystemMetadata;
            AutoIncrement = true;
        }
        field(2; "Vehicle No."; Code[20])
        {
            DataClassification = CustomerContent;
        }
        field(3; "Service Date"; Date)
        {
            DataClassification = CustomerContent;
        }
        field(4; "Service Type"; Option)
        {
            OptionMembers = OilChange,Repair,Inspection,Accident;
        }
        field(5; "Service Cost"; Decimal)
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        
        key(VehicleServiceKey; "Vehicle No.", "Service Date")
        {
            SumIndexFields = "Service Cost";
        }
    }
}
