testing
basicIsQualified: ePackage
	| eAnnotation |
	eAnnotation := self getAnnotation: ePackage demandCreate: false.
	^(eAnnotation ifNil | 'false' ~= (eAnnotation getDetails get: 'qualified'))