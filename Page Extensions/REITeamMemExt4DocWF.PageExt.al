pageextension 70976606 REITeamMemExt4DocWF extends "Team Member Role Center"
{
    layout
    {
        addafter(Control3)
        {
            part(DocWFCue; REIDocumentApprovalCues)
            {
                ApplicationArea = All;
            }
        }
    }
}
