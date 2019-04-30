@isTest
private class PricebookSingletonTest {

	@TestSetup
	static void setupData() {
		Pricebook2 stdPricebook = new Pricebook2(
			Id = Test.getStandardPricebookId());
		update stdPricebook;
	}

	static TestMethod void getStdPricebookId_shouldGetId() {
		Id stdPricebookId = PricebookSingleton.getStdPricebookId();
		System.assertNotEquals(null, stdPricebookId);
	}

	static TestMethod void getStdPricebook_shouldGetStdPricebook() {
		Pricebook2 stdPricebook = PricebookSingleton.getStdPricebook();
		System.assertNotEquals(null, stdPricebook);
	}
}