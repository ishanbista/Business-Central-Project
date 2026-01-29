table 50115 "English-Nepali Date"
{
    // version IRD19.00

    Caption = 'English-Nepali Date';
    // DrillDownPageId = "English-Nepali Date";
    // LookupPageID = "English-Nepali Date";

    fields
    {
        field(1; "English Year"; Integer)
        {
        }
        field(2; "English Month"; Option)
        {
            OptionMembers = " ",January,February,March,April,May,June,July,August,September,October,November,December;
        }
        field(3; "English Day"; Integer)
        {
        }
        field(4; Week; Option)
        {
            OptionMembers = " ",Sunday,Monday,Tuesday,Wednesday,Thursday,Friday,Saturday;
        }
        field(5; "English Date"; Date)
        {
        }
        field(6; "Week Integer"; Integer)
        {
        }
        field(7; "Day Off"; Boolean)
        {
        }
        field(8; "Nepali Date"; Code[10])
        {
        }
        field(9; "Nepali Year"; Integer)
        {
        }
        field(10; "Nepali Month"; Option)
        {
            OptionMembers = " ",Baisakh,Jestha,Asar,Shrawan,Bhadra,Ashoj,Kartik,Mangsir,Poush,Magh,Falgun,Chaitra;
        }
        field(11; "Nepali Day"; Integer)
        {
        }
        field(12; "Fiscal Year"; Code[10])
        {
        }
        field(13; "Floating Holiday"; Boolean)
        {
        }
        field(14; Description; Text[30])
        {
        }
        field(15; "Open Date for Appraisal"; Boolean)
        {
        }
        field(16; "Close Date for Appraisal"; Boolean)
        {
        }
        field(17; "Opening Fiscal Year"; Boolean)
        {
        }
        field(18; "Closing Fiscal Year"; Boolean)
        {
        }
    }

    keys
    {
        key(Key1; "Nepali Year", "English Year", "English Month", "English Day")
        {
        }
    }

    fieldgroups
    {
    }

    procedure getNepaliMonth(EngDate: Date): Text[100]
    var
        EnglishNepaliDate: Record "English-Nepali Date";
    begin
        EnglishNepaliDate.RESET;
        EnglishNepaliDate.SETRANGE("English Date", EngDate);
        if EnglishNepaliDate.FINDFIRST then
            exit(format(EnglishNepaliDate."Nepali Month"));
    end;

    procedure getNepaliDate(EngDate: Date): code[10]
    var
        EnglishNepaliDate: Record "English-Nepali Date";
    begin
        EnglishNepaliDate.RESET;
        EnglishNepaliDate.SETRANGE("English Date", EngDate);
        if EnglishNepaliDate.FINDFIRST then
            exit(EnglishNepaliDate."Nepali Date");
    end;

    procedure getEngDate(NepDate: Code[20]): Date
    var
        EnglishNepaliDate: Record "English-Nepali Date";
    begin
        EnglishNepaliDate.RESET;
        EnglishNepaliDate.SETRANGE("Nepali Date", NepDate);
        if EnglishNepaliDate.FINDFIRST then
            exit(EnglishNepaliDate."English Date");
    end;

    procedure getNepaliYear(EngDate: Date): Integer
    var
        EnglishNepaliDate: Record "English-Nepali Date";
    begin
        EnglishNepaliDate.RESET;
        EnglishNepaliDate.SETRANGE("English Date", EngDate);
        if EnglishNepaliDate.FINDFIRST then
            exit(EnglishNepaliDate."Nepali Year");
    end;

    procedure getEnglishYear(EngDate: Date): Integer
    var
        EnglishNepaliDate: Record "English-Nepali Date";
    begin
        EnglishNepaliDate.RESET;
        EnglishNepaliDate.SETRANGE("English Date", EngDate);
        if EnglishNepaliDate.FINDFIRST then
            exit(EnglishNepaliDate."English Year");
    end;

    procedure getNepaliMonthInt(EngDate: Date): Integer
    var
        EnglishNepaliDate: Record "English-Nepali Date";
    begin
        EnglishNepaliDate.RESET;
        EnglishNepaliDate.SETRANGE("English Date", EngDate);
        if EnglishNepaliDate.FINDFIRST then
            exit(EnglishNepaliDate."Nepali Month");
    end;
}

