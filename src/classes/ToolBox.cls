public with sharing class ToolBox {

	public static Schema.SObjectType getSObjectType(String objectName) {
		return Schema.getGlobalDescribe().get(objectName);
	}

	public static Schema.SObjectType getSObjectType(Id recordId) {
		return recordId.getSobjectType();
	}

	public static Id getRecordTypeId(String objectName, String recordTypeDeveloperName) {
		Schema.SObjectType objectType = getSObjectType(objectName);
		return objectType.getDescribe().getRecordTypeInfosByDeveloperName().get(recordTypeDeveloperName).getRecordTypeId();
	}

	public static List<Schema.PicklistEntry> getPicklistEntries(String objectName, String fieldName) {
		Schema.DescribeSObjectResult objectDescribe = getSObjectType(objectName).getDescribe();
		return objectDescribe.Fields.getMap().get(fieldName).getDescribe().getPicklistValues();
	}

	public static Map<String, OrgLimit> getAllOrgLimits() {
		return OrgLimits.getMap();
	}

	public static OrgLimit getOrgLimit(String limitName) {
		return getAllOrgLimits().get(limitName);
	}
}