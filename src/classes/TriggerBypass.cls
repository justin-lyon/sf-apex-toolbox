public with sharing class TriggerBypass {
	private final String REPLACER = '{!name}';
	private final String ERROR_MESSAGE = 'No record by MasterLabel: ' + REPLACER + ' found in TriggerBypass__mdt Custom Metadata.';

	private TriggerBypassDAI bypassAccessor;

	public TriggerBypass() {
		this(new TriggerBypassDA());
	}

	public TriggerBypass(TriggerBypassDAI accessor) {
		this.bypassAccessor = accessor;
	}

	public Boolean isActive(String triggerName) {
		TriggerBypass__mdt record;

		try {
			record = bypassAccessor.queryByMasterLabel(triggerName);
		} catch(QueryException qex) {
			String message = ERROR_MESSAGE.replace(REPLACER, triggerName);
			throw new TriggerBypassException(message);
		}

		return record.IsActive__c;
	}

	public class TriggerBypassException extends Exception {}
}