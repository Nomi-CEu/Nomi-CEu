interface Author {
	name: string;
	url: string;
	projectId: number;
	id: number;
	projectTitleId?: number;
	projectTitleTitle: string;
	userId: number;
	twitchId?: number;
}

interface Attachment {
	id: number;
	projectId: number;
	description: string;
	isDefault: boolean;
	thumbnailUrl: string;
	title: string;
	url: string;
	status: number;
}

export interface CurseForgeFileInfo {
	id: number;
	displayName: string;
	fileName: string;
	fileDate: Date;
	fileLength: number;
	releaseType: number;
	fileStatus: number;
	downloadUrl: string;
	isAlternate: boolean;
	alternateFileId: number;
	dependencies: Dependency[];
	isAvailable: boolean;
	modules: Module[];
	gameVersion: string[];
	sortableGameVersion: SortableGameVersion[];
	hasInstallScript: boolean;
	isCompatibleWithClient: boolean;
	categorySectionPackageType: number;
	restrictProjectFileAccess: number;
	projectStatus: number;
	renderCacheId: number;
	packageFingerprintId: number;
	gameVersionDateReleased: Date;
	gameVersionMappingId: number;
	gameVersionId: number;
	gameId: number;
	isServerPack: boolean;
}

interface Category {
	categoryId: number;
	name: string;
	url: string;
	avatarUrl: string;
	parentId: number;
	rootId: number;
	projectId: number;
	avatarId: number;
	gameId: number;
}

interface CategorySection {
	id: number;
	gameId: number;
	name: string;
	packageType: number;
	path: string;
	initialInclusionPattern: string;
	gameCategoryId: number;
}

interface GameVersionLatestFile {
	gameVersion: string;
	projectFileId: number;
	projectFileName: string;
	fileType: number;
}

export interface CurseForgeModInfo {
	id: number;
	name: string;
	authors: Author[];
	attachments: Attachment[];
	websiteUrl: string;
	gameId: number;
	summary: string;
	defaultFileId: number;
	downloadCount: number;
	latestFiles: CurseForgeFileInfo[];
	categories: Category[];
	status: number;
	primaryCategoryId: number;
	categorySection: CategorySection;
	slug: string;
	gameVersionLatestFiles: GameVersionLatestFile[];
	isFeatured: boolean;
	popularityScore: number;
	gamePopularityRank: number;
	primaryLanguage: string;
	gameSlug: string;
	gameName: string;
	portalName: string;
	dateModified: Date;
	dateCreated: Date;
	dateReleased: Date;
	isAvailable: boolean;
	isExperiemental: boolean;
}

export interface CurseForgeFetchedFileInfo {
	id: number;
	gameId: number;
	modId: number;
	isAvailable: boolean;
	displayName: string;
	fileName: string;
	releaseType: number;
	fileStatus: number;
	hashes?: Hash[];
	fileDate: Date;
	fileLength: number;
	downloadCount: number;
	downloadUrl?: string;
	gameVersions: string[];
	sortableGameVersions: SortableGameVersion[];
	dependencies: Dependency[];
	alternateFileId: number;
	isServerPack: boolean;
	fileFingerprint: number;
	modules: Module[];
}

interface Dependency {
	modId: number;
	relationType: number;
}

interface Hash {
	value: string;
	algo: number;
}

interface Module {
	name: string;
	fingerprint: number;
}

interface SortableGameVersion {
	gameVersionName: string;
	gameVersionPadded: string;
	gameVersion: string;
	gameVersionReleaseDate: Date;
	gameVersionTypeId: number;
}
