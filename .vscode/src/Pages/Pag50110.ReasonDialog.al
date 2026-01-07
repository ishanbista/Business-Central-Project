page 50110 "Reject Reason Dailog"
{
    Caption = 'Reject Reason Dailog';
    PageType = Card;
    Editable = true;
    SourceTable = "New Leave Request";
    SourceTableTemporary = true;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(Ok)
            {
                Caption = 'Ok';
                Image = Approval;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    CurrPage.Close();
                end;
            }
        }
    }
}
