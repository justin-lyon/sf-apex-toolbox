@isTest
private class MockIdGeneratorTest {

	static TestMethod void getMockId_givenAccount_shouldGetAccountPrefixId() {
		Account acc = new Account();
		MockIdGenerator idGen = new MockIdGenerator(acc);
		String accountIdPrefix = Account.getSObjectType().getDescribe().getKeyPrefix();

		Test.startTest();

			String accountId = idGen.getMockId();

		Test.stopTest();

		System.assertEquals(accountIdPrefix, accountId.substring(0, 3));
		System.assertEquals(18, accountId.length(), accountId);
	}
}
