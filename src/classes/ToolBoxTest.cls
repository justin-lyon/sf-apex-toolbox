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

	static TestMethod void generateGUID_default_shouldGetID() {
		Test.startTest();

			String guid = ToolBox.generateGUID();

		Test.stopTest();

		System.assertNotEquals(null, guid);
	}

	static TestMethod void generateGUID_default_shouldGetUniqueIDs() {
		Test.startTest();

			String guid1 = ToolBox.generateGUID();
			String guid2 = ToolBox.generateGUID();

		Test.stopTest();

		System.assertNotEquals(guid1, guid2, 'Two generated GUIDs are unique.');
	}
}
