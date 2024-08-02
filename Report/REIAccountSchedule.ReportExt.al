reportextension 70976575 REIAccountSchedule extends "Account Schedule"
{
    dataset
    {
        // Add changes to dataitems and columns here



    }

    requestpage
    {
        // Add changes to the requestpage here
        layout
        {
            addfirst(Filters)
            {
                field(Location; Location)
                {
                    Caption = 'Starting Date';
                }

            }
        }

    }

    rendering
    {
        layout(LayoutName)
        {
            Type = RDLC;
            LayoutFile = 'mylayout.rdl';
        }
    }
    var
        Location: code[20];
}