export interface IssueInput {
    "type": string;
    "id": string;
    "attributes": VersionAttributes;
}

export interface VersionAttributes {
    "label": string;
    "description": string;
    "options": string[];
}