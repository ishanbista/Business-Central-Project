page 50106 "Rejected Leave Page"
{
    ApplicationArea = All;
    Caption = 'Rejected Leave';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "New Leave Request";
    SourceTableView = where(Status = filter(Rejected));

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    ApplicationArea = All;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = All;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = All;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    ApplicationArea = All;
                }


            }
        }
    }
}
