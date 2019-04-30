@isTest
private class TriggerBypassDATest {

	private static final String MASTER_LABEL_USER = 'User';

	static TestMethod void queryByMasterLabel_givenMasterLabel_shouldFindRecord() {
		TriggerBypass__mdt bypassRecord;

		TriggerBypassDAI bypassAccessor = new TriggerBypassDA();
		Test.startTest();

			bypassRecord = bypassAccessor.queryByMasterLabel(MASTER_LABEL_USER);

		Test.stopTest();

		System.assertNotEquals(null, bypassRecord);
	}
}