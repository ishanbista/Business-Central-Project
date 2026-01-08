page 50119 "Student Marks Entry"
{
    ApplicationArea = All;
    Caption = 'Student Marks Entry';
    PageType = List;
    SourceTable = "Student Exam Marks";
    UsageCategory = Lists;
    AutoSplitKey = true;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("School Code"; Rec."School Code")
                {
                    ToolTip = 'Specifies the value of the School Code field.', Comment = '%';
                }
                field(Class; Rec.Class)
                {
                    ToolTip = 'Specifies the value of the Class field.', Comment = '%';
                }
                field("Roll No."; Rec."Roll No.")
                {
                    ToolTip = 'Specifies the value of the Roll No. field.', Comment = '%';
                }
                field("Subject Code"; Rec."Subject Code")
                {
                    ToolTip = 'Specifies the value of the Subject Code field.', Comment = '%';
                }
                field("Line No."; Rec."Line No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Line No. field.', Comment = '%';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ToolTip = 'Specifies the value of the Student Name field.', Comment = '%';
                }
                field("Subject Name"; Rec."Subject Name")
                {
                    ToolTip = 'Specifies the value of the Subject Name field.', Comment = '%';
                }
                field("Marks Obtained"; Rec."Marks Obtained")
                {
                    ToolTip = 'Specifies the value of the Marks field.', Comment = '%';
                }
                field("Total Marks"; Rec."Total Marks")
                {
                    ToolTip = 'Specifies the value of the Total Marks field.', Comment = '%';
                }
            }
        }
    }
}
