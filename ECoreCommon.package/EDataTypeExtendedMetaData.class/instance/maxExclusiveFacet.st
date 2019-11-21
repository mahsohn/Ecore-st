as yet unclassified
maxExclusiveFacet
	maxExclusive ifNil: [ maxExclusive := ECoreExtendedMetaData basicGetMaxExclusiveFacet: eDataType ].
	^maxExclusive