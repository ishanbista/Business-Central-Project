page 50104 "Pending Leave Page"
{
    ApplicationArea = All;
    Caption = 'Pending Leave';
    PageType = List;
    UsageCategory = Lists;
    SourceTable = "New Leave Request";
    SourceTableView = where(Status = filter(Pending));

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
                field(Status; Rec.Status)
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
            action(Approve)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Approve;

                trigger OnAction()
                var
                    myInt: Integer;
                begin
                    if not Confirm('Do you want to approve leave request?') then
                        exit;
                    Rec.Status := Rec.Status::Approved;
                    Rec."Approved/Rejected By" := UserId;
                    Rec."Approved/Rejected DateTime" := CurrentDateTime;
                    Rec.Modify();
                    Message('Leave Successfully Approved!');


                end;
            }

            action(Reject)
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Image = Reject;

                trigger OnAction()
                var
                    LeaveRec: Record "New Leave Request";
                begin
                    if not Confirm('Do you want to reject leave request?') then
                        exit;
                    LeaveRec.Get(Rec."Entry No.");
                    Page.RunModal(Page::"Reject Reason Dailog", LeaveRec);
                    Rec.Status := Rec.Status::Rejected;
                    Rec."Approved/Rejected By" := UserId;
                    Rec."Approved/Rejected DateTime" := CurrentDateTime;
                    Rec.Modify();
                    Message('Leave Successfully Rejected!');

                end;
            }
        }
    }
}
