# sf-apex-toolbox

> Some small utility classes for working with Salesforce Apex.

## Deploy to Salesforce

Using the [githubsfdeploy app](https://github.com/afawcett/githubsfdeploy), add this code to your Salesfore Org.

<a target="_blank" rel="noopener noreferrer" href="https://githubsfdeploy.herokuapp.com/app/githubdeploy/jlyon87/sf-apex-toolbox"><img src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png" alt="Button" style="max-width:100%;"></a>

## Usage

### PricebookSingleton

> Retrieve the standard pricebook or standard pricebook Id from anywhere.

```java
Id stdPricebookId = PricebookSingleton.getStdPricebookId();
Pricebook2 stdPricebook = PricebookSingleton.getStdPricebook();
```

### ToolBox

> Generic Helpers for Salesforce Apex development.

```java
Schema.SObjectType accountType = ToolBox.getSObjectType('Account');
Schema.SObjectType accountType = ToolBox.getSObjectType('001000000000000');
Id recordTypeId = ToolBox.getRecordTypeId('Case', 'Master');
Map<String, Id> recordTypeIdsByDeveloperName = ToolBox.getRecordTypeIdsByObject('Case');
List<Schema.PicklistEntry> entries = ToolBox.getPicklistEntries('Account', 'Type');
```

### TriggerBypass

> Disable Triggers by Configuration. Very useful for production trigger control.

```java
// User.trigger
trigger User on User (after insert, after update) {

    // Determine if the CustomMetadata Record is active.
    if(TriggerBypass.isActive('User')) {
        // Trigger logic
    }

    // Will throw TriggerBypass.TriggerBypassException if the CustomMetadata record does not exist.
}
```

### MockIdGenerator

> Generate unique Salesforce Record Ids by SObjectType or SObject

```java
// Construct with SObject or SObjectType
MockIdGenerator idGenBySObject = new MockIdGenerator(new Account());
MockIdGenerator idGenBySObjectType = new MockIdGenerator(Account.SObjectType);

// All IDs are unique, and can be invoked as a static method too.
Id newMockId = idGenBySObject.getMockId();
Id anotherMockId = idGenBySObjectType.getMockId();
Id stateslessMockId = MockIdGenerator.getMockId(Account.SObjectType);

System.debug(newMockId); // -> 001000000000001AAA
System.debug(anotherMockId); // -> 001000000000002AAA
System.debug(statelessMockId); // -> 001000000000003AAA
```
