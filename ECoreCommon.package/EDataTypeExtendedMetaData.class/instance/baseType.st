as yet unclassified
baseType
	baseType ifNil: [ baseType := ECoreExtendedMetaData basicGetBaseType: eDataType ].
	^baseType