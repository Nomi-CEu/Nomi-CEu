interface CurseForgeAuthor {
	id: number;
	name: string;
	url: string;
}

export interface CurseForgeFileInfo {
	id: number;
	gameId: number;
	modId: number;
	isAvailable: boolean;
	displayName: string;
	fileName: string;
	releaseType: number;
	fileStatus: number;
	hashes: CurseForgeHash[];
	fileDate: Date;
	fileLength: number;
	downloadCount: number;
	fileSizeOnDisk: number | undefined;
	downloadUrl: string;
	gameVersions: string[];
	sortableGameVersions: CurseForgeSortableGameVersion[];
	dependencies: CurseForgeDependency[];
	exposeAsAlternative: boolean | undefined;
	parentProjectFileId: number | undefined;
	alternateFileId: number | undefined;
	isServerPack: boolean | undefined;
	serverPackFileId: number | undefined;
	isEarlyAccessContent: boolean | undefined;
	earlyAccessEndDate: Date | undefined;
	fileFingerprint: number;
	modules: CurseForgeModule[];
}

interface CurseForgeCategory {
	id: number;
	gameId: number;
	name: string;
	slug: string;
	url: string;
	iconUrl: string;
	dateModified: Date;
	isClass: boolean;
	classId: number;
	parentCategoryId: number;
}

interface CurseForgeFileIndex {
	gameVersion: string;
	fileId: number;
	fileName: string;
	releaseType: number;
	gameVersionTypeId: number;
	modLoader: number;
}

interface CurseForgeLinkInfo {
	websiteUrl: string;
	wikiUrl: string;
	issuesUrl: string;
	sourceUrl: string;
}

interface CurseForgeAsset {
	id: number;
	modID: number;
	title: string;
	description: string;
	thumbnailUrl: string;
	url: string;
}

export interface CurseForgeModInfo {
	id: number;
	gameId: number;
	name: string;
	slug: string;
	links: CurseForgeLinkInfo;
	summary: string;
	status: number;
	downloadCount: number;
	isFeatured: boolean;
	primaryCategoryId: number;
	categories: CurseForgeCategory[];
	classId: number;
	authors: CurseForgeAuthor[];
	logo: CurseForgeAsset;
	screenshots: CurseForgeAsset[];
	mainFileId: number;
	latestFiles: CurseForgeFileInfo[];
	latestFilesIndexes: CurseForgeFileIndex[];
	latestEarlyAccessFilesIndexes: CurseForgeFileIndex[];
	dateCreated: Date;
	dateModified: Date;
	dateReleased: Date;
	allowModDistribution: boolean;
	gamePopularityRank: number;
	isAvailable: boolean;
	thumbsUpCount: number;
}

interface CurseForgeDependency {
	modId: number;
	relationType: number;
}

interface CurseForgeHash {
	value: string;
	algo: number;
}

interface CurseForgeModule {
	name: string;
	fingerprint: number;
}

interface CurseForgeSortableGameVersion {
	gameVersionName: string;
	gameVersionPadded: string;
	gameVersion: string;
	gameVersionReleaseDate: Date;
	gameVersionTypeId: number;
}
