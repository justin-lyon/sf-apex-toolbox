public inherited sharing class TriggerBypassDA implements TriggerBypassDAI {

	public TriggerBypass__mdt queryByMasterLabel(String masterLabel) {
		return [
			SELECT Id,
				IsActive__c,
				MasterLabel
			FROM TriggerBypass__mdt
			WHERE MasterLabel = :masterLabel
			LIMIT 1];
	}
}