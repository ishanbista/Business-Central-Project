page 50108 "Attendance Page"
{
    Caption = 'Attendance Record';
    PageType = ListPart;
    SourceTable = "Attendance Entry";
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Date; Rec.Date)
                {
                    ApplicationArea = All;
                }
                field("Check In "; Rec."Check In ")
                {
                    ApplicationArea = All;

                }
                field("Check Out"; Rec."Check Out")
                {
                    ApplicationArea = All;

                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = All;

                }
            }

        }
    }
}
