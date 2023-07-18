// Call SOAP API methods:

//1. Park Service
String[] parks = SoapCallouts.parksCallout('India');
System.debug('Parks: ' + parks);

//2. Calculator Service - Addition
SoapCallouts.doAddCallout(10, 10);

// 3. Calculator Service - Subtraction
SoapCallouts.doSubtractCallout(100, 50);

//4. Calculator Service - Multiplication
SoapCallouts.doMultiplyCallout(10, 10);

//5. Calculator Service - Division
SoapCallouts.doDivideCallout(100, 10);
