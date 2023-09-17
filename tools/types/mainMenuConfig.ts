// Bare minimum.
interface Slideshow {
	displayDuration: number;
	fadeDuration: number;
	images: string[];
}

interface Background {
	image: string;
	slideshow: Slideshow;
}

interface Other {
	background: Background;
}

export interface MainMenuConfig {
	other: Other;
}
