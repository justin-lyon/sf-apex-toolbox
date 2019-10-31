public with sharing class PricebookSingleton {

	private Pricebook2 stdPricebook;
	private static final PricebookSingleton instance = new PricebookSingleton();

	private PricebookSingleton() {}

	public static PricebookSingleton get() {
		return instance;
	}

	public Id getStdPricebookId() {
		return Test.isRunningTest() ? Test.getStandardPricebookId() : getStdPricebook().Id;
	}

	public Pricebook2 getStdPricebook() {
		return (stdPricebook != null) ? stdPricebook : queryStdPricebook();
	}

	private Pricebook2 queryStdPricebook() {
		return [
			SELECT Id,
				Name
			FROM Pricebook2
			WHERE IsStandard = true
			LIMIT 1];
	}
}
