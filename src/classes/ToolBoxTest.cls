@isTest
private class ToolBoxTest {

	static TestMethod void getSObjectType_givenName_shouldGetType() {
		Schema.SObjectType accountType = Schema.Account.SObjectType;

		Test.startTest();

			Schema.SObjectType objectType = ToolBox.getSObjectType('Account');

		Test.stopTest();

		System.assertEquals(accountType, objectType);
	}

	static TestMethod void getSObjectType_givenId_shouldGetType() {
		Schema.SObjectType userType = Schema.User.SObjectType;

		Test.startTest();

			Schema.SObjectType objectType = ToolBox.getSObjectType((Id)UserInfo.getUserId());

		Test.stopTest();

		System.assertEquals(userType, objectType);
	}

	static TestMethod void getRecordTypeId_givenCaseMaster_shouldGetId() {
		Test.startTest();

			Id caseMaster = ToolBox.getRecordTypeId('Case', 'Master');

		Test.stopTest();
		System.assertNotEquals(null, caseMaster);
	}

	static TestMethod void getRecordTypeIdsByObject_givenCase_shouldGetMaster() {
		String sobjectName = 'Case';

		Test.startTest();

			Map<String, Id> recordTypeIds = ToolBox.getRecordTypeIdsByObject(sobjectName);

		Test.stopTest();

		System.assert(recordTypeIds.containsKey('Master'));
	}

	static TestMethod void getPicklistEntries_givenField_shouldGetEntries() {
		List<Schema.PicklistEntry> accountSource = Schema.Account.AccountSource.getDescribe().getPicklistValues();

		Test.startTest();

			List<Schema.PickListEntry> entries = ToolBox.getPicklistEntries('Account', 'AccountSource');

		Test.stopTest();

		System.assertEquals(accountSource.size(), entries.size());
	}

	static TestMethod void getAllOrgLimits_givenNothing_shouldGetMapOfLimits() {
		Test.startTest();

			Map<String, OrgLimit> limits = ToolBox.getAllOrgLimits();

		Test.stopTest();

		System.assertNotEquals(null, limits);
	}

	static TestMethod void getOrgLimit_givenName_shouldGetLimit() {
		Test.startTest();

			OrgLimit l = ToolBox.getOrgLimit('SingleEmail');

		Test.stopTest();

		System.assertNotEquals(null, l);
	}
}