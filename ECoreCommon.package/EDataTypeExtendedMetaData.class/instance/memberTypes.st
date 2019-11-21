as yet unclassified
memberTypes
	memberTypes ifNil: [ memberTypes := ECoreExtendedMetaData basicGetMemberTypes: eDataType ].
	^memberTypes