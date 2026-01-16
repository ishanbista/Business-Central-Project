tableextension 50102 "Item Ext" extends Item
{
    fields
    {
        field(50100; "Old Posting Group"; Option)
        {
            Caption = 'Old Posting Group';
            OptionMembers = " ",ACCMMTRA,ACCMMVEH,IMPLEMENT,LUBEMMTRA,LUBEMMVEH,SPAREMMEV,SPAREMMTRA,SPAREMMVEH,TOOLS,TYRE;
            OptionCaption = ', ACCMMTRA,ACCMMVEH,IMPLEMENT,LUBEMMTRA,LUBEMMVEH,SPAREMMEV,SPAREMMTRA,SPAREMMVEH,TOOLS,TYRE';
        }
    }
}
