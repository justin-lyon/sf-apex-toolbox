@isTest
private class TriggerBypassTest {

	static TestMethod void isActive_forceFailure_shouldThrowException() {
		TriggerBypassDAMock bypassMock = new TriggerBypassDAMock();
		bypassMock.IsSuccess = false;

		String triggerName = 'Case';
		TriggerBypass.BypassDI = bypassMock;

		Boolean isSuccess = false;
		Test.startTest();

			try {
				TriggerBypass.isActive(triggerName);
			} catch(TriggerBypass.TriggerBypassException tbex) {
				isSuccess = true;
			}

		Test.stopTest();

		System.assert(isSuccess, 'Lack of metadata record should throw a TriggerBypassException.');
	}

	static TestMethod void isActive_givenCase_shouldEvaluateToTrue() {
		TriggerBypassDAMock bypassMock = new TriggerBypassDAMock();

		String triggerName = 'Case';
		TriggerBypass.BypassDI = bypassMock;
		Test.startTest();

			Boolean isSuccess = TriggerBypass.isActive(triggerName);

		Test.stopTest();

		System.assert(isSuccess, 'The Case Trigger should be on.');
	}

	static TestMethod void isActive_givenCase_shouldEvaluateToFalse() {
		TriggerBypassDAMock bypassMock = new TriggerBypassDAMock();
		bypassMock.IsActive = false;

		String triggerName = 'Case';
		TriggerBypass.BypassDI = bypassMock;
		Test.startTest();

			Boolean isSuccess = !TriggerBypass.isActive(triggerName);

		Test.stopTest();

		System.assert(isSuccess, 'The Case Trigger should be on.');
	}
}