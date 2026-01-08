table 50110 "Student Exam Marks"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "School Code"; Code[10])
        {
            Caption = 'School Code';
        }
        field(2; "Class"; Code[10])
        {
            Caption = 'Class';
        }
        field(3; "Roll No."; Integer)
        {
            Caption = 'Roll No.';
        }
        field(4; "Subject Code"; Code[20])
        {
            Caption = 'Subject Code';
        }
        field(5; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }
        field(10; "Student Name"; Text[50])
        {
            Caption = 'Student Name';
        }
        field(11; "Subject Name"; Text[50])
        {
            Caption = 'Subject Name';
        }
        field(12; "Marks Obtained"; Decimal)
        {
            Caption = 'Marks';
        }
        field(13; "Total Marks"; Decimal)
        {
            Caption = 'Total Marks';
        }
    }

    keys
    {
        key(PK; "School Code", "Class", "Subject Code", "Roll No.", "Line No.")
        {
            Clustered = true;
        }
    }
}