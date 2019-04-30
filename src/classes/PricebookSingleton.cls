public with sharing class PricebookSingleton {
	private static Pricebook2 stdPricebook;

	public static Id getStdPricebookId() {
		return Test.isRunningTest() ? Test.getStandardPricebookId() : getStdPricebook().Id;
	}

	public static Pricebook2 getStdPricebook() {
		return (stdPricebook != null) ? stdPricebook : queryStdPricebook();
	}

	private static Pricebook2 queryStdPricebook() {
		return [
			SELECT Id,
				Name
			FROM Pricebook2
			WHERE IsStandard = true
			LIMIT 1];
	}
}