page 50107 "Leave Cue Page"
{
    Caption = 'Leave Dashboard';
    PageType = CardPart;
    SourceTable = "Leave Cue";

    layout
    {
        area(Content)
        {
            cuegroup("Leave Details")
            {
                Caption = 'Leave Details';
                field("Pending Leave"; Rec."Pending Leave")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Pending Leave Page";
                    Style = Ambiguous;
                    StyleExpr = true;
                }
                field("Approved Leave"; Rec."Approved Leave")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Approved Leave Page";
                    Style = Favorable;
                    StyleExpr = true;

                }
                field("Rejected Leave"; Rec."Rejected Leave")
                {
                    ApplicationArea = All;
                    DrillDownPageId = "Rejected Leave Page";
                    Style = Unfavorable;
                    StyleExpr = true;


                }

            }
        }
    }
    // trigger OnOpenPage()

    // begin
    //     Rec.Init();
    //     Rec."Primary Key" := 'PRIMARY';
    //     Rec.Insert(true);
    // end;
}
