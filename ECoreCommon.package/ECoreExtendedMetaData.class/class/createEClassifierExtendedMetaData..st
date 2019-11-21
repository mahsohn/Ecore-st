as yet unclassified
createEClassifierExtendedMetaData: eClassifier
	(eClassifier isKindOf: EClass) ifTrue: [ ^ EClassExtendedMetaData new: eClassifier ]
	ifFalse: [ ^EDataTypeExtendedMetaData new: eClassifier ]