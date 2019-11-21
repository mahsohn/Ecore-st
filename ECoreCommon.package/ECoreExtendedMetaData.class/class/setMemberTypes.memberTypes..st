initialization
setMemberTypes: eDataType memberTypes: memberTypes
	| eAnnotation namespace result|
	(memberTypes size isZero) ifTrue: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: false.
		eAnnotation ifNotNil: [ eAnnotation getDetails removeKey: 'memberTypes' ]
	]
	ifFalse: [ 
		eAnnotation := self getAnnotation: eDataType demandCreate: true.
		namespace := self getNamespace: eDataType.
		result := ''.
		memberTypes do: [ :m | result := result, (self getQualifiedName: namespace eClassifier: m), ' ' ].
		(eAnnotation getDetails) 
		at: 'memberTypes' 
		put: (result copyFrom: 1 to: (memberTypes size) - 1)
	].
	(self getExtendedMetaData: eDataType) setMemberTypes: memberTypes