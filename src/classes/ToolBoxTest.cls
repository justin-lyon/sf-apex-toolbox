@isTest
private class ToolBoxTest {

	static TestMethod void getSObjectType_givenName_shouldGetType() {
		Schema.SObjectType accountType = Schema.Account.SObjectType;
		Schema.SObjectType objectType = ToolBox.getSObjectType('Account');

		System.assertEquals(accountType, objectType);
	}

	static TestMethod void getSObjectType_givenId_shouldGetType() {
		Schema.SObjectType userType = Schema.User.SObjectType;
		Schema.SObjectType objectType = ToolBox.getSObjectType((Id)UserInfo.getUserId());

		System.assertEquals(userType, objectType);
	}

	static TestMethod void getRecordTypeId_givenCaseMaster_shouldGetId() {
		Id caseMaster = ToolBox.getRecordTypeId('Case', 'Master');
		System.assertNotEquals(null, caseMaster);
	}

	static TestMethod void getPicklistEntries_givenField_shouldGetEntries() {
		List<Schema.PicklistEntry> accountSource = Schema.Account.AccountSource.getDescribe().getPicklistValues();
		List<Schema.PickListEntry> entries = ToolBox.getPicklistEntries('Account', 'AccountSource');

		System.assertEquals(accountSource.size(), entries.size());
	}

	static TestMethod void getAllOrgLimits_givenNothing_shouldGetMapOfLimits() {
		Map<String, OrgLimit> limits = ToolBox.getAllOrgLimits();
		System.assertNotEquals(null, limits);
	}

	static TestMethod void getOrgLimit_givenName_shouldGetLimit() {
		OrgLimit l = ToolBox.getOrgLimit('SingleEmail');
		System.assertNotEquals(null, l);
	}
}