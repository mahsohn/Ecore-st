as yet unclassified
maxLengthFacet
	maxLength ifNil: [ maxLength := ECoreExtendedMetaData basicGetMaxLengthFacet: eDataType ].
	^maxLength