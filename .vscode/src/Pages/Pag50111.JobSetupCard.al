page 50111 "Job Setup Card"
{
    ApplicationArea = All;
    Caption = 'Job Setup Card';
    PageType = List;
    SourceTable = "Job Card Setup";
    UsageCategory = Lists;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                Caption = 'General';

                field("Primary Key"; Rec."Primary Key")
                {
                    ToolTip = 'Specifies the value of the Primary Key field.', Comment = '%';
                }
                field("Last Serial No."; Rec."Last Serial No.")
                {
                    ToolTip = 'Specifies the value of the Last Serial No. field.', Comment = '%';
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        if not Rec.Get('JOB') then begin
            Rec.Init();
            Rec."Primary Key" := 'JOB';
            Rec.Insert(true);
        end;

    end;
}
