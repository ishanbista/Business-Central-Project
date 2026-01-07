table 50108 "TDS Entry"
{
    Caption = 'TDS Entry';
    DataClassification = ToBeClassified;
    // LookupPageId = "TDS Entries";
    // DrillDownPageId = "TDS Entries";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(3; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = ToBeClassified;
        }
        field(4; "Source Type"; Enum "Gen. Journal Source Type")
        {
            Caption = 'Source Type';
            DataClassification = ToBeClassified;
            //OptionMembers = " ","Customer","Vendor";
        }
        field(5; "Bill-to/Pay-to No."; Code[20])
        {
            Caption = 'Bill-to/Pay-to No.';
            DataClassification = ToBeClassified;
        }
        field(6; "TDS Posting Group"; Code[20])
        {
            Caption = 'TDS Posting Group';
            DataClassification = ToBeClassified;
            TableRelation = "TDS Posting Group".Code;
        }
        field(7; "TDS %"; Decimal)
        {
            Caption = 'TDS %';
            DataClassification = ToBeClassified;
        }
        field(8; Base; Decimal)
        {
            Caption = 'Base';
            DataClassification = ToBeClassified;
        }
        field(9; "TDS Amount"; Decimal)
        {
            Caption = 'TDS Amount';
            DataClassification = ToBeClassified;
        }
        field(10; "User ID"; Code[50])
        {
            Caption = 'User ID';
            DataClassification = ToBeClassified;
        }
        field(11; "Source Code"; Code[20])
        {
            Caption = 'Source Code';
            DataClassification = ToBeClassified;
        }
        field(12; "Transaction No."; Integer)
        {
            Caption = 'Transaction No.';
            DataClassification = ToBeClassified;
        }
        field(13; "External Document No."; Code[20])
        {
            Caption = 'External Document No.';
            DataClassification = ToBeClassified;
        }
        field(14; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
        }
        field(15; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = ToBeClassified;
        }
        field(16; "Shortcut Dimension 1 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 1 Code';
            CaptionClass = '1,2,1';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(17; "Shortcut Dimension 2 Code"; Code[20])
        {
            Caption = 'Shortcut Dimension 2 Code';
            CaptionClass = '1,2,2';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
        }
        field(18; "Transaction Type"; Option)
        {
            Caption = 'Transaction Type';
            DataClassification = ToBeClassified;
            OptionMembers = " ","Purchase TDS","Sales TDS";
        }
        field(20; "Reversed Entry No."; Integer)
        {
            Caption = 'Reversed Entry No.';
            DataClassification = ToBeClassified;
        }
        field(21; Reversed; Boolean)
        {
            Caption = 'Reversed';
            DataClassification = ToBeClassified;
        }
        field(22; "Reversed by Entry No."; Integer)
        {
            Caption = 'Reversed by Entry No.';
            DataClassification = ToBeClassified;
        }
        field(24; Closed; Boolean)
        {
            Caption = 'Closed';
            DataClassification = ToBeClassified;
        }
        field(25; "IRD Voucher No."; Code[50])
        {
            Caption = 'IRD Voucher No.';
            DataClassification = ToBeClassified;
        }
        field(26; "IRD Code"; Text[50])
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = lookup("TDS Posting Group"."IRD Code" where(Code = field("TDS Posting Group")));
        }
        field(480; "Dimension Set ID"; Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
        }
        field(90000; "GL Account"; Code[20])
        {
            Caption = 'GL Account';
            FieldClass = FlowField;
            CalcFormula = Lookup("TDS Posting Group"."GL Account No." WHERE(Code = FIELD("TDS Posting Group")));
        }
        field(90001; "IRD Voucher Date"; Date)
        {
            Caption = 'IRD Voucher Date';
            DataClassification = ToBeClassified;
        }
        field(90002; "Fiscal Year"; Code[10])
        {
            Caption = 'Fiscal Year';
            DataClassification = ToBeClassified;
        }
        field(94000; "Vendor Name"; Text[50])
        {
            Caption = 'Vendor Name';
            DataClassification = ToBeClassified;
        }
        field(94001; "GL Account Name"; Text[50])
        {
            Caption = 'GL Account Name';
            DataClassification = ToBeClassified;
        }
        field(94002; "Payment Done"; Boolean)
        {
            Caption = 'Payment Done';
            DataClassification = ToBeClassified;
        }
        field(94003; "Bank Account No."; Code[20])
        {
            Caption = 'Bank Account No.';
            DataClassification = ToBeClassified;
        }
        field(94004; "G/L Entry No."; Integer)
        {
            Caption = 'G/L Entry No.';
            DataClassification = ToBeClassified;
        }
        field(94005; "Payment Transaction No."; Integer)
        {
            Caption = 'Payment Transaction No.';
            DataClassification = ToBeClassified;
        }
        field(94006; Narration; Text[250])
        {
            Caption = 'Narration';
            DataClassification = ToBeClassified;
        }
        field(94007; "Nepali Date"; Text[10])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "English-Nepali Date"."Nepali Date";
        }
        field(94008; "Expense G/L Account code"; code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(94009; "Expense G/L Account Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(94010; "TDS Type"; Option)
        {
            OptionMembers = " ","Purchase TDS","Sales TDS";
            Caption = 'TDS Type';
            Description = 'TDS 1.00';
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
    var
        GenJnlPostPreview: codeunit "Posting Preview Event Handler";
        GenJnlPost: codeunit "Gen. Jnl.-Post Line";
        GLSetUp: Record "General Ledger Setup";
        TDS_Payment_Narration: TextConst ENU = 'System Created TDS Payment Entry for Doc. No.';
        NavigateForm: Page Navigate;
        Vendor: Record Vendor;
        Customer: Record Customer;
        Employee: Record Employee;

    procedure Navigate()
    begin

        NavigateForm.setdoc("Posting Date", "Document No.");
        NavigateForm.run;
    end;

    procedure CreatePaymentJournals(VAR GenJnlLine: Record "Gen. Journal Line"; VAR TDS_Entry: Record "TDS Entry"; Reverse: Boolean; BankAccNo: Code[20]; GenJnlTemplateName: Code[10]; GenJnlBatchName: Code[10]; LineNo: Integer)
    var
        // NoSeriesMgt: codeunit NoSeriesManagement;
        GenJnlBatchRec: Record "Gen. Journal Batch";
        GenJnlTemplateRec: Record "Gen. Journal Template";
    begin
        TDS_Entry.CalcFields("GL Account");
        GenJnlLine.VALIDATE("Posting Date", WORKDATE); //>> MIN 8/12/2019 for validate workdate.
        GenJnlLine.VALIDATE("Account Type", GenJnlLine."Account Type"::"G/L Account");
        GenJnlLine."Line No." := LineNo;
        GenJnlLine.VALIDATE("Account No.", TDS_Entry."GL Account");
        IF NOT Reverse THEN BEGIN
            GenJnlLine.VALIDATE(Amount, TDS_Entry."TDS Amount");
            GenJnlLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Payment);
        END ELSE BEGIN
            GenJnlLine.VALIDATE(Amount, -TDS_Entry."TDS Amount");
            GenJnlLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Refund);
        END;
        // GenJnlLine."External Document No." := TDS_Entry."Document No." + '(' + FORMAT(TDS_Entry."Entry No.") + ')';
        // GenJnlLine.Narration := TDS_Payment_Narration + TDS_Entry."Document No.";
        // GenJnlLine.VALIDATE("Shortcut Dimension 1 Code", TDS_Entry."Shortcut Dimension 1 Code");
        // GenJnlLine."TDS Entry No." := TDS_Entry."Entry No.";
        // GenJnlLine."System-Created Entry" := TRUE;
        // GenJnlPost.RUN(GenJnlLine);

        IF NOT Reverse THEN BEGIN
            TDS_Entry."Payment Done" := TRUE;
            TDS_Entry.Reversed := FALSE;
        END ELSE BEGIN
            TDS_Entry."Payment Done" := FALSE;
            TDS_Entry.Reversed := TRUE;
        END;
        TDS_Entry."Payment Transaction No." := GetGLEntryTransactionNo(TDS_Entry."Entry No.");
        TDS_Entry."Bank Account No." := BankAccNo;
        TDS_Entry.MODIFY;
    end;

    local procedure GetGLEntryTransactionNo(TDS_Entry_No: Integer): Integer
    var
        GLEntry: Record "G/L Entry";
    begin
        // GLEntry.SETRANGE("TDS Entry No.", TDS_Entry_No);
        GLEntry.FINDLAST;
        EXIT(GLEntry."Transaction No.");
    end;

    procedure ReverseTDSPaymentEntry(VAR TDSEntry: Record "TDS Entry")
    var
        Text001: TextConst ENU = '';
        Text003: TextConst ENU = '';
        GLEntry: Record "G/L Entry";
        ReversalEntry: Record "Reversal Entry";
    begin
        IF TDSEntry.FINDFIRST THEN BEGIN
            IF NOT CONFIRM(Text001, FALSE) THEN
                EXIT;
            REPEAT
                TDSEntry.TESTFIELD(Reversed, FALSE);

                GLEntry.RESET;
                GLEntry.SETRANGE("Transaction No.", TDSEntry."Payment Transaction No.");
                IF GLEntry.FINDFIRST THEN BEGIN
                    CLEAR(ReversalEntry);
                    IF GLEntry.Reversed THEN
                        ReversalEntry.AlreadyReversedEntry(TABLECAPTION, GLEntry."Entry No.");
                    GLEntry.TESTFIELD("Transaction No.");
                    ReversalEntry.SetHideDialog(TRUE);
                    // ReversalEntry.SetTDSEntry(TRUE);
                    ReversalEntry.ReverseTransaction(GLEntry."Transaction No.")
                END;

                IF GLEntry.Reversed THEN BEGIN
                    TDSEntry.Reversed := TRUE;
                    TDSEntry."Payment Done" := FALSE;
                END;
            UNTIL TDSEntry.NEXT = 0;
            MESSAGE(Text003);
        END;
    end;

    procedure GetJournalTemplate(BatchName: Code[10]): Code[10]
    var
        JournalBatch: Record "Gen. Journal Batch";
    begin
        JournalBatch.RESET;
        JournalBatch.SETRANGE(Name, BatchName);
        IF JournalBatch.FINDSET THEN
            EXIT(JournalBatch."Journal Template Name");
    end;

    procedure CreateBalanceJournal(VAR GenJnlLine: Record "Gen. Journal Line"; Reverse: Boolean; BankAccNo: Code[20]; Amount: Decimal; LineNo: Integer; GenJnlTemplateName: Code[10]; GenJnlBatchName: Code[10])
    var
        TDS_Entry: Record "TDS Entry";
    begin
        GLSetup.GET;
        GenJnlLine.VALIDATE("Posting Date", WORKDATE); //>> MIN 8/12/2019 for validate workdate.
        GenJnlLine.VALIDATE("Account Type", GenJnlLine."Account Type"::"Bank Account");
        GenJnlLine.VALIDATE("Account No.", BankAccNo);
        GenJnlLine."Line No." := LineNo;
        // GenJnlLine.Narration := GenJnlLine."Document No." + 'TDS Entry Payment';
        //GenJnlLine."Journal Template Name" := GenJnlTemplateName;
        //GenJnlLine."Journal Batch Name" := GenJnlBatchName;
        IF NOT Reverse THEN BEGIN
            GenJnlLine.VALIDATE(Amount, -Amount);
            GenJnlLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Payment);
        END ELSE BEGIN
            GenJnlLine.VALIDATE(Amount, Amount);
            GenJnlLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Refund);
        END;
        // GenJnlLine.VALIDATE("Shortcut Dimension 1 Code", GLSetup."TDS Branch Code");
        GenJnlLine."System-Created Entry" := TRUE;
        GenJnlPost.RUN(GenJnlLine);
        //GenJnlLine.INSERT;
    end;

    procedure CreateBalanceJournalGLACC(VAR GenJnlLine: Record "Gen. Journal Line"; Reverse: Boolean; BankAccNo: Code[20]; Amount: Decimal; LineNo: Integer; GenJnlTemplateName: Code[10]; GenJnlBatchName: Code[10])
    var
        TDS_Entry: Record "TDS Entry";
    begin
        GLSetup.GET;
        GenJnlLine.VALIDATE("Posting Date", WORKDATE); //>> MIN 8/12/2019 for validate workdate.
        GenJnlLine.VALIDATE("Account Type", GenJnlLine."Account Type"::"G/L Account");
        GenJnlLine.VALIDATE("Account No.", BankAccNo);
        GenJnlLine."Line No." := LineNo;
        // GenJnlLine.Narration := GenJnlLine."Document No." + 'TDS Entry Payment';
        //GenJnlLine."Journal Template Name" := GenJnlTemplateName;
        //GenJnlLine."Journal Batch Name" := GenJnlBatchName;
        IF NOT Reverse THEN BEGIN
            GenJnlLine.VALIDATE(Amount, -Amount);
            GenJnlLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Payment);
        END ELSE BEGIN
            GenJnlLine.VALIDATE(Amount, Amount);
            GenJnlLine.VALIDATE("Document Type", GenJnlLine."Document Type"::Refund);
        END;
        // GenJnlLine.VALIDATE("Shortcut Dimension 1 Code", GLSetup."TDS Branch Code");
        GenJnlLine."System-Created Entry" := TRUE;
        GenJnlPost.RUN(GenJnlLine);
        //GenJnlLine.INSERT;
    end;

    procedure CopyFromGenJnlLine(GenJnlLine: Record "Gen. Journal Line")
    var
        TDSPostingGroup: Record "TDS Posting Group";
        GLAcc: Record "G/L Account";
        GLAcc1: Record "G/L Account";
        FixedAssets: Record "Fixed Asset";
        FAPostingGroup: Record "FA Posting Group";
    begin
        "Posting Date" := GenJnlLine."Posting Date";
        "Document Date" := GenJnlLine."Document Date";
        "Document No." := GenJnlLine."Document No.";
        "External Document No." := GenJnlLine."Document No.";
        IF GenJnlLine."Bill-to/Pay-to No." = '' THEN
            "Bill-to/Pay-to No." := GenJnlLine."Source No."
        ELSE
            "Bill-to/Pay-to No." := GenJnlLine."Bill-to/Pay-to No.";
        "Source Type" := GenJnlLine."Source Type";
        if "Source Type" = "Source Type"::" " then begin
            if Vendor.Get("Bill-to/Pay-to No.") then
                "Source Type" := "Source Type"::Vendor
            else
                if Customer.get("Bill-to/Pay-to No.") then
                    "Source Type" := "Source Type"::Customer
                else
                    if Employee.Get("Bill-to/Pay-to No.") then
                        "Source Type" := "Source Type"::Employee;
        end;
        // "TDS Posting Group" := GenJnlLine."TDS Group";
        // "TDS %" := GenJnlLine."TDS %";
        // Base := GenJnlLine."TDS Base Amount (LCY)";
        // "TDS Amount" := GenJnlLine."TDS Amount (LCY)";
        "User ID" := USERID;
        "Source Code" := GenJnlLine."Source Code";
        "External Document No." := GenJnlLine."External Document No.";
        "Document Date" := GenJnlLine."Document Date";
        "Dimension Set ID" := GenJnlLine."Dimension Set ID";
        "Shortcut Dimension 1 Code" := GenJnlLine."Shortcut Dimension 1 Code";
        "Shortcut Dimension 2 Code" := GenJnlLine."Shortcut Dimension 2 Code";
        // "Nepali Date" := GenJnlLine."Nepali Date";
        // Narration := GenJnlLine.Narration;
        //"TDS Type" := GenJnlLine."TDS Type";
        //"Vendor Name" := VendorName;
        //"GL Account Name" := GLAccountName;
        // if TDSPostingGroup.Get(GenJnlLine."TDS Group") then begin
        //     if GLAcc1.Get(TDSPostingGroup."GL Account No.") then
        //         "GL Account Name" := GLAcc1.Name;
        // end;
        // if GenJnlLine."Account Type" = GenJnlLine."Account Type1"::"Fixed Asset" then begin
        if FixedAssets.Get(GenJnlLine."Account No.") then begin
            if FAPostingGroup.get(FixedAssets."FA Posting Group") then begin
                if GLAcc.Get(FAPostingGroup."Acquisition Cost Account") then begin
                    Validate("Expense G/L Account code", FAPostingGroup."Acquisition Cost Account");
                    "Expense G/L Account Name" := GLAcc.Name;
                end;
            end;
        end
        // end
        else begin
            if GLAcc.Get(GenJnlLine."Account No.") then begin
                Validate("Expense G/L Account code", GenJnlLine."Account No.");
                "Expense G/L Account Name" := GLAcc.Name;
            end;
        end;
        OnAfterCopyFromGenJnlLine(Rec, GenJnlLine);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterCopyFromGenJnlLine(var TDSEntry: Record "TDS Entry"; GenJnlLine: Record "Gen. Journal Line")
    begin
    end;
}
