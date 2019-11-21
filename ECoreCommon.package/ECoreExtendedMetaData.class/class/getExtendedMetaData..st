as yet unclassified
getExtendedMetaData: eClassifier
	| result holder cache|
	cache := self instance extendedMetaDataHolderCache.
	cache ifNotNil: [ 
		result := cache at: eClassifier ifAbsent: nil.
		result ifNil: [ 
			result := self createEClassifierExtendedMetaData: eClassifier.
			cache at: eClassifier put: result
			].
		^result
	]
	ifNil: [ 
		holder := eClassifier.
		result := holder getExtendedMetaData.
		result ifNil: [ 
			result := self createEClassifierExtendedMetaData: eClassifier.
			holder setExtendedMetaData: result 
		].
		^result
	]