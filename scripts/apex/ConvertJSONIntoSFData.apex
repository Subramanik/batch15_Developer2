// Learn How to convert JSON String into a Salesforce Data.

String jsonStr ='{"attributes":{"type":"Account","url":"/services/data/v58.0/sobjects/Account/0012t00000Ro35WAAR"},"Id":"0012t00000Ro35WAAR","Name":"Sample Account for Entitlements"}';

Account acc = (Account)JSON.deserialize(jsonStr, Account.class);

System.debug('Account Id: ' + acc.Id);
System.debug('Account Name: ' + acc.Name);