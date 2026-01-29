pageextension 50107 "Vendor Card Ext" extends "Vendor Card"
{
    layout
    {
        modify(Name)
        {
            ShowMandatory = true;
            trigger OnAfterValidate()
            begin
                Rec.TestField(Name);
            end;

            trigger OnBeforeValidate()

            begin
                Rec.TestField(Name);
            end;
        }
        modify(Address)
        {
            ShowMandatory = true;
            trigger OnAfterValidate()
            begin
                Rec.TestField(Address);
            end;

            trigger OnBeforeValidate()

            begin
                Rec.TestField(Address);
            end;
        }
        modify("VAT Registration No.")
        {
            ShowMandatory = true;
            trigger OnAfterValidate()
            begin
                Rec.TestField("VAT Registration No.");
            end;

            trigger OnBeforeValidate()

            begin
                Rec.TestField("VAT Registration No.");
            end;
        }
        modify("Phone No.")
        {
            ShowMandatory = true;
            trigger OnAfterValidate()
            begin
                Rec.TestField("Phone No.");
            end;

            trigger OnBeforeValidate()

            begin
                Rec.TestField("Phone No.");
            end;
        }
    }

    // trigger OnInsertRecord(BelowxRec: Boolean): Boolean

    // begin
    //     Rec.TestField(Name);
    //     Rec.TestField(Address);
    //     Rec.TestField("VAT Registration No.");
    //     Rec.TestField("Phone No.");
    // end;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     Rec.TestField(Name);
    //     Rec.TestField(Address);
    //     Rec.TestField("VAT Registration No.");
    //     Rec.TestField("Phone No.");
    // end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if Rec.Name = '' then
            Error('Name cannot be empty');

        if Rec.Address = '' then
            Error('Address cannot be empty');

        if Rec."VAT Registration No." = '' then
            Error('VAT Registration No. cannot be empty');

        if Rec."Phone No." = '' then
            Error('Phone No. cannot be empty');
    end;
}
