/// <summary>
/// This allow specifying proper page to be opened for a document approval entry
/// </summary>
codeunit 70976575 REIDocumentWfEventsPubAndSub
{
    //SingleInstance = true;
    var
        DocAppCue: Page REIDocumentApprovalCues;

    [IntegrationEvent(false, false)]
    procedure PublishCurrentDocAppEntryRecFromDocAppEntriesPage(
                                                DocAppEntry: Record REIDocumentApprovalEntry;
                                                TableID: integer;
                                                Sequence: Integer;
                                                DocNo: Code[50];
                                                Status: Option  " ",Pending,Approved,Rejected)
    begin
        //Will be called from the "view Approved Document" action on the
        //"Document Approval Entries" page and will be subscribed to by "TemporarilyHoldPublishedDocAppEntry"
        //found in the codeunit: 50005 (DocumentWfEventsPubAndSub)
    end;

    #region EventSubscriber Codeunit "Conf./Personalization Mgt." OnRoleCenterOpen 
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Conf./Personalization Mgt.", 'OnRoleCenterOpen', '', false, false)]
    local procedure OnRoleCenterOpen();
    begin
        DocAppCue.UpdatePersonalizedCue();
        DocAppCue.Update();
    end;
    #endregion EventSubscriber Codeunit "Conf./Personalization Mgt." OnRoleCenterOpen 
}