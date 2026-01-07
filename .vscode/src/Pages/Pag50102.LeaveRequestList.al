page 50102 "Leave Request ListPage"
{
    ApplicationArea = All;
    Caption = 'New Leave Request';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "New Leave Request";
    CardPageId = "Leave Req Card Page";
    SourceTableView = where(Status = const(""));

    layout
    {

        area(Content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = All;
                }
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
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                }


            }
        }

    }
}
