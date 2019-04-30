@isTest
public inherited sharing class TriggerBypassDAMock implements TriggerBypassDAI {
	public Boolean IsSuccess = true;
	public Boolean IsActive = true;

	public TriggerBypass__mdt queryByMasterLabel(String masterLabel) {
		if(!IsSuccess) {
			throw new TriggerBypass.TriggerBypassException('Forced exception from TriggerBypassDAMock.');
		}

		return new TriggerBypass__mdt(
			MasterLabel = masterLabel,
			IsActive__c = IsActive);
	}
}