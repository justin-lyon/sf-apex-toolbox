@isTest
private class TriggerBypassTest {

	static TestMethod void isActive_forceFailure_shouldThrowException() {
		TriggerBypassDAMock bypassMock = new TriggerBypassDAMock();
		bypassMock.IsSuccess = false;

		String triggerName = 'Case';
		TriggerBypass bypass = new TriggerBypass(bypassMock);
		Boolean isSuccess = false;
		Test.startTest();

			try {
				bypass.isActive(triggerName);
			} catch(TriggerBypass.TriggerBypassException tbex) {
				isSuccess = true;
			}

		Test.stopTest();

		System.assert(isSuccess, 'Lack of metadata record should throw a TriggerBypassException.');
	}

	static TestMethod void isActive_givenCase_shouldEvaluateToTrue() {
		TriggerBypassDAMock bypassMock = new TriggerBypassDAMock();

		String triggerName = 'Case';
		TriggerBypass bypass = new TriggerBypass(bypassMock);
		Test.startTest();

			Boolean isSuccess = bypass.isActive(triggerName);

		Test.stopTest();

		System.assert(isSuccess, 'The Case Trigger should be on.');
	}

	static TestMethod void isActive_givenCase_shouldEvaluateToFalse() {
		TriggerBypassDAMock bypassMock = new TriggerBypassDAMock();
		bypassMock.IsActive = false;

		String triggerName = 'Case';
		TriggerBypass bypass = new TriggerBypass(bypassMock);
		Test.startTest();

			Boolean isSuccess = !bypass.isActive(triggerName);

		Test.stopTest();

		System.assert(isSuccess, 'The Case Trigger should be on.');
	}
}