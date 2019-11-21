initialization
initialize 
	annotationURI := ECoreExtendedMetaData ANNOTATION_URI.
	registry := EPackageRegistry instance.
	demandRegistry := EPackageRegistry new.
	extendedMetaDataHolderCache := Dictionary new.
	annotationMap := Dictionary new.