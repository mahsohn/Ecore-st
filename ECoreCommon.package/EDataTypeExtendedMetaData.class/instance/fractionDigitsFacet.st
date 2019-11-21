as yet unclassified
fractionDigitsFacet
	fractionDigits ifNil: [ fractionDigits := ECoreExtendedMetaData basicGetFractionDigitsFacet: eDataType ].
	^fractionDigits 