// Examples of converting Salesforce data into a JSON Format
//1. Get Account data from Salesforce and convert to JSON
Account acc = [SELECT Id, Name, Phone, Website FROM Account WHERE ID != Null LIMIT 1];
String jsonAcc = JSON.serialize(acc);
System.debug('JSON Account: ' + jsonAcc);
String jsonAccPretty = JSON.serializePretty(acc);
System.debug('JSON Account Pretty: ' + jsonAccPretty);
//2. Get Contact data from salesforce and convert to JSON
List<Contact> conList = [SELECT Id, FirstName, LastName, Email, Phone, MailingAddress FROM Contact WHERE ID!= Null LIMIT 5];
String jsonCon = JSON.serialize(conList);
System.debug('JSON Contact: ' + jsonCon);
String jsonConPretty = JSON.serializePretty(conList);
System.debug('JSON Contact Pretty: ' + jsonConPretty);