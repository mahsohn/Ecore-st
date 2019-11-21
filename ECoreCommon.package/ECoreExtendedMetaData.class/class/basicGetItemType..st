as yet unclassified
basicGetItemType: eDataType
	| eAnnotation details itemType type |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	eAnnotation ifNotNil: [ 
		details := eAnnotation getDetails.
		itemType := details get: 'itemType'.
		type := self getEClassifier: eDataType getEPackage type: itemType.
		(type isKindOf: EDataType) ifTrue: [ ^type ]
	].
	^nil