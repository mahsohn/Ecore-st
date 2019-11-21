as yet unclassified
patterFacet
	pattern ifNil: [ pattern := ECoreExtendedMetaData basicGetPatternFacet: eDataType ].
	^pattern