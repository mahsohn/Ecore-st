accessing
processingKind
	processingKind ifNil: [ processingKind := ECoreExtendedMetaData basicGetProcessingKind: eStructuralFeature  ].
	^processingKind