reportextension 50100 "Customer List Ext" extends "Customer - List"
{
    dataset
    {
        add(Customer)
        {
            column(Blocked; Blocked)
            {
            }


        }
    }
    requestpage
    {
        layout
        {
            addlast(Content)
            {
                group(NewFilters)
                {
                    field(CustomerBlockOnly; CustomerBlockOnly)
                    {
                        ApplicationArea = All;
                    }
                    field(DateFilter; DateFilter)
                    {
                        ApplicationArea = All;
                    }
                }
            }
        }
    }
    var
        CustomerBlockOnly: Boolean;
        DateFilter: Date;
}
