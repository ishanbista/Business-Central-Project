tableextension 50104 "Location Ext" extends Location
{
    fields
    {
        field(50100; "Make Field Editable"; Boolean)
        {
            Caption = 'Make Field Editable';
            DataClassification = ToBeClassified;
        }
        field(50101; "Make Name Editable"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        // field(50102; "Old Posting Group"; Option)
        // {
        //     Caption = 'Old Posting Group';
        //     OptionMembers = " ","3WH-SP",BATTERY,"JAWA-AC","JAWA-LU","JAWA-SP","M&M-MCYC","MCYCLE-LU","MCYCLE-SP","PEUGEOT-SP","SCOTER-LU","SCOTER-SP",SPAREGENER,"TOOLS-ACC",ACCMMTRA,ACCMMVEH,IMPLEMENT,LUBEMMTRA,LUBEMMVEH,SPAREMMEV,SPAREMMTRA,SPAREMMVEH,TOOLS,TYRE;
        //     OptionCaption = ' ,3WH-SP,BATTERY,JAWA-AC,JAWA-LU,JAWA-SP,M&M-MCYC,MCYCLE-LU,MCYCLE-SP,PEUGEOT-SP,SCOTER-LU,SCOTER-SP,SPAREGENER,TOOLS-ACC,ACCMMTRA,ACCMMVEH,IMPLEMENT,LUBEMMTRA,LUBEMMVEH,SPAREMMEV,SPAREMMTRA,SPAREMMVEH,TOOLS,TYRE';
        // }
    }
}
