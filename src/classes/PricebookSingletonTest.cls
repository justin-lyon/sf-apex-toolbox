@isTest
private class PricebookSingletonTest {

	@TestSetup
	static void setupData() {
		Pricebook2 stdPricebook = new Pricebook2(
			Id = Test.getStandardPricebookId());
		update stdPricebook;
	}

	static TestMethod void getStdPricebookId_shouldGetId() {
		PricebookSingleton instance = PricebookSingleton.get();

		Test.startTest();

			Id stdPricebookId = instance.getStdPricebookId();

		Test.stopTest();

		System.assertNotEquals(null, stdPricebookId);
	}

	static TestMethod void getStdPricebook_shouldGetStdPricebook() {
		PricebookSingleton instance = PricebookSingleton.get();

		Test.startTest();

			Pricebook2 stdPricebook = instance.getStdPricebook();

		Test.stopTest();

		System.assertNotEquals(null, stdPricebook);
	}

	static TestMethod void instance_givenTwoGets_shouldGetOneInstance() {
		PricebookSingleton instance1 = PricebookSingleton.get();
		PricebookSingleton instance2 = PricebookSingleton.get();

		Integer hash1 = System.hashCode(instance1);
		Integer hash2 = System.hashCode(instance2);

		System.assertEquals(hash1, hash2);
	}
}
