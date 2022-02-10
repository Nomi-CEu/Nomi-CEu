interface Latest {
	release: string;
	snapshot: string;
}

interface Version {
	id: string;
	type: string;
	url: string;
	time: Date;
	releaseTime: Date;
}

export interface VersionsManifest {
	latest: Latest;
	versions: Version[];
}
