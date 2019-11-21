as yet unclassified
getNamespace: object
 | result |
	(object isKindOf: EPackage) ifTrue: [
		(self isQualified: object) ifTrue: [ ^object getNsURI ]
		ifFalse: [ ^nil ]
	].
	(object isKindOf: EClassifier) ifTrue: [
		result := object ePackage.
		result ifNil: [ ^nil ] ifNotNil: [ ^self getNamespace:  object ]
	].
	(object isKindOf: EClassifier) ifTrue: [ ^ (self getExtendedMetaData: object) namespace ].
	^nil
		