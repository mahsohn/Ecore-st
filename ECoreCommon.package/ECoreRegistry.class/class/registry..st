accessing
registry: classLoader
	"Returns the package registry associated with the given class loader"

	| result |
	result := classLoaderToRegistryMap at: classLoader ifAbsent: [ 
			classLoader ifNotNil: [ 
				result := EPackageRegistry new: (self registry: (classLoader parent)).
				classLoaderToRegistryMap at: classLoader put: result.
				 ]
		 ].
	^result