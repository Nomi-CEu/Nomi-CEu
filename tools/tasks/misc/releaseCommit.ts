import fs from "fs";
import upath from "upath";
import gulp from "gulp";
import yaml from "js-yaml";

import { issueTemplatesFolder } from "../../globals";
import { IssueInput } from "../../types/issueInput";

// The name of the 'body' object.
const bodyID: string = 'body';

// The id of the version input field, in both Issue Templates.
const versionInputID: string = 'version';

// Temp/Debug
const tempVersionField: string = '2.0';

async function updateIssueTemplate(filepath : string) {
    // Load the yaml file, and get its 'body'
    const file: object = yaml.load(await fs.promises.readFile(filepath));
    const fileBody: object[] = file[bodyID];

    const newFileBody: object[] = [];
    fileBody.forEach((input: IssueInput) => {
        if (input.id == versionInputID) {
            const versions: string[] = input.attributes.options;

            // Add new version to start of list
            versions.unshift(tempVersionField);

            // Load new version list
            input.attributes.options = versions; // May not be needed, but just incase
        }
        newFileBody.push(input);
    });

    // Set new file body
    file[bodyID] = newFileBody; // May not be needed
    
    // Write file
    fs.promises.writeFile(filepath, yaml.dump(file));
}

// This can be added to with new issue templates.
export async function updateIssueTemplates() : Promise<void> {
    updateIssueTemplate(upath.join(issueTemplatesFolder, "001-bug-report.yml"));
    updateIssueTemplate(upath.join(issueTemplatesFolder, "002-feature-request.yml"));
}