tableextension 50105 "Customer Ext" extends Customer
{
    fields
    {
        modify("Customer Posting Group")
        {
            trigger OnAfterValidate()
            var
                CustPostingGroup: Record "Customer Posting Group";
            begin
                if not CustPostingGroup.Get("Customer Posting Group") then
                    Error('Customer Posting Group %1 does not exist', "Customer Posting Group");
            end;
        }
        modify("Country/Region Code")
        {
            trigger OnAfterValidate()
            var
                CountryCode: Record "Country/Region";
            begin
                if not CountryCode.Get("Country/Region Code") then
                    Error('Country Region Code %1 does not exist', "Country/Region Code");
            end;
        }
    }
    trigger OnInsert()

    begin
        TestField("Customer Posting Group");
        TestField("Country/Region Code");
    end;
}
