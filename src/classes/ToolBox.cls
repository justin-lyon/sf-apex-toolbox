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

	public static Map<String, Id> getRecordTypeIdsByObject(String objectName) {
		Map<String, Id> recordTypesByDeveloperName = new Map<String, Id>();
		for(Schema.RecordTypeInfo info : getSObjectType(objectName).getDescribe().getRecordTypeInfosByDeveloperName().values()) {
			recordTypesByDeveloperName.put(info.getName(), info.getRecordTypeId());
		}
		return recordTypesByDeveloperName;
	}

	public static List<Schema.PicklistEntry> getPicklistEntries(String objectName, String fieldName) {
		Schema.DescribeSObjectResult objectDescribe = getSObjectType(objectName).getDescribe();
		return objectDescribe.Fields.getMap().get(fieldName).getDescribe().getPicklistValues();
	}

	public static String generateGUID() {
		Blob aesKey = Crypto.generateAesKey(128);
		String hexKey = EncodingUtil.convertToHex(aesKey);
		List<String> segments = new List<String>();

		segments.add(hexKey.substring(0, 8));
		segments.add(hexKey.substring(8, 12));
		segments.add(hexKey.substring(12, 16));
		segments.add(hexKey.substring(20));
		return String.join(segments, '-');
	}
}
