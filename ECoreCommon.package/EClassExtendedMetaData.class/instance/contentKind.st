as yet unclassified
contentKind
	contentKind ifNil: [ ECoreExtendedMetaData basicGetContentKind: eClass ].
	^contentKind