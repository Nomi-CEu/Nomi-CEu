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

interface Dependency {
	id: number;
	addonId: number;
	type: number;
	fileId: number;
}

interface Module {
	foldername: string;
	type: number;
}

interface SortableGameVersion {
	gameVersionPadded: string;
	gameVersion: string;
	gameVersionReleaseDate: Date;
	gameVersionName: string;
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

interface Dependency {
	addonId: number;
	type: number;
}

interface Module {
	foldername: string;
	fingerprint: unknown;
}

export interface CurseForgeFetchedFileInfo {
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
	packageFingerprint: number;
	gameVersion: string[];
	hasInstallScript: boolean;
	gameVersionDateReleased: Date;
}
