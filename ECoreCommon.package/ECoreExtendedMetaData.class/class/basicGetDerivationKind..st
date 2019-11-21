as yet unclassified
basicGetDerivationKind: eClassifier
	| eAnnotation kind details|
	eAnnotation := self getAnnotation: eClassifier demandCreate: false.
	eAnnotation ifNotNil: [ 
		details := (eAnnotation getDetails).
		kind := details get: 'restrictions'.
		kind ifNotNil: [ ^ ECoreExtendedMetaData RESTRICTED_DERIVATION ].
		kind := details get: 'list'.
		kind ifNotNil: [ ^ ECoreExtendedMetaData LIST_DERIVATION ].
		kind := details get: 'union'.
		kind ifNotNil: [ ^ ECoreExtendedMetaData UNION_DERIVATION ].
	].
	^1