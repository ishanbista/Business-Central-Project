table 50100 "New Leave Request"
{
    Caption = 'New Leave Request';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            AutoIncrement = true;
        }
        field(2; "Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                Employee: Record Employee;
            begin
                if Employee.Get("Employee No.") then
                    "Employee Name" := Employee."First Name" + ' ' + Employee."Last Name";
            end;
        }
        field(3; "Leave Type"; Enum "Leave Type")
        {
            DataClassification = ToBeClassified;
        }
        field(4; Status; Enum "Leave Status")
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5; "From Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                CalcNoOfDays();
            end;
        }
        field(6; "To Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()

            begin
                CalcNoOfDays();
            end;
        }
        field(7; Reason; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Requested Date Time"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9; "Approved/Rejected By"; Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10; "Approved/Rejected DateTime"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11; "Employee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(12; "No. of Days"; Decimal)
        {
            DataClassification = ToBeClassified;
            DecimalPlaces = 0 : 2;
            Editable = false;
        }
        field(13; "Rejection Reason"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
    trigger OnModify()

    begin
        CalcNoOfDays();
    end;

    trigger OnInsert()

    begin
        "Requested Date Time" := CurrentDateTime();
        CalcNoOfDays();
    end;

    local procedure CalcNoOfDays()
    var
        daysInt: Integer;
        daysDec: Decimal;
    begin

        "No. of Days" := 0;

        if ("From Date" = 0D) or ("To Date" = 0D) then
            exit;

        if "To Date" < "From Date" then
            Error('To Date (%1) cannot be earlier than From Date (%2).', Format("To Date"), Format("From Date"));

        daysInt := "To Date" - "From Date";

        daysDec := daysInt;
        "No. of Days" := ROUND(daysDec, 0.01);
    end;

    procedure GetIntrastatCodeFromCountryRegion(CountryRegionCode: Code[10]): Code[10]
    var
        CountryRegion: Record "Country/Region";
    begin
        CountryRegion.SetLoadFields("Intrastat Code");
        if CountryRegion.Get(CountryRegionCode) then
            exit(CountryRegion."Intrastat Code");
    end;

    // procedure GetIntrastatCodeFromCountryRegion(CountryRegionCode: Code[10]): Code[10]
    // var
    //     CountryRegion: Record "Country/Region";
    // begin
    //     if CountryRegionCode = '' then
    //         exit('');

    //     CountryRegion.SetLoadFields("Intrastat Code");

    //     if not CountryRegion.Get(CountryRegionCode) then
    //         exit('');

    //     exit(CountryRegion."Intrastat Code");
    // end;
}
