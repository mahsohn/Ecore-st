as yet unclassified
totalDigitsFacet
	totalDigits ifNil: [ totalDigits := ECoreExtendedMetaData basicGetTotalDigitsFacet: eDataType ].
	^totalDigits