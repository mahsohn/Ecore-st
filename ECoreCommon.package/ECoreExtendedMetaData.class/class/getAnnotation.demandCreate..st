as yet unclassified
getAnnotation: eModelElement demandCreate: demandCreate
	| result map|
	map := self instance annotationMap.
	map ifNotNil: [ 
		result := map at: eModelElement ifAbsent: nil.
		(result isNil & demandCreate) ifTrue: [ 
			result := ECoreFactory createEAnnotation.
			result source: self instance annotationURI.
			map at:eModelElement put: result.
			 ].
		^result
	]
	ifNil: [ 
		result := eModelElement eAnnotation: self instance annotationURI.
		(result isNil & demandCreate) ifTrue: [ 
			result := ECoreFactory createEAnnotation.
			result source: self instance annotationURI.
			eModelElement eAnnotations put: result
		].
		^result
	]