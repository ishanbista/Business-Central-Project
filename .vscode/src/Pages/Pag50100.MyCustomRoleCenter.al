page 50100 "My Custom RoleCenter"
{
    ApplicationArea = All;
    Caption = 'My Custom RoleCenter';
    PageType = RoleCenter;

    layout
    {
        area(RoleCenter)
        {
            part(Headline; "Headline RC Business Manager")
            {
                ApplicationArea = All;
            }
            part("Leave Dashboard"; "Leave Cue Page")
            {
                ApplicationArea = All;
            }

            part(AttendenceActions; "Attendance ActionPage")
            {
                ApplicationArea = All;
            }
            part(AttendanceSection; "Attendance Page")
            {
                ApplicationArea = All;
            }

        }
        
    }
}
