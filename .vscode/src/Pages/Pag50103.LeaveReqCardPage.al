page 50103 "Leave Req Card Page"
{
    Caption = 'Leave Req Card Page';
    PageType = Card;
    SourceTable = "New Leave Request";

    layout
    {
        area(Content)
        {
            group(General)
            {

                Caption = 'General';
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

    actions
    {

        area(Processing)
        {

            action("Send Approval Request")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = SendApprovalRequest;

                trigger OnAction()
                begin
                    if not Confirm('Do you want to send approval request?') then
                        exit;
                    Rec.Status := Rec.Status::Pending;
                    Rec.Modify();


                end;
            }
        }
    }
}
