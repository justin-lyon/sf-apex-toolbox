# sf-apex-toolbox

> Some small utility classes for working with Salesforce Apex.

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
