@isTest
private class PricebookSingletonTest {

	@TestSetup
	static void setupData() {
		Pricebook2 stdPricebook = new Pricebook2(
			Id = Test.getStandardPricebookId());
		update stdPricebook;
	}

	static TestMethod void getStdPricebookId_shouldGetId() {
		Test.startTest();

			Id stdPricebookId = PricebookSingleton.getStdPricebookId();

		Test.stopTest();

		System.assertNotEquals(null, stdPricebookId);
	}

	static TestMethod void getStdPricebook_shouldGetStdPricebook() {
		Test.startTest();

			Pricebook2 stdPricebook = PricebookSingleton.getStdPricebook();

		Test.stopTest();

		System.assertNotEquals(null, stdPricebook);
	}
}