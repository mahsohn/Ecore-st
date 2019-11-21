as yet unclassified
basicGetBaseType: eDataType
	| eAnnotation details baseType type |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	eAnnotation ifNotNil: [ 
		details := eAnnotation getDetails.
		baseType := details get: 'baseType'.
		type := self getEClassifier: eDataType getEPackage type: baseType.
		(type isKindOf: EDataType) ifTrue: [ ^type ]
	].
	^nil