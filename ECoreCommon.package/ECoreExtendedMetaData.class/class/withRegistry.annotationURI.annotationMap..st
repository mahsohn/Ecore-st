as yet unclassified
withRegistry: aRegistry annotationURI: aAnnotationURI annotationMap: aAnnotationMap
	| instance |
	instance := (super new)
	registry: aRegistry;
	annotationURI: aAnnotationURI;
	annotationMap: aAnnotationMap;
	demandRegistry: EPackageRegistry new;
	yourself.
	aAnnotationURI ~= self ANNOTATION_URI ifTrue: 
		[ instance extendedMetaDataHolderCache: Dictionary new ].
	^ instance