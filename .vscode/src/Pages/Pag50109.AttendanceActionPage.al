page 50109 "Attendance ActionPage"
{
    Caption = 'Attendance Section';
    PageType = CardPart;

    layout
    {
        area(Content)
        {
            cuegroup("Attendance")
            {
                field("Check In"; CheckIn)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Style = Favorable;
                    StyleExpr = true;
                    trigger OnDrillDown()

                    begin
                        CheckInRec();
                    end;
                }
                field("Check Out"; CheckOut)
                {
                    ApplicationArea = All;
                    DrillDown = true;
                    Style = Unfavorable;
                    StyleExpr = true;
                    trigger OnDrillDown()

                    begin
                        CheckOutRec();
                    end;
                }

            }
        }

    }
    local procedure CheckInRec()
    var
        Attend: Record "Attendance Entry";
    begin
        Attend.Init();
        Attend."User ID" := UserId();
        Attend.Date := Today();
        Attend."Check In " := Time;
        Attend.Location := 'Chandol';
        Attend.Insert();
        Message('Checked In at %1 Location: Chandol', Attend."Check In ");
    end;

    local procedure CheckOutRec()
    var
        Attend: Record "Attendance Entry";
    begin
        Attend.Reset();
        Attend.SetRange("User ID", UserId());
        Attend.SetRange(Date, Today);

        if Attend.FindLast() then begin
            Attend."Check Out" := Time;
            Attend.Modify();
            Message('Checked In at %1 Location: Chandol', Attend."Check In ");
        end else
            Message('No Check In found for today!');
    end;

    var
        CheckIn: Text;
        CheckOut: Text;

}
