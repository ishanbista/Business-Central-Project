table 50112 "Item Sales Buffer"
{
    Caption = 'Item Sales Buffer';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(2; "Quantity Sold"; Decimal)
        {
            Caption = 'Quantity Sold';
        }
    }
    keys
    {
        key(PK; "Item No.")
        {
            Clustered = true;
        }
        key(SorkKey; "Quantity Sold")
        {

        }
    }
}
