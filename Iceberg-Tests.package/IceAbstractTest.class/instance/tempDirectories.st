auxiliar
tempDirectories
	^ { 
		self defaultLocationForLocalClonedRepository.
		self defaultLocationForGithubClonedRepository.
		self defaultLocationForGitFileTreeRepository.
	}