as yet unclassified
basicGetMemberTypes: eDataType
	| eAnnotation memberTypes result ePackage type |
	eAnnotation := self getAnnotation: eDataType demandCreate: false.
	result := OrderedCollection new.
	eAnnotation ifNotNil: [ 
		memberTypes := eAnnotation getDetails get: 'memberTypes'.
		memberTypes ifNotNil: [ 
			ePackage := eDataType getEPackage.
			memberTypes do: [ :member |
				type := self getEClassifier: ePackage type: member.
				(type isKindOf: EDataType) ifTrue: [ result add: type ]
			]
		]
	].
	^result
