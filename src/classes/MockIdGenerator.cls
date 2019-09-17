public with sharing class MockIdGenerator {

	public SObjectType mockType {get; private set;}
	private static Integer currentId = 1;

	public MockIdGenerator(SObjectType type) {
		this.mockType = type;
	}

	public MockIdGenerator(SObject obj) {
		this(obj.getSObjectType());
	}

	// Return type of ID converts length 15 string id to length 18 id id.
	public Id getMockId() {
		return getMockId(this.mockType);
	}

	public static Id getMockId(SObjectType type) {
		String nextIdStub = String.valueOf(currentId++);

		return type.getDescribe().getKeyPrefix()
			+ fillId(nextIdStub)
			+ nextIdStub;
	}

	private static String fillId(String currentId) {
		return '0'.repeat(12-currentId.length());
	}
}
